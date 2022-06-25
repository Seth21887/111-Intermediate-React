from flask import g     #stands for global, means of sending data from one point in application to another point in your application
import sqlite3

DATABASE_URL = "user_crud.db" #this is a constant and a global variable as it is defined outside of the scope of a function.

def get_db():
    db = getattr(g, "_database", None)
    if not db:
        db = g._database = sqlite3.connect(DATABASE_URL)
    return db
