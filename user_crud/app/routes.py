from flask import (
    Flask,
    request #request transports data related to incoming requests
)

from datetime import datetime
from app.database import user

app = Flask(__name__) #just changes the name variable

VERSION = "1.0.0"

@app.get("/ping") #valuable endpoint just to check if the server is up
def ping():
    out = {
        "status": "ok",
        "message": "pong"
    }
    return out

@app.get("/version")
def get_version():
    out = {
        "status": "ok",
        "version": VERSION,
        "server_time": datetime.now().strftime("%F %H:%M:%S") #standard unix format for datetime
    }
    return out

@app.get("/users")
def get_all_users():
    user_list = user.scan()
    out = {
        "status": "ok",
        "users": user_list
    }
    return out

@app.get("/users/<int:pk>")
def get_user_by_id(pk):
    record = user.select_by_id(pk)
    out = {
        "status": "ok",
        "user": record
    }
    return out

@app.post("/users")
def create_user():
    user_data = request.json #request context object
    user.insert(user_data)
    return "", 204

@app.put("/users/<int:pk>")
def update_user(pk):
    user_data = request.json
    user.update(user.data, pk)
    return "", 204

@app.delete("/users/<int:pk>")
def delete_user(pk):
    user.deactivate(pk)
    return "", 204

@app.get("/reports/cars")
def users_and_vehicles():
    vehicle_report = reports.scan