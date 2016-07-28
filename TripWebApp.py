from collections import namedtuple
from flask import Flask, render_template, session, redirect, url_for, flash
from flask_bootstrap import Bootstrap
from flask_wtf import Form
from wtforms import StringField, SubmitField, BooleanField, validators, PasswordField, SelectField
from wtforms.validators import Required
import pymysql

app = Flask(__name__)
app.config['SECRET_KEY'] = 'hard to guess string'
bootstrap = Bootstrap(app)

#Creates log in form
class LoginForm(Form):
    email = StringField('Email address', validators=[Required()])
    password = PasswordField('Password')
    submit = SubmitField('Log in')

#Creates registration form
class RegistrationForm(Form):
    name = StringField('Name', validators=[Required()])
    email = StringField('Email address', validators=[Required()])
    password = PasswordField('Password', validators=[Required()])
    name_CC = StringField('Name on Credit Card', validators=[Required()])
    ccnumber = StringField('Credit Card Number', validators=[Required()])
    card_expdate = StringField('Credit Card Expiration Date', validators=[Required()])
    cvv = StringField('CVV', validators=[Required()])
    street_num = StringField('Street Number', validators=[Required()])
    street = StringField('Street Name', validators=[Required()])
    state = StringField('State', validators=[Required()])
    city = StringField('City', validators=[Required()])
    country = StringField('Country', validators=[Required()])
    zipcode = StringField('Zipcode', validators=[Required()])
    submit = SubmitField('Register')

#Create form to write a review
class ReviewForm(Form):
    attraction_review=SelectField('Attraction Name', choices=[('Metz Cathedral','Metz Cathedral'), ('Centre Pompidou-Metz','Centre Pompidou-Metz'), ('Museums of Metz','Museums of Metz'),('Eiffel Tower','Eiffel Tower'),('Louvre','Louvre'),('Notre Dame','Notre Dame'),('58 Tour Eiffel','58 Tour Eiffel'),('Brunch boat cruise','Brunch boat cruise'),('Colosseum','Colosseum'),('Pantheon','Pantheon'),('Trevi Fountain','Trevi Fountain')], validators=[Required()])
    title=StringField('Title of Review',validators=[Required()])
    review=StringField('Review', validators=[Required()])
    date=StringField('Date (yyyy-mm-dd)',validators=[Required()])
    submit = SubmitField('Submit')

#Creates a form that allow's user to create a trip
class CreateTripForm(Form):
    trip_city = SelectField(u'City', choices=[('Metz','Metz'), ('Paris','Paris'), ('Rome','Rome')],validators=[Required()])
    trip_start_date = StringField('Date (yyyy-mm-dd)',validators=[Required()]) 
    submit = SubmitField('Submit')

class ViewTripForm(Form):
    view_trip_city = SelectField(u'City of Trip', choices=[('Metz','Metz'), ('Paris','Paris'), ('Rome','Rome')],validators=[Required()])
    view_trip_date= StringField('Start Date of Trip (yyyy-mm-dd)',validators=[Required()])
    view_trip=SubmitField('View Trip')

#Insert new user's information into the database    
@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegistrationForm()
    cursor = db.cursor()
    if form.validate_on_submit():
        cursor.execute("insert into address (street_num, street, state, city, country, zip) values (%s, %s, %s, %s, %s, %s)", (form.street_num.data, form.street.data, form.state.data, form.city.data, form.country.data, form.zipcode.data) )
        cursor.execute("select address_id from address where street_num = %s and street = %s and state = %s and city = %s and country =%s and zip =%s", (form.street_num.data, form.street.data, form.state.data, form.city.data, form.country.data, form.zipcode.data) )
        rows=cursor.fetchall()
        session['address_id'] = rows[0][0]
        cursor.execute("insert into credit_card values (%s, %s, %s, %s,%s)", (form.name_CC.data,form.ccnumber.data,form.card_expdate.data, form.cvv.data, session['address_id']) )
        cursor.execute("insert into user values (%s,%s, 0, 0, %s, %s)", (form.name.data, form.email.data, session['address_id'],form.password.data) )
        flash('Success!')
    return render_template('register.html', form=form)

