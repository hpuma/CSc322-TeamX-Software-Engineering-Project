-- The User login system that will be used for authentication.
CREATE TABLE IF NOT EXISTS Users(
    UserName VARCHAR(255),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    Pass VARCHAR(255),
    PRIMARY KEY (UserName)
);


--- The group names and their identiable information.
CREATE TABLE IF NOT EXISTS groups(
        group_id INTEGER UNSIGNED,
        group_name VARCHAR(20),
        PRIMARY KEY (group_id)
);


--- The Users status based on their respective groups.
CREATE TABLE IF NOT EXISTS user_data(
        user_name VARCHAR(20),
        group_id INTEGER UNSIGNED,
        user_type INTEGER UNSIGNED,
        reputation INTEGER,
        interests VARCHAR(120),
        "references" VARCHAR(20),
        PRIMARY KEY (user_name),
        FOREIGN KEY (user_name) REFERENCES user(user_name) 
        ON DELETE CASCADE,
        FOREIGN KEY (group_id) REFERENCES groups(group_id)
        ON DELETE CASCADE
);


--- Users that are automatically accepted from their respective group.
CREATE TABLE IF NOT EXISTS whitebox(
        user_name VARCHAR(20),
        group_id INTEGER UNSIGNED,
        FOREIGN KEY (group_id) REFERENCES groups(group_id)
        ON DELETE CASCADE,
        FOREIGN KEY (user_name) REFERENCES user(user_name)
        ON DELETE CASCADE
);


 --- Users that are banned from their respective groups.
CREATE TABLE IF NOT EXISTS blackbox(
        user_name VARCHAR(20),
        group_id INTEGER UNSIGNED,
        FOREIGN KEY (group_id) REFERENCES groups(group_id)
        ON DELETE CASCADE,
        FOREIGN KEY (user_name) REFERENCES user(user_name)
        ON DELETE CASCADE
);


--- Users that are banned from the entire system.
CREATE TABLE IF NOT EXISTS blacklist(
        user_name VARCHAR(20),
        PRIMARY KEY (user_name)
        FOREIGN KEY (user_name) REFERENCES user(user_name)
);




--- POPULATE TABLES --
INSERT INTO 
	groups(group_id, group_name)
VALUES
(1,'Admin Group'),
(2,'group2'),
(3,'group3');


INSERT INTO 
	post(id, title, date_posted, content, user_id)
VALUES
(10001,"TITLE1",'2010-05-28T15:36:56.200', "CONTENT OF THE POST1", 1);
	
INSERT INTO
	user(id,user_name,first_name,last_name,email,interest,"references", image_file, password, user_type, reputation, group_id)
VALUES
('1', 'admin', 'John', 'Doe', 'friends@somemail.com', 'cs', 'none', '', 'teamxfriends123', 4, 30, 0);


INSERT INTO 
	BlackBox(user_name, group_id)
VALUES
('friendssuperuser',1);

INSERT INTO 
	blacklist(user_name)
VALUES
('bryare');

INSERT INTO 
	notification(id, group_id, sender_id, recipient_id, body)
VALUES
---(1,1,1,2,"Admin invited you to join Admin Group"),
---(1,3,6,2,"Arun invited you to join Team A"),
---(2,NULL, 10, 2, "Jie Wei has referenced you.");
(3,NULL, 2,1, "Bryan has just registered." );