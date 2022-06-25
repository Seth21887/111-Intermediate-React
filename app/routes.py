from flask import Flask         #from the flask module import the Flask class

app = Flask(__name__)           #Create an instance of the Flask class into app

@app.get("/")                   #Flask decorator that allows us to map a route to a view function. You can tell its a decorator by it starting with @
                                #app is now an object
def index():                    #Our view function: what flask calls a function that is mapped through a decorator.
    return "<h1>Hello, world!</h1>" #Return statement

# x = index() #this is a function call, the () must be used.

@app.get("/about")
def get_about():
    me = { #dictionary depicted by the {}
        "first_name": "Seth",
        "last_name": "LaFountain",
        "hobbies": "poker",
        "active": True
    }
    return me

