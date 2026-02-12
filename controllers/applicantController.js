const { getPool, sql } = require('../db');

async function addApplicant(req, res) {
  let data = req.body;
  console.log("Adding...");
  
  // VALIDATE IS ARRAY OR OBJECT
  if (typeof data === "object" && !Array.isArray(data)) {
    data = [data];
  } else if (typeof data === "string") {
    return res.status(500).json({ error: 'the body is string. Expected result: JSON(object)' });
  } else if (!Array.isArray(data)) {
    return res.status(500).json({ error: 'Invalid request body format' });
  }
  
  // Validar cada elemento del array
  for (const item of data) {
    if (isEmpty(item.firstName)) {
      return res.status(500).json({ error: 'missing parameter: firstName' });
    }
    if (isEmpty(item.lastName)) {
      return res.status(500).json({ error: 'missing parameter: lastName' });
    }
    if (isEmpty(item.program) && isEmpty(item.OTVTAR_Program_ID)) {
      return res.status(500).json({ error: 'missing parameter: programs' });
    }
  }
  
  try {
    await Promise.all(
      data.map(async (data) => {
        const pool = getPool();
        const request = pool.request();
        request
          .input('OTVTAR_Eligibility_Code', sql.SmallInt, data.OTVTAR_Eligibility_Code)
          .input('OTVTAR_Program_ID', sql.Char(15), data.OTVTAR_Program_ID || data.program)
          .input('OTVTAR_Applicant_ID', sql.Char(11), data.OTVTAR_Applicant_ID)
          .input('OTVTAR_Time', sql.DateTime, data.OTVTAR_Time)
          .input('OTVTAR_Date', sql.DateTime, data.OTVTAR_Date)
          .input('OTVTAR_App_Last_Name', sql.Char(21), data.OTVTAR_App_Last_Name || data.lastName)
          .input('OTVTAR_App_First_Name', sql.Char(21), data.OTVTAR_App_First_Name || data.firstName)
          .input('OTVTAR_App_Middle_Name', sql.Char(21), data.OTVTAR_App_Middle_Name)
          .input('OTVTAR_Cur_Name', sql.Char(31), data.OTVTAR_Cur_Name)
          .input('OTVTAR_Cur_Address1', sql.Char(31), data.OTVTAR_Cur_Address1 || data.curAddress1)
          .input('OTVTAR_Cur_Address2', sql.Char(31), data.OTVTAR_Cur_Address2 || data.curAddress2)
          .input('OTVTAR_Cur_City', sql.Char(21), data.OTVTAR_Cur_City || data.curCity)
          .input('OTVTAR_Cur_CountyCode', sql.Char(3), data.OTVTAR_Cur_CountyCode)
          .input('OTVTAR_Cur_State', sql.Char(3), data.OTVTAR_Cur_State || data.curState)
          .input('OTVTAR_Cur_ZipCode', sql.Char(11), data.OTVTAR_Cur_ZipCode || data.curZip)
          .input('OTVTAR_Cur_Telephone', sql.Char(11), data.OTVTAR_Cur_Telephone)
          .input('OTVTAR_Perm_Name', sql.Char(31), data.OTVTAR_Perm_Name)
          .input('OTVTAR_Perm_Address1', sql.Char(31), data.OTVTAR_Perm_Address1 || data.permAddress1)
          .input('OTVTAR_Perm_Address2', sql.Char(31), data.OTVTAR_Perm_Address2 || data.permAddress2)
          .input('OTVTAR_Perm_City', sql.Char(21), data.OTVTAR_Perm_City)
          .input('OTVTAR_Perm_State', sql.Char(3), data.OTVTAR_Perm_State)
          .input('OTVTAR_Perm_ZipCode', sql.Char(11), data.OTVTAR_Perm_ZipCode)
          .input('OTVTAR_Perm_Telephone', sql.Char(11), data.OTVTAR_Perm_Telephone)
          .input('OTVTAR_Sex', sql.SmallInt, data.OTVTAR_Sex)
          .input('OTVTAR_Project_ID', sql.Char(15), data.OTVTAR_Project_ID)
          .input('OTVTAR_Fam_Minority_Code', sql.SmallInt, data.OTVTAR_Fam_Minority_Code)
          .input('OTVTAR_Tribal_Code', sql.Char(3), data.OTVTAR_Tribal_Code)
          .input('OTVTAR_Bedrooms', sql.SmallInt, data.OTVTAR_Bedrooms)
          .input('OTVTAR_Birth_Date', sql.DateTime, data.OTVTAR_Birth_Date)
          .input('OTVTAR_Elderly', sql.TinyInt, data.OTVTAR_Elderly)
          .input('OTVTAR_Disabled', sql.TinyInt, data.OTVTAR_Disabled)
          .input('OTVTAR_Handicapped', sql.TinyInt, data.OTVTAR_Handicapped)
          .input('OTVTAR_HusbWife', sql.TinyInt, data.OTVTAR_HusbWife)
          .input('OTVTAR_Family_Count', sql.SmallInt, data.OTVTAR_Family_Count)
          .input('OTVTAR_DIB', sql.Char(7), data.OTVTAR_DIB)
          .input('OTVTAR_Marital_Status', sql.SmallInt, data.OTVTAR_Marital_Status)
          .input('OTVTAR_Dependent_Count', sql.SmallInt, data.OTVTAR_Dependent_Count)
          .input('OTVTAR_VANumber', sql.Char(11), data.OTVTAR_VANumber)
          .input('OTVTAR_Wages', sql.TinyInt, data.OTVTAR_Wages)
          .input('OTVTAR_Benefits_SS', sql.TinyInt, data.OTVTAR_Benefits_SS)
          .input('OTVTAR_Benefits_SSI', sql.TinyInt, data.OTVTAR_Benefits_SSI)
          .input('OTVTAR_Benefits_VA', sql.TinyInt, data.OTVTAR_Benefits_VA)
          .input('OTVTAR_Benefits_Other', sql.TinyInt, data.OTVTAR_Benefits_Other)
          .input('OTVTAR_Welfare_AFDC', sql.TinyInt, data.OTVTAR_Welfare_AFDC)
          .input('OTVTAR_Welfare_OAA', sql.TinyInt, data.OTVTAR_Welfare_OAA)
          .input('OTVTAR_Welfare_AD', sql.TinyInt, data.OTVTAR_Welfare_AD)
          .input('OTVTAR_Welfare_Other', sql.TinyInt, data.OTVTAR_Welfare_Other)
          .input('OTVTAR_Other_Income', sql.TinyInt, data.OTVTAR_Other_Income)
          .input('OTVTAR_Gross_Income', sql.Int, data.OTVTAR_Gross_Income)
          .input('OTVTAR_Adj_Gross_Income', sql.Int, data.OTVTAR_Adj_Gross_Income)
          .input('OTVTAR_Prior_Tenant', sql.TinyInt, data.OTVTAR_Prior_Tenant)
          .input('OTVTAR_Anticipated_Rent', sql.Int, data.OTVTAR_Anticipated_Rent)
          .input('OTVTAR_MHC_Land', sql.Int, data.OTVTAR_MHC_Land)
          .input('OTVTAR_MHC_Work', sql.Int, data.OTVTAR_MHC_Work)
          .input('OTVTAR_MHC_Materials', sql.Int, data.OTVTAR_MHC_Materials)
          .input('OTVTAR_MHC_Cash', sql.Int, data.OTVTAR_MHC_Cash)
          .input('OTVTAR_MHC_Equipment', sql.Int, data.OTVTAR_MHC_Equipment)
          .input('OTVTAR_Recert_Date', sql.DateTime, data.OTVTAR_Recert_Date)
          .input('OTVTAR_Empr_Name', sql.Char(31), data.OTVTAR_Empr_Name)
          .input('OTVTAR_Empr_Address1', sql.Char(31), data.OTVTAR_Empr_Address1)
          .input('OTVTAR_Empr_Address2', sql.Char(31), data.OTVTAR_Empr_Address2)
          .input('OTVTAR_Empr_City', sql.Char(21), data.OTVTAR_Empr_City)
          .input('OTVTAR_Empr_State', sql.Char(3), data.OTVTAR_Empr_State)
          .input('OTVTAR_Empr_ZipCode', sql.Char(11), data.OTVTAR_Empr_ZipCode)
          .input('OTVTAR_Empr_Telephone', sql.Char(11), data.OTVTAR_Empr_Telephone)
          .input('OTVTAR_Housing_Code', sql.SmallInt, data.OTVTAR_Housing_Code)
          .input('OTVTAR_Housing_Cost', sql.Int, data.OTVTAR_Housing_Cost)
          .input('OTVTAR_Priority_Code', sql.SmallInt, data.OTVTAR_Priority_Code)
          .input('OTVTAR_Credit_Verified', sql.TinyInt, data.OTVTAR_Credit_Verified)
          .input('OTVTAR_Total_Assets', sql.Int, data.OTVTAR_Total_Assets)
          .input('OTVTAR_Previous_Aid', sql.TinyInt, data.OTVTAR_Previous_Aid)
          .input('OTVTAR_Removal_Code', sql.SmallInt, data.OTVTAR_Removal_Code)
          .input('OTVTAR_Removal_Date', sql.DateTime, data.OTVTAR_Removal_Date);

        //STORE PROCEDURE
        const result = await request.execute('sp_Insert_TAR_Applicant');
        console.log("foreach result", result)
      }));

    res.status(201).json({ message: 'Applicant added successfully' });
  } catch (err) {
    // console.error('Error INSERT APPLICANT:', err);
    //INSIDE THE DATABASE EXIST TRIGGER
    //WHERE IS THROW CUSTOM ERRORS FROM DATABASE
    let errorMessage = 'Error Unknow (applicant)';
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


function isEmpty(nValue) {
  return (
    nValue === '' ||
    nValue === null ||
    nValue === undefined ||
    nValue === 'undefined' ||
    nValue === 'null' ||
    (Array.isArray(nValue) && nValue.length === 0) ||
    (typeof nValue === 'object' && nValue !== null && Object.keys(nValue).length === 0)
  );
}

async function editApplicant(req, res) {
  let data = req.body;
  console.log('Updating');
  
  // VALIDATE IS ARRAY OR OBJECT
  if (typeof data === "object" && !Array.isArray(data)) {
    data = [data];
  } else if (typeof data === "string") {
    return res.status(500).json({ error: 'the body is string. Expected result: JSON(object)' });
  } else if (!Array.isArray(data)) {
    return res.status(500).json({ error: 'Invalid request body format' });
  }
  
  try {
    await Promise.all(
      data.map(async (item) => {
        const pool = getPool();
        const request = pool.request();
        request
          .input('OTVTAR_Eligibility_Code', sql.SmallInt, item.OTVTAR_Eligibility_Code)
          .input('OTVTAR_Program_ID', sql.Char(15), item.OTVTAR_Program_ID)
          .input('OTVTAR_Removal_Date', sql.DateTime, item.OTVTAR_Removal_Date);
          
        return await request.execute('sp_Update_TAR_Applicant');
      })
    );

    return res.status(201).json({ message: 'Applicant updated successfully' });
  } catch (err) {
    let errorMessage = 'Error Unknown (applicant)';
    
    if (err.precedingErrors && err.precedingErrors.length > 0) {
      errorMessage = err.precedingErrors.map(e => e.message).join(' | ');
    } else if (err.originalError?.message) {
      errorMessage = err.originalError.message;
    } else if (err.message) {
      errorMessage = err.message;
    }

    return res.status(500).json({ error: errorMessage });
  }
}

module.exports = { addApplicant, editApplicant };