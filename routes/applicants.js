const express = require('express');
const router = express.Router();
const { addApplicant, editApplicant } = require('../controllers/applicantController');

router.post('/', addApplicant);

router.get('/', (req, res) => {
    res.status(201).json({ message: 'Applicant is open...' });
});

router.post('/edit', editApplicant);

module.exports = router;