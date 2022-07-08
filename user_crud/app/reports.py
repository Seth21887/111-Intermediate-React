from app.database import get_db

def output_formatter(results):
    out = [] #tuples are orderd and immutable
    for result in results:
        user = {}
        user["id"] = result[0]
        user["first_name"] = result[1]
        user["last_name"] = result[2]
        user["hobbies"] = result[3]
        user["active"] = result[4]
        out.append(user) #adding that temporary dictionary to our user list.
    return out