const { getPool, sql } = require('../db');
const { toCSV } = require("../utils/csv");

async function post_monthly_ar_journal(req, res) {
  //SET HEADERS
  // csv = "Batch Number, Batch Date, Batch Fequency, Series, Batch Source, Number Of TRX, User ID, Origin, Post To GL"
  let filename = "post_monthly_ar_journal"

  const data = [
    {
      "Batch Number": "BN-1001",
      "Batch Date": "2025-09-01T10:30:00",
      "Batch Fequency": "Monthly",
      "Series": "A1",
      "Batch Source": "Payroll",
      "Number Of TRX": 15,
      "User ID": "USR001",
      "Origin": "System",
      "Post To GL": true
    },
    {
      "Batch Number": "BN-1002",
      "Batch Date": "2025-09-05T14:45:00",
      "Batch Fequency": "Weekly",
      "Series": "B2",
      "Batch Source": "Sales",
      "Number Of TRX": 28,
      "User ID": "USR002",
      "Origin": "Manual",
      "Post To GL": false
    },
    {
      "Batch Number": "BN-1003",
      "Batch Date": "2025-09-10T09:00:00",
      "Batch Fequency": "Quarterly",
      "Series": "C3",
      "Batch Source": "Inventory",
      "Number Of TRX": 42,
      "User ID": "USR003",
      "Origin": "API",
      "Post To GL": true
    },
    {
      "Batch Number": "BN-1004",
      "Batch Date": "2025-09-15T16:20:00",
      "Batch Fequency": "Daily",
      "Series": "D4",
      "Batch Source": "Purchasing",
      "Number Of TRX": 8,
      "User ID": "USR004",
      "Origin": "System",
      "Post To GL": true
    },
    {
      "Batch Number": "BN-1005",
      "Batch Date": "2025-09-20T11:10:00",
      "Batch Fequency": "Yearly",
      "Series": "E5",
      "Batch Source": "Finance",
      "Number Of TRX": 5,
      "User ID": "USR005",
      "Origin": "Manual",
      "Post To GL": false
    }
  ];

  const pool = getPool();
  const request = pool.request();
  const result = await request.execute('sp_Get_TAR_Applicant');

  if (result.recordset.length === 0) {
    res.status(500).json({ message: 'Applicant not found' });
  }
  const row = result.recordset;
  let reportJS = [];
  row.forEach(element => {
    let newObj = {};
    for(var key in element){
      newObj[key] = element[key];
    }
    reportJS.push(newObj);
  });
  const csv = toCSV(reportJS);

  res.setHeader("Content-Disposition", `attachment; filename=${filename}.csv`);
  res.setHeader("Content-Type", "text/csv");
  res.send(csv);
}

module.exports = { post_monthly_ar_journal }