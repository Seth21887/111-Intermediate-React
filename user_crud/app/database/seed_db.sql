
--- CREATE USERS TABLE ----
CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    hobbies TEXT,
    active BOOLEAN NOT NULL DEFAULT 1
);


--- INSERT DATA ---
INSERT INTO user (first_name, last_name, hobbies) VALUES ("Seth", "LaFountain", "exercise");

INSERT INTO user (first_name, last_name, hobbies)
VALUES ("John", "Doe", "skiing");

---READ DATA----
SELECT * from user;


--- vehicles

CREATE TABLE vehicle_type(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description VARCHAR(64)
);

CREATE TABLE vehicle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    v_type INTEGER NOT NULL,
    license_plate VARCHAR(45) NOT NULL,
    color VARCHAR(45),
    brand VARCHAR(45) NOT NULL,
    model VARCHAR(45) NOT NULL,
    active BOOLEAN DEFAULT 1,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (v_type) REFERENCES vehicle_type(id)
);

INSERT INTO vehicle_type (description) VALUES("motorcycle");
INSERT INTO vehicle_type (description) VALUES("car");
INSERT INTO vehicle_type (description) VALUES("truck");
INSERT INTO vehicle_type (description) VALUES("SUV");

INSERT INTO vehicle (
    color,
    license_plate,
    v_type,
    user_id,
    brand,
    model
) VALUES (
    "red",
    "AKQJ10",
    1,
    1,
    "honda",
    "something"
);

INSERT INTO vehicle (
    color,
    license_plate,
    v_type,
    user_id,
    brand,
    model
) VALUES (
    "black",
    "HEYYYY",
    4,
    1,
    "ford",
    "something"
);

INSERT INTO vehicle (
    color,
    license_plate,
    v_type,
    user_id,
    brand,
    model
) VALUES (
    "white",
    "BLABLA",
    2,
    2,
    "toyota",
    "camry"
);

SELECT user.last_name,
       user.first_name,
       user.hobbies,
       user.active,
       vehicle.license_plate,
       vehicle.color,
       vehicle_type.description,
       vehicle.brand,
       vehicle.model
FROM USER
INNER JOIN vehicle ON user.id = vehicle.user_id
INNER JOIN vehicle_type ON vehicle.v_type = vehicle_type.id;
WHERE user.id=1;