""" how i have executed this code :
1. go to anaconda prompt
2. go to the location of the applications/app 
3. run python -m flask run

"""

from flask import Flask
"""
app is a new application, a flask application.
__name__ representing the current file

"""
app = Flask(__name__)

"""
flask is designed in terms of routes
route is tpart of url
/ default webpage
when the user goes to / then this is the function (index) will run
"""
@app.route("/")
def index():
    return "Hello, world!"
