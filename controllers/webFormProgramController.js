const { getPool, sql } = require('../db');

async function add(req, res) {
  let data = req.body;
  console.log("Adding...")
  //VALIDATE IS ARRAY
  if (typeof (data) == "object" || typeof (data) == "Object") {
    if (!Array.isArray(data)) {
      data = [data];
    }
  } else if (typeof (data) == "string" || typeof (data) == "String") {
    res.status(500).json({ error: 'the body is string. Expected result: JSON(object)' });
  }
  try {
    await Promise.all(
      data.map(async (data) => {
        const pool = getPool();
        const request = pool.request();
        request
          .input('FirstName', sql.Char(50), data.FirstName)
          .input('LastName', sql.Char(50), data.LastName)
          .input('Programs', sql.Int, data.Programs)

        //STORE PROCEDURE
        const result = await request.execute('sp_CNIQ_WEB_FORM');
        console.log("foreach result", result)
      }));

    res.status(201).json({ message: 'added successfully' });
  } catch (err) {
    //INSIDE THE DATABASE EXIST TRIGGER
    //WHERE IS THROW CUSTOM ERRORS FROM DATABASE
    let errorMessage = 'Error Unknow';
    if (err.precedingErrors && err.precedingErrors.length > 0) {
      errorMessage = err.precedingErrors.map(e => e.message).join(' | ');
    } else if (err.originalError?.message) {
      errorMessage = err.originalError.message;
    } else if (err.message) {
      errorMessage = err.message;
    }

    res.status(500).json({ error: errorMessage });
  }
}

module.exports = { add };
