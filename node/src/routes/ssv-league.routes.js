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
router.get('/matching', ssvleague.getMatching);
router.get('/top-goal-score', ssvleague.getTopGoalScore);
router.get('/top-conceded', ssvleague.getTopConceded);
router.get('/top-bad-play', ssvleague.getTopBadPlay);
router.get('/favorite-club', ssvleague.getFavoriteClub);
router.get('/top-attack-club', ssvleague.getTopAttackClub);
router.get('/top-conceded-club', ssvleague.getTopConcededClub);

module.exports = router;