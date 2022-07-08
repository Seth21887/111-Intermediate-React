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

def scan():
    cursor = get_db().execute(
        "SELECT * FROM user WHERE active=1", ()
    ) #means give me all the active users
    results = cursor.fetchall()
    cursor.close()
    return output_formatter(results) #formatting the results....output_formatter will take the tuples it receives (all values) and convert into a dictionary which will work with JSON

def select_by_id(id):
    cursor = get_db().execute(
        "SELECT * FROM user WHERE id=? AND ACTIVE=1", (id, ) #have the trailing comma to ensure tuple
    )
    results = cursor.fetchall()
    cursor.close() #close database connection 
    return output_formatter(results)

#Create a new record in the user table, using triple double quotes can have a string span multiple lines.
def insert(data):

    query = """INSERT INTO user (
        first_name, 
        last_name, 
        hobbies
        ) VALUES (?, ?, ?)"""

    values = (
        data.get("first_name"),
        data.get("last_name"),
        data.get("hobbies")
    )
    cursor = get_db()
    cursor.execute(query, values)
    cursor.commit() #need to commit the changes or it won't stay in memory
    cursor.close()

    #SQL: UPDATE user set active=0 WHERE id=?
    def deactivate(id):
        """ Soft delete user """
        cursor = get_db()
        cursor.execute("UPDATE user set active=0 WHERE id=?", (id,))
        cursor.commit()
        cursor.close()