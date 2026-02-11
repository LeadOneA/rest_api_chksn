/*
THIS SCRIPT IS MANAGED TO CREATE A CSV FILE
DEPENDING ON JSON RECEIVED
*/


const fs = require("fs");
const path = require("path");

//==================================
//CLEAN VALUES COMING FROM DATABASES
//REMOVE COMMAS INSIDE DATA
//REPLACE BREAKLINES
//REMOVE SPECIAL CHARACTERS
//==================================
function sanitizeValue(value) {
  if (value === null || value === undefined) return "";
  let str = String(value);

  // REPLACE BREAKLINES BY SPACES
  str = str.replace(/\r?\n|\r/g, " ");

  // REMOVE COMMAS
  str = str.replace(/,/g, "");

  // DELETE SPECIALS CHARACTERS
  str = str.replace(/[^\w\s.@-]/g, "");

  return str.trim();
}

/**
 * CONVERT OBJECT JSON TO CSV (STRING)
 * @param {Array} data - [{}, {}]
 * @returns {String} - CSV (CONTENT)
 */
function toCSV(data) {
  if (!Array.isArray(data) || data.length === 0) {
    return "";
  }

  // HEADERS
  const headers = Object.keys(data[0]);
  const csvRows = [];

  // FIRST ROW
  csvRows.push(headers.join(","));

  // ROWS
  data.forEach((row) => {
    const values = headers.map((h) => sanitizeValue(row[h]));
    csvRows.push(values.join(","));
  });

  return csvRows.join("\n");
}

//==========================================================
//CREATE CSV FILE INSIDE THE APP (THIS PART CAN BE OPTIONAL)
//==========================================================
function saveCSV(data, filename = "output.csv") {
  const csv = toCSV(data);
  const filePath = path.join(__dirname, "..", "exports", filename);

  fs.writeFileSync(filePath, csv, "utf8");
  return filePath;
}

module.exports = { toCSV, saveCSV };
