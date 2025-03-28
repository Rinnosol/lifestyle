from flask import Flask, make_response, render_template, request, redirect, url_for, session
import mysql.connector
import bcrypt
import datetime
import pymysql

app = Flask(__name__)
app.secret_key = "your_secret_key"  # Secret key for session management

# Database connection function
def get_db_connection():
    return pymysql.connect(
        host="localhost",
        user="root",
        password="root",
        database="lifestyle"
    )

# Home Page
@app.route('/')
def home():
    if 'user_id' in session:
        return redirect(url_for('dashboard'))
    return render_template('home.html')

# Register User
@app.route('/register', methods=['GET', 'POST'])
def register_user():
    if request.method == 'POST':
        data = request.form
        username = data['username']
        password = data['password']
        email = data['email']     
        
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO users (username, password, email) VALUES (%s, %s, %s)", (username, password, email))
        conn.commit()
        cursor.close()
        conn.close()
        
        return redirect(url_for('login_user'))
    return render_template('register.html')

# Login User
@app.route('/login', methods=['GET', 'POST'])
def login_user():
    if request.method == 'POST':
        data = request.form
        username = data['username']
        password = data['password']
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM users WHERE username = %s", (username))
        user = cursor.fetchone()        
        cursor.close()
        conn.close()
        
      
        if user and password == user[2]:
            session['user_id'] = user[0]  # Store user ID in session
            return redirect(url_for('dashboard'))
        #return 'Invalid credentials', 401      
        return render_template('login.html', error='Invalid credentials')

    return render_template('login.html')

# Dashboard Page
@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect(url_for('login_user'))
    
    user_id = session['user_id']    
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT workout_type,duration,date FROM workouts WHERE user_id = %s ORDER BY date DESC LIMIT 1", (user_id))
    last_workout = cursor.fetchone()     
    
    cursor.execute("SELECT meal_type,calories,date FROM meals WHERE user_id = %s ORDER BY date DESC LIMIT 1", (user_id))
    last_meal = cursor.fetchone()

    cursor.execute("SELECT username FROM users WHERE user_id = %s", (user_id))
    username = cursor.fetchone()
    
    cursor.execute("SELECT sleep_duration,date FROM sleep_logs WHERE user_id = %s ORDER BY date DESC LIMIT 1", (user_id))
    last_sleep = cursor.fetchone()    
    cursor.close()
    conn.close()        
    return render_template('dashboard.html', username=username, last_workout=last_workout, last_meal=last_meal, last_sleep=last_sleep)

# Workout Logging Page
@app.route('/workout', methods=['GET', 'POST'])
def log_workout():
    if 'user_id' not in session:
        return redirect(url_for('login_user'))
    
    if request.method == 'POST':
        user_id = session['user_id']
        workout_type = request.form['workout_type']
        duration = request.form['duration']
        date = datetime.datetime.now()
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO workouts (user_id, workout_type, duration, date) VALUES (%s, %s, %s, %s)", 
                       (user_id, workout_type, duration, date))
        conn.commit()
        cursor.close()
        conn.close()
        
        return redirect(url_for('dashboard'))
    
    if request.method == 'GET':
        user_id = session['user_id']        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * from  bestworkouts")
        bestworkout = cursor.fetchall()
        conn.commit()
        cursor.close()
        conn.close()
        
        #return redirect(url_for('dashboard'))
        return render_template('Log_workout.html',  bestworkout = bestworkout)

    
    return render_template('log_workout.html')

#Nutrion page

@app.route('/nutrition', methods=['GET'])
def nutrition():
    if 'user_id' not in session:
        return redirect(url_for('login_user'))
    
    if request.method == 'GET':
        user_id = session['user_id']        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * from  nutrition")
        nutrition = cursor.fetchall()
        conn.commit()
        cursor.close()
        conn.close()
        
        #return redirect(url_for('dashboard'))
        return render_template('nutrition.html', nutrition = nutrition)
    
    return render_template('log_workout.html')


# Meal Logging Page
@app.route('/meal', methods=['GET', 'POST'])
def log_meal():
    if 'user_id' not in session:
        return redirect(url_for('login_user'))
    
    if request.method == 'POST':
        user_id = session['user_id']
        meal_type = request.form['meal_type']
        calories = request.form['calories']
        date = datetime.datetime.now()
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO meals (user_id, meal_type, calories, date) VALUES (%s, %s, %s, %s)", 
                       (user_id, meal_type, calories, date))
        conn.commit()
        cursor.close()
        conn.close()
        
        return redirect(url_for('dashboard'))
    
    return render_template('log_meal.html')

#Set Goal

@app.route('/goal', methods=['GET', 'POST'])
def goal():
    if 'user_id' not in session:
        return redirect(url_for('login_user'))
    
    if request.method == 'POST':
        user_id = session['user_id']
        sleep = request.form['sleep']
        workout = request.form['workout']
        meal = request.form['meal']
        date = datetime.datetime.now()        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO goal (user_id,sleep,workout,meal,date) VALUES (%s, %s, %s,%s,%s)", (user_id, sleep,workout,meal,date))
        conn.commit()
        cursor.close()
        conn.close()        
        return render_template('goal.html')
    
    if request.method == 'GET':
        user_id = session['user_id']        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM goal WHERE user_id = %s ORDER BY date DESC LIMIT 1", (user_id))
        goal = cursor.fetchall()
        conn.commit()
        cursor.close()
        conn.close()        
        #return redirect(url_for('dashboard'))
        return render_template('goal.html', goal = goal)
    
    return render_template('log_sleep.html')
    


# Sleep Logging Page
@app.route('/sleep', methods=['GET', 'POST'])
def log_sleep():
    if 'user_id' not in session:
        return redirect(url_for('login_user'))
    
    if request.method == 'POST':
        user_id = session['user_id']
        sleep_duration = request.form['sleep_duration']
        date = datetime.datetime.now()
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO sleep_logs (user_id, sleep_duration, date) VALUES (%s, %s, %s)", 
                       (user_id, sleep_duration, date))
        conn.commit()
        cursor.close()
        conn.close()
        
        return redirect(url_for('dashboard'))
    if request.method == 'GET':
        user_id = session['user_id']        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * from  sleep_habits")
        sleephabit = cursor.fetchall()
        conn.commit()
        cursor.close()
        conn.close()        

        return render_template('Log_Sleep.html',  sleephabit = sleephabit) 
    
    return render_template('log_sleep.html')

# Logout User
@app.route('/logout')
def logout():
    session.pop('user_id', None)  # Remove user from session
    return redirect(url_for('home'))  # Redirect to home page

if __name__ == '__main__':
    app.run(debug=True)
