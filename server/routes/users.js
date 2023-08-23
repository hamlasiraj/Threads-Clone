const express = require('express');
const router = express.Router();

const {signup, login, updateUser, follow, unfollow } = require('../controller/users');



//AUTH
router.post('/register', signup);
router.post('/login',login);
//USER
router.put("/updateData", updateUser); // user ID
router.put('/follow/:id', follow); // user ID
router.put('/unfollow/:id', unfollow); // user ID



module.exports = router;