#Insert review into database
@app.route('/review', methods=['GET', 'POST'])
def review():
    form=ReviewForm()
    cursor = db.cursor()
    if form.validate_on_submit():
        cursor.execute("select attraction_id from attraction where name = %s", (form.attraction_review.data))
        rows=cursor.fetchall()
        session['attraction_id']=rows[0][0]
        cursor.execute("select attraction.name from attraction join activity using (attraction_id) join trip using (trip_id) where user_email=%s",(session['user_email']))
        rows=cursor.fetchall()
        if rows:
            for x in rows:
                for y in x: 
                    if form.attraction_review.data in y:                
                        cursor.execute("insert into review (body,title,date,author_email,attraction_id) values (%s,%s,%s,%s,%s)", (form.review.data,form.title.data,form.date.data,session['user_email'],session['attraction_id']) )
                        flash('Success!')
                        return redirect(url_for('review'))

                    else:   
                        flash("You did not go to this attraction")
                        return redirect(url_for('review'))
        else:
            flash("You did not go to any attraction")
        # If user had this attraction in their trip
    return render_template('review.html', form=form)

#Allows user to create a trip
@app.route('/createtrip', methods=['GET', 'POST'])
def createtrip():
    form = CreateTripForm()
    cursor = db.cursor()
    if form.validate_on_submit(): 
        cursor.execute("insert into trip (city,startdate,booked,user_email) values (%s,%s,'No',%s)", (form.trip_city.data,form.trip_start_date.data, session['user_email']) )
        cursor.execute("select trip_id from trip where city = %s and startdate = %s and user_email = %s", (form.trip_city.data,form.trip_start_date.data,session['user_email']) )
        rows = cursor.fetchall()
        session['trip_id']=rows[0][0]
        flash ('Success!')
    return render_template('createtrip.html', form=form)

@app.route('/viewtrip', methods=['GET', 'POST'])
def viewtrip():
    form = ViewTripForm()
    cursor = db.cursor()
    if form.validate_on_submit(): 
        cursor.execute("select trip_id from trip where city = %s and startdate= %s and user_email = %s",(form.view_trip_city.data,form.view_trip_date.data,session['user_email']))
        rows=cursor.fetchall()
        if rows:
            session['tripid'] = rows[0][0]
            flash('Success!')
            return redirect(url_for('viewtrip2'))
        else:
            flash('City and Start Date do not match')
            return redirect(url_for('viewtrip'))

    return render_template('viewtrip.html', form=form)

@app.route('/viewtrip2', methods=['GET', 'POST'])
def viewtrip2():
    cursor=db.cursor()
    cursor.execute("select * from trip")
    trips = cursor.fetchall()
    cursor.execute("select name, reservationnumber, startdatetime, enddatetime from activity where trip_id = %s", (session['tripid']))
    viewtrip=cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    return render_template ('viewtrip2.html',table=table,
        columns=column_names, rows=trips, vt= viewtrip)



#Log into website or prevent logging in from wrong credentials
@app.route('/', methods=['GET', 'POST'])
def index():
    form = LoginForm()
    if form.validate_on_submit():
        cursor = db.cursor()
        print("form.email.data=" + form.email.data)
        cursor.execute("select user_email,name from user where user_email = %s and password = %s;",
                       (form.email.data, form.password.data))
        rows = cursor.fetchall()
        if rows:
            print("successful login")
            session['user_email'] = rows[0][0]
            session['user_name'] = "{}".format(rows[0][1])
            return redirect(url_for('viewtrip'))
        else:
            flash('Email address and password not found in database.')
            return redirect(url_for('index'))
    return render_template('index.html', form=form)

