const express = require('express');
const app = express();
const port = 3001;


const cookieParser = require('cookie-parser');

const dotenv = require('dotenv');
dotenv.config({path: './.env'});

// const mySql = require('mysql2');
// const db = mySql.createConnection({
//     host: process.env.DATABASE_HOST,
//     user: process.env.DATABASE_USER,
//     password: process.env.DATABASE_PASSWORD,
//     port: process.env.DATABASE_PORT,
//     database: process.env.DATABASE
// });

app.use(express.urlencoded({extended:true}));
app.use(express.json());

// app.use(cookieParser());

app.set('view engine', 'hbs');
app.use('/admin', require('./routes/admin'));

app.use('/', require('./routes/accountRoutes'));

app.listen(port, () => {
    console.log(`Server Started at http://localhost:${port}`);
    // db.connect((err) => {
    //     if (err) {
    //         console.log(err.message)
    //     } else {
    //         console.log('Database Successfully Connected!')
    //     }
    // })
});