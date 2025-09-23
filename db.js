const sql = require('mssql');


const config = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_SERVER,
    database: process.env.DB_DATABASE,
    port: parseInt(process.env.DB_PORT || '1433', 10),
    options: {
        enableArithAbort: true,
        encrypt: false // WHEN IS CONNECTED TO AZURE CHANGE IT TO TRUE
    },
    pool: { max: 10, min: 0, idleTimeoutMillis: 30000 }
};


let pool;


async function connectToDb() {
    try {
        pool = await sql.connect(config);
        console.log('CONNECTED TO SQL SERVER');
        return pool;
    } catch (err) {
        console.error('SQL SERVER BAD CONNECTION', err);
        throw err;
    }
}


function getPool() {
    if (!pool) throw new Error('CALL FIRST THE FUNCTION CALLED connectToDb');
    return pool;
}


module.exports = { sql, connectToDb, getPool };