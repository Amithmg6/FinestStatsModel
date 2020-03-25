import datetime

from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    now = datetime.datetime.now()
    new_year = now.month == 3 and now.day == 25
    return render_template("index.html", new_year=new_year)
