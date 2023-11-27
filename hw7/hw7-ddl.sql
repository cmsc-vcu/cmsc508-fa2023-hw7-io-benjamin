# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET AUTOCOMMIT=1;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills; 
DROP TABLE IF EXISTS people;
drop table if exists roles;
drop table if exists skills;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id int,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL DEFAULT '(default description)',
    tag varchar(255) NOT NULL,
    PRIMARY KEY (id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (id, name, tag) values
(1,'making 404 go brr','Skill 1'),
(2,'webpage go pooff','Skill 2'),
(3,'AI Wizard, literally built ChatGPT','Skill 3'),
(4,'makes a good cup of coffee & can code in FORTRAN','Skill 4'),
(5,'no skills just luck + GCP pro','Skill 5'),
(6,'does a good mickey mouse impression and can code in java','Skill 6'),
(7,'can code a full application within a day, deploying with no bugs', 'Skill 7'),
(8,'literally does everything in his sleep without thinking, can code in all coding languages fluently.', 'Skill 8');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    linkedin_url VARCHAR(4096),
    headshot_url VARCHAR(4096),
    discord_handle VARCHAR(255),
    brief_bio VARCHAR(4096),
    PRIMARY KEY (people_id) 
);

# Section 5
# Populate people with 10 people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id,last_name,email) values 
(1,'Harrison','v3w8x2y@example.com'),
(2,'Lopez','d9b3e4@example.com'),
(3,'Bennett','u1r7p5q@example.com'),
(4,'Collins','s6t9z1@example.com'),
(5,'Ramirez','a4c7z9@example.com'),
(6,'Foster','f5g6t2@example.com'),
(7,'Murphy','k9j4p7@example.com'),
(8,'Peterson','x2y4n8@example.com'),
(9,'Jenkins','m1q9r3@example.com'),
(10,'Patel','h7e4s5@example.com');

 

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if exists peopleskills;
CREATE TABLE peopleskills (
    id INT auto_increment,
    skills_id INT ,
    people_id INT ,
    date_acquired DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (skills_id) REFERENCES skills(id)
);



# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.


insert into peopleskills (people_id, skills_id) values
    (1,1), 
    (1,3), 
    (1,6), 
    (2,3),
    (2,4),
    (2,5),
    (3,1),
    (3,5),
    (5,3),
    (5,6),
    (6,2),
    (6,3),
    (6,4),
    (7,3),
    (7,5),
    (7,6),
    (8,1),
    (8,3),
    (8,5),
    (8,6),
    (9,2),
    (9,5),
    (9,6),
    (10,1),
    (10,4),
    (10,5);
 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id int,
    name varchar(255),
    sort_priority int,
    PRIMARY KEY (id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority) VALUES
(1,'Designer',10),
(2,'Developer',20),
(3,'Recruit',30),
(4,'Team Lead',40),
(5,'Boss',50),
(6,'Mentor',60);



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id int auto_increment,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned date DEFAULT (CURRENT_DATE),
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id) VALUES
(1,2),
(2,5),
(2,6),
(3,2),
(3,4),
(4,3),
(5,3),
(6,1),
(6,2),
(7,1),
(8,1),
(8,4),
(9,2),
(10,1),
(10,2);

SELECT * FROM peopleroles;
SELECT * FROM skills;
SELECT * FROM people;
SELECT * FROM peopleskills;
SELECT * FROM roles;