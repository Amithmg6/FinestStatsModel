from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    names = ["Amith M G","Alice", "Bob", "Charlie"]
    return render_template("index.html", names=names)
