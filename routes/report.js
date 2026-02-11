const express = require('express');
const router = express.Router();
const { post_monthly_ar_journal } = require('../controllers/reportController');

router.get('/', post_monthly_ar_journal);

router.get('/', (req, res) => {
    res.status(201).json({ message: 'report is open...' });
});
module.exports = router;