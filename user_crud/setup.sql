
--- vehicles

CREATE TABLE vehicle_type(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description VARCHAR(64)
)

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