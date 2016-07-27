from collections import namedtuple
from flask import Flask, render_template, session, redirect, url_for, flash
from flask_bootstrap import Bootstrap
from flask_wtf import Form
from wtforms import StringField, SubmitField, BooleanField, validators, PasswordField
from wtforms.validators import Required
import pymysql

app = Flask(__name__)
app.config['SECRET_KEY'] = 'hard to guess string'
bootstrap = Bootstrap(app)

class LoginForm(Form):
    email = StringField('Email address', validators=[Required()])
    password = PasswordField('Password')
    submit = SubmitField('Log in')

class RegistrationForm(Form):
    name = StringField('Name', validators=[Required()])
    email = StringField('Email address', validators=[Required()])
    password = PasswordField('Password', validators=[Required()])
    name = StringField('Name on Credit Card', validators=[Required()])
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
    
class TripForm(Form):
    pass

class ActivityForm(Form):
    pass

class AttractionForm(Form):
    pass
    
@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegistrationForm()
    cursor = db.cursor()
    if form.validate_on_submit():
        cursor.execute("insert into user values (%s, %s, 0, 0, 1, %s)", (form.name.data, form.email.data, form.password.data) )
        flash('Success!')
    # if request.method == 'POST' and form.validate():
    #     user = User()
    #     user.name = form.name.data
    #     user.email = form.email.data
    #     user.save()
    #     redirect('register')
    return render_template('register.html', form=form)

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
            return redirect(url_for('home'))
        else:
            flash('Email address and password not found in customer database.')
            return redirect(url_for('index'))
    return render_template('index.html', form=form)


@app.route('/home')
def home():
    cursor = db.cursor()
    # cursor.execute(
    #     "select rental_id, date(rental_date),  " +
    #     "       date(rental_date + interval film.rental_duration day) as due_date, " +
    #     "       film.title " +
    #     "from rental join inventory using(inventory_id) " +
    #     "            join film using (film_id) "+
    #     "where customer_id = %s and return_date is null",
    #     (session['customer_id']))
    # Rental = namedtuple('Rental', ['rental_id', 'rental_date',
    #                                'due_date', 'film_title'])
    # rentals = [Rental._make(row) for row in cursor.fetchall()]
    # cursor.close()
    # return render_template('home.html', rentals=rentals,
    #                        customer=session['customer_name'])
    return render_template('home.html')

@app.route('/browse_db')
def browse_db():
    cursor = db.cursor()
    cursor.execute("show tables")
    tables = [field[0] for field in cursor.fetchall()[1:]]
    cursor.close()
    return render_template('browse_db.html', dbname=dbname, tables=tables)

@app.route('/browse_db')
def browse_attractions():
    cursor = db.cursor()
    cursor.execute("show tables")
    tables = [field[0] for field in cursor.fetchall()[1:]]
    cursor.close()
    return render_template('browse_db.html', dbname=dbname, tables=tables)

@app.route('/browse_db')
def browse_activities():
    cursor = db.cursor()
    cursor.execute("show tables")
    tables = [field[0] for field in cursor.fetchall()[1:]]
    cursor.close()
    return render_template('browse_db.html', dbname=dbname, tables=tables)

@app.route('/table/<table>')
def table(table):
    cursor = db.cursor()
    cursor.execute("select * from " + table)
    rows = cursor.fetchall()
    column_names = [desc[0] for desc in cursor.description]
    cursor.close()
    return render_template('table.html', table=table,
                           columns=column_names, rows=rows)

if __name__ == '__main__':
    dbname = 'team5_schema'
    db = pymysql.connect(host='localhost',
                         user='root', passwd='', db=dbname)
    app.run(debug=True)
    db.close()




