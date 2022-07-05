const bcrypt = require('bcrypt');
const mySql = require('mysql2');
// const jwt = require('jsonwebtoken');
const db = mySql.createConnection({
    host: process.env.DATABASE_HOST,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    port: process.env.DATABASE_PORT,
    database: process.env.DATABASE
});



exports.login = async (req, res) => {
    try {
        const {email, password} = req.body;

        db.query('SELECT * FROM user WHERE email = ?', 
        email,
        async (err, results) => {
            if (password !== results[0].password) {
                res.status(401).render('index', {errMessage: 'Email or Password is Incorrect!'});
                console.log('Login Denied');
            } else {
                // console.log('Login Successfully');
                db.query('SELECT * FROM students a JOIN courses b ON a.course_id = b.course_id;', 
                (err, results) => {
                    if (err) {
                        console.log(err.message)
                    } else {
                        res.render('studentList', {students: results});
                    }
                })
            }
        })
    } catch (error) {
        console.log(error)
    }
};



exports.delete = (req, res) => {
    const email = req.params.email;
    // console.log(email);
    db.query('DELETE FROM students WHERE email=?',
    email, 
    (err, results) => {
        // console.log('Data Deleted!!');
        db.query('SELECT * FROM students a JOIN courses b ON a.course_id = b.course_id;', (err, results) => {
            if (err) {
                console.log(err.message)
            } else {
                res.render('studentList', {students: results, message: 'Record has been Deleted!'});
            }
        })
    })
};

exports.update = (req, res) => {
    const email = req.params.email;
    // console.log(email);
    db.query('SELECT * FROM students WHERE email= ? ',
    email,
    (err, results) => {
        if (err) {
            console.log(err.message)
        } else {
            res.render('update-data', {student: results});
        }
    })
};


exports.update_user = (req, res) => {
    // console.log(req.body);
    const {first_name, last_name, course_id, email} = req.body;
    db.query('UPDATE students SET first_name = ?, last_name = ?, course_id = ? WHERE email = ?', 
        [first_name, last_name, course_id, email],
        (err, results) => {
            db.query('SELECT * FROM students a JOIN courses b ON a.course_id = b.course_id;', (err, results) => {
                if (err) {
                    console.log(err.message)
                } else {
                    res.render('studentList', {students: results, message: 'Record has been Updated!'});
                }
            })
        })
};


exports.register = (req, res) => {
    // console.log(req.body);
    const {first_name, last_name, email, course_id} = req.body;
        db.query('INSERT INTO students SET ?', 
        {first_name: first_name, last_name: last_name, email: email, course_id: course_id}, 
        (err, results) => {
            db.query('SELECT * FROM students a JOIN courses b ON a.course_id = b.course_id;', (err, results) => {
                if (err) {
                    console.log(err.message)
                } else {
                    res.render('studentList', {students: results, message: 'Student has been Added'});
                }
            })
        })
};