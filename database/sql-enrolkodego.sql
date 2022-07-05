SHOW tables;
SELECT * FROM user;
SELECT * FROM students;
SELECT * FROM courses;

INSERT INTO user (email, password) VALUES ('admin@admin.com', '1234');
SELECT * FROM user;

INSERT INTO courses (course_name, course_description) VALUES ('Front-End Development', 'HTML, CSS, JavaScript');
INSERT INTO courses (course_name, course_description) VALUES ('Back-End Development', 'Java, Python, Ruby');
INSERT INTO courses (course_name, course_description) VALUES ('Full-Stack Development', 'Mixed of Both Worlds');
SELECT * FROM courses;

INSERT INTO students (first_name, last_name, email, course_id) VALUES ('asd', 'asd', 'asd@asd', 1);
INSERT INTO students (first_name, last_name, email, course_id) VALUES ('qwe', 'qwe', 'qwe@qwe', 2);
INSERT INTO students (first_name, last_name, email, course_id) VALUES ('zxc', 'zxc', 'zxc@zxc', 3);

SELECT * FROM students a JOIN courses b ON a.course_id = b.course_id;