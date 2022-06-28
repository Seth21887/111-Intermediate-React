
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

---READ DATA----
SELECT * from user;