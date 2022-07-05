const express = require('express');
const router = express.Router();
const regController = require('../controllers/adminAccount');

router.post('/login', regController.login);
router.post('/register', regController.register);
router.get('/delete/:email', regController.delete);
router.get('/update-data/:email', regController.update);
router.post('/update-user' , regController.update_user);

router.get('/logout', (req,res) => {
    // res.clearCookie('access_token');
    res.render('index', {message: 'Successfully Logout'});
});

module.exports = router;