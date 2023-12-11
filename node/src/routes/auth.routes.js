const express = require('express');
const router = express.Router();
const auth = require('../controllers/auth.controller');

router.post('/register', auth.register);
router.post('/login', auth.login);
router.get('/me', auth.getMe);
router.delete('/logout', auth.logout);

module.exports = router;