const express = require('express');
const router = express.Router();
const ssvleague = require('../controllers/ssv-league.controller')
router.get('/players', ssvleague.getPlayers);
router.get('/clubs', ssvleague.getClubs);
router.post('/create-match', ssvleague.createMatch);
router.post('/match', ssvleague.getMatchByKey);
router.get('/match-all', ssvleague.getAllMatch);
router.patch('/update-match', ssvleague.updateMatch);
router.get('/rank', ssvleague.getRank);
router.get('/history/:player', ssvleague.getHistory);

module.exports = router;