#Create home page
@app.route('/home')
def home():
    cursor = db.cursor()
    cursor.execute("select * from trip")
    trip_rows = cursor.fetchall()
    trip_column_names = [desc[0] for desc in cursor.description]
    cursor.close()
    return render_template('home.html', rows=trip_rows)

#Create page to browse the database
@app.route('/browse_db')
def browse_db():
    cursor = db.cursor()
    cursor.execute("show tables")
    tables = [field[0] for field in cursor.fetchall()[1:]]
    cursor.close()
    return render_template('browse_db.html', dbname=dbname, tables=tables)

#Create attraction page
@app.route('/attractions')
def browse():
    cursor = db.cursor()
    cursor.execute("select name, description, price from attraction")
    attractions = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    cursor.close()
    return render_template('attractions.html', table=table,
                           columns=column_names, rows=attractions)

#Create trip page
@app.route('/trips')
def trips():
    cursor = db.cursor()
    cursor.execute("select * from trip")
    trips = cursor.fetchall()
    cursor.execute("select activity.reservationnumber, activity.name, activity.startdatetime, activity.enddatetime from activity join trip using (trip_id) where trip_id = activity.trip_id")
    activities = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    cursor.close()
    return render_template('trips.html', table=table,
        columns=column_names, rows=trips, acts=activities)

#Allows users to click on and view each table under "Explore DB"
@app.route('/table/<table>')
def table(table):
    cursor = db.cursor()
    cursor.execute("select * from " + table)
    rows = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    cursor.close()
    return render_template('table.html', table=table,
                           columns=column_names, rows=rows)

#Add attractions to trip
class AddAttractionForm(Form):
    submit = SubmitField('Add Attraction to Trip')

# Lists all attractions 
@app.route('/attractionpage')
def attractionpage():
    cursor = db.cursor()
    cursor.execute("select name from attraction")
    rows = cursor.fetchall()
    column_names =[desc[0] for desc in cursor.description]
    return render_template('attractionpage.html', columns=column_names, rows=rows)

# Lists attributes of a single attraction
@app.route('/attractions/<attraction>')
def attractions(attraction):
    cursor = db.cursor()
    cursor.execute("select description, price, requires_reservation from attraction where name = '" + attraction + "'")
    rows = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    cursor.execute("select activity.name from activity join attraction using (attraction_id) where attraction.name = '" + attraction + "'")
    activitynames = cursor.fetchall()
    cursor.execute("select photo_url from attraction where name = '" + attraction + "'")
    url=cursor.fetchall()
    url=url[0][0]
    # if form.validate_on_submit():
    #     cursor.execute("insert into activity (activity_id, attraction_id, name) values (%s, %s, %s)", )
    #     rows2=cursor.fetchall()
    #     session['attraction_id'] = rows[0][0]
    cursor.close()
    return render_template('attraction.html', attraction=attraction,
                           columns=column_names, rows=rows, activitynames=activitynames, url=url)

class AddActivityForm(Form):
    starttime = StringField('Start time YYYY-MM-DD HH:MM')
    endtime = StringField('End Time YYYY-MM-DD HH:MM')
    submit = SubmitField('Add activity to trip')

@app.route('/activities/<activity>')
def activity(activity):
    form = AddActivityForm()
    cursor = db.cursor()
    cursor.execute("select * from activity where name = %s", (activity))
    activity = cursor.fetchall()
    cursor.execute("select attraction.name from attraction join activity using (attraction_id) where activity.name = %s", (activity))
    attraction = cursor.fetchall()
    cursor.execute("select city from address join attraction using (address_id) where attraction.name = %s", (attraction[0][0]))
    city = cursor.fetchall()
    

    if form.validate_on_submit():
        cursor.execite("insert into activity ")

    return render_template('addactivity.html', form=form, activity=activity, attraction=attraction, city=city)

if __name__ == '__main__':
    dbname = 'team5_schema'
    db = pymysql.connect(host='localhost',
                         user='root', passwd='', db=dbname)
    app.run(debug=True)
    db.close()



