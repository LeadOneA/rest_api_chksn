const express = require('express');
const router = express.Router();
const { add } = require('../controllers/webFormProgramController');

router.post('/', add);

router.get('/', (req, res) => {
    res.status(201).json({ message: 'endpoint is open (webformprogram)...' });
});

module.exports = router;