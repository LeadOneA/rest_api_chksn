USE chickasawnation

-- CREATE LOGIN FOR API
CREATE LOGIN apiCNIQ WITH PASSWORD = 'StrongPass!123';

-- CREATE USER AND GIVE ACCESS AT DATABASE
USE chickasawnation;
CREATE USER apiCNIQ FOR LOGIN apiCNIQ;
-- USER PERMISSION
GRANT SELECT, INSERT, UPDATE ON TAR00201_TAR_Applicant_MSTR TO apiCNIQ;

-- CREATE THE TABLE
GO

CREATE TABLE TAR00201_TAR_Applicant_MSTR (
    OTVTAR_Eligibility_Code SMALLINT,
    OTVTAR_Program_ID       CHAR(15) NOT NULL,
    OTVTAR_Applicant_ID     CHAR(11) NOT NULL,
    OTVTAR_Time             DATETIME,
    OTVTAR_Date             DATETIME,
    OTVTAR_App_Last_Name    CHAR(21),
    OTVTAR_App_First_Name   CHAR(21),
    OTVTAR_App_Middle_Name  CHAR(21),
    OTVTAR_Cur_Name         CHAR(31),
    OTVTAR_Cur_Address1     CHAR(31),
    OTVTAR_Cur_Address2     CHAR(31),
    OTVTAR_Cur_City         CHAR(21),
    OTVTAR_Cur_CountyCode   CHAR(3),
    OTVTAR_Cur_State        CHAR(3),
    OTVTAR_Cur_ZipCode      CHAR(11),
    OTVTAR_Cur_Telephone    CHAR(11),
    OTVTAR_Perm_Name        CHAR(31),
    OTVTAR_Perm_Address1    CHAR(31),
    OTVTAR_Perm_Address2    CHAR(31),
    OTVTAR_Perm_City        CHAR(21),
    OTVTAR_Perm_State       CHAR(3),
    OTVTAR_Perm_ZipCode     CHAR(11),
    OTVTAR_Perm_Telephone   CHAR(11),
    OTVTAR_Sex              SMALLINT,
    OTVTAR_Project_ID       CHAR(15),
    OTVTAR_Fam_Minority_Code SMALLINT,
    OTVTAR_Tribal_Code      CHAR(3),
    OTVTAR_Bedrooms         SMALLINT,
    OTVTAR_Birth_Date       DATETIME,
    OTVTAR_Elderly          TINYINT,
    OTVTAR_Disabled         TINYINT,
    OTVTAR_Handicapped      TINYINT,
    OTVTAR_HusbWife         TINYINT,
    OTVTAR_Family_Count     SMALLINT,
    OTVTAR_DIB              CHAR(7),
    OTVTAR_Marital_Status   SMALLINT,
    OTVTAR_Dependent_Count  SMALLINT,
    OTVTAR_VANumber         CHAR(11),
    OTVTAR_Wages            TINYINT,
    OTVTAR_Benefits_SS      TINYINT,
    OTVTAR_Benefits_SSI     TINYINT,
    OTVTAR_Benefits_VA      TINYINT,
    OTVTAR_Benefits_Other   TINYINT,
    OTVTAR_Welfare_AFDC     TINYINT,
    OTVTAR_Welfare_OAA      TINYINT,
    OTVTAR_Welfare_AD       TINYINT,
    OTVTAR_Welfare_Other    TINYINT,
    OTVTAR_Other_Income     TINYINT,
    OTVTAR_Gross_Income     INT,
    OTVTAR_Adj_Gross_Income INT,
    OTVTAR_Prior_Tenant     TINYINT,
    OTVTAR_Anticipated_Rent INT,
    OTVTAR_MHC_Land         INT,
    OTVTAR_MHC_Work         INT,
    OTVTAR_MHC_Materials    INT,
    OTVTAR_MHC_Cash         INT,
    OTVTAR_MHC_Equipment    INT,
    OTVTAR_Recert_Date      DATETIME,
    OTVTAR_Empr_Name        CHAR(31),
    OTVTAR_Empr_Address1    CHAR(31),
    OTVTAR_Empr_Address2    CHAR(31),
    OTVTAR_Empr_City        CHAR(21),
    OTVTAR_Empr_State       CHAR(3),
    OTVTAR_Empr_ZipCode     CHAR(11),
    OTVTAR_Empr_Telephone   CHAR(11),
    OTVTAR_Housing_Code     SMALLINT,
    OTVTAR_Housing_Cost     INT,
    OTVTAR_Priority_Code    SMALLINT,
    OTVTAR_Credit_Verified  TINYINT,
    OTVTAR_Total_Assets     INT,
    OTVTAR_Previous_Aid     TINYINT,
    OTVTAR_Removal_Code     SMALLINT,
    OTVTAR_Removal_Date     DATETIME,
    DEX_ROW_ID              INT,
    -- PRIMARY KEY ANC CLUSTERED
    CONSTRAINT PK_TAR00201 PRIMARY KEY CLUSTERED (OTVTAR_Program_ID, OTVTAR_Applicant_ID)
);
GO

-- INDEX NOT CLUSTERED
CREATE NONCLUSTERED INDEX IX_TAR00201_LastName
ON TAR00201_TAR_Applicant_MSTR (OTVTAR_App_Last_Name);
GO
-- INDEX NOT CLUSTERED
CREATE NONCLUSTERED INDEX IX_TAR00201_FirstName
ON TAR00201_TAR_Applicant_MSTR (OTVTAR_App_First_Name);
GO
-- INDEX NOT CLUSTERED
CREATE NONCLUSTERED INDEX IX_TAR00201_MiddleName
ON TAR00201_TAR_Applicant_MSTR (OTVTAR_App_Middle_Name);
GO
-- INDEX NOT CLUSTERED
CREATE NONCLUSTERED INDEX IX_TAR00201_ApplicantID
ON TAR00201_TAR_Applicant_MSTR (OTVTAR_Applicant_ID);
GO
-- INDEX NOT CLUSTERED
CREATE NONCLUSTERED INDEX IX_TAR00201_ProgramID
ON TAR00201_TAR_Applicant_MSTR (OTVTAR_Program_ID);

-- VALIDATE STORE PROCEDURE AND DELETE IF EXIST
IF OBJECT_ID('sp_Insert_TAR_Applicant', 'P') IS NOT NULL
    DROP PROCEDURE sp_Insert_TAR_Applicant;
GO
-- CREATE STORE PROCEDURE
CREATE PROCEDURE sp_Insert_TAR_Applicant
    @DEX_ROW_ID INT,
    @OTVTAR_Eligibility_Code SMALLINT,
    @OTVTAR_Program_ID CHAR(15),
    @OTVTAR_Applicant_ID CHAR(11),
    @OTVTAR_Time DATETIME,
    @OTVTAR_Date DATETIME,
    @OTVTAR_App_Last_Name CHAR(21),
    @OTVTAR_App_First_Name CHAR(21),
    @OTVTAR_App_Middle_Name CHAR(21),
    @OTVTAR_Cur_Name CHAR(31),
    @OTVTAR_Cur_Address1 CHAR(31),
    @OTVTAR_Cur_Address2 CHAR(31),
    @OTVTAR_Cur_City CHAR(21),
    @OTVTAR_Cur_CountyCode CHAR(3),
    @OTVTAR_Cur_State CHAR(3),
    @OTVTAR_Cur_ZipCode CHAR(11),
    @OTVTAR_Cur_Telephone CHAR(11),
    @OTVTAR_Perm_Name CHAR(31),
    @OTVTAR_Perm_Address1 CHAR(31),
    @OTVTAR_Perm_Address2 CHAR(31),
    @OTVTAR_Perm_City CHAR(21),
    @OTVTAR_Perm_State CHAR(3),
    @OTVTAR_Perm_ZipCode CHAR(11),
    @OTVTAR_Perm_Telephone CHAR(11),
    @OTVTAR_Sex SMALLINT,
    @OTVTAR_Project_ID CHAR(15),
    @OTVTAR_Fam_Minority_Code SMALLINT,
    @OTVTAR_Tribal_Code CHAR(3),
    @OTVTAR_Bedrooms SMALLINT,
    @OTVTAR_Birth_Date DATETIME,
    @OTVTAR_Elderly TINYINT,
    @OTVTAR_Disabled TINYINT,
    @OTVTAR_Handicapped TINYINT,
    @OTVTAR_HusbWife TINYINT,
    @OTVTAR_Family_Count SMALLINT,
    @OTVTAR_DIB CHAR(7),
    @OTVTAR_Marital_Status SMALLINT,
    @OTVTAR_Dependent_Count SMALLINT,
    @OTVTAR_VANumber CHAR(11),
    @OTVTAR_Wages TINYINT,
    @OTVTAR_Benefits_SS TINYINT,
    @OTVTAR_Benefits_SSI TINYINT,
    @OTVTAR_Benefits_VA TINYINT,
    @OTVTAR_Benefits_Other TINYINT,
    @OTVTAR_Welfare_AFDC TINYINT,
    @OTVTAR_Welfare_OAA TINYINT,
    @OTVTAR_Welfare_AD TINYINT,
    @OTVTAR_Welfare_Other TINYINT,
    @OTVTAR_Other_Income TINYINT,
    @OTVTAR_Gross_Income INT,
    @OTVTAR_Adj_Gross_Income INT,
    @OTVTAR_Prior_Tenant TINYINT,
    @OTVTAR_Anticipated_Rent INT,
    @OTVTAR_MHC_Land INT,
    @OTVTAR_MHC_Work INT,
    @OTVTAR_MHC_Materials INT,
    @OTVTAR_MHC_Cash INT,
    @OTVTAR_MHC_Equipment INT,
    @OTVTAR_Recert_Date DATETIME,
    @OTVTAR_Empr_Name CHAR(31),
    @OTVTAR_Empr_Address1 CHAR(31),
    @OTVTAR_Empr_Address2 CHAR(31),
    @OTVTAR_Empr_City CHAR(21),
    @OTVTAR_Empr_State CHAR(3),
    @OTVTAR_Empr_ZipCode CHAR(11),
    @OTVTAR_Empr_Telephone CHAR(11),
    @OTVTAR_Housing_Code SMALLINT,
    @OTVTAR_Housing_Cost INT,
    @OTVTAR_Priority_Code SMALLINT,
    @OTVTAR_Credit_Verified TINYINT,
    @OTVTAR_Total_Assets INT,
    @OTVTAR_Previous_Aid TINYINT,
    @OTVTAR_Removal_Code SMALLINT,
    @OTVTAR_Removal_Date DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    -- VALIDATE IF EXIST THE COMBINATION BETWEEN OTVTAR_CountyCode AND OTVTAR_CountyName
    IF EXISTS (
        SELECT 1
        FROM TAR00201_TAR_Applicant_MSTR
        WHERE OTVTAR_Program_ID = @OTVTAR_Program_ID
          AND OTVTAR_Applicant_ID = @OTVTAR_Applicant_ID
    )
    BEGIN
        RAISERROR('A record with the same Program_ID and Applicant_ID already exists.', 16, 1);
        RETURN;
    END;

    --INSERT NEW RECORD
    INSERT INTO TAR00201_TAR_Applicant_MSTR (
        DEX_ROW_ID,
        OTVTAR_Eligibility_Code, OTVTAR_Program_ID, OTVTAR_Applicant_ID,
        OTVTAR_Time, OTVTAR_Date, OTVTAR_App_Last_Name, OTVTAR_App_First_Name,
        OTVTAR_App_Middle_Name, OTVTAR_Cur_Name, OTVTAR_Cur_Address1,
        OTVTAR_Cur_Address2, OTVTAR_Cur_City, OTVTAR_Cur_CountyCode,
        OTVTAR_Cur_State, OTVTAR_Cur_ZipCode, OTVTAR_Cur_Telephone,
        OTVTAR_Perm_Name, OTVTAR_Perm_Address1, OTVTAR_Perm_Address2,
        OTVTAR_Perm_City, OTVTAR_Perm_State, OTVTAR_Perm_ZipCode,
        OTVTAR_Perm_Telephone, OTVTAR_Sex, OTVTAR_Project_ID,
        OTVTAR_Fam_Minority_Code, OTVTAR_Tribal_Code, OTVTAR_Bedrooms,
        OTVTAR_Birth_Date, OTVTAR_Elderly, OTVTAR_Disabled,
        OTVTAR_Handicapped, OTVTAR_HusbWife, OTVTAR_Family_Count,
        OTVTAR_DIB, OTVTAR_Marital_Status, OTVTAR_Dependent_Count,
        OTVTAR_VANumber, OTVTAR_Wages, OTVTAR_Benefits_SS,
        OTVTAR_Benefits_SSI, OTVTAR_Benefits_VA, OTVTAR_Benefits_Other,
        OTVTAR_Welfare_AFDC, OTVTAR_Welfare_OAA, OTVTAR_Welfare_AD,
        OTVTAR_Welfare_Other, OTVTAR_Other_Income, OTVTAR_Gross_Income,
        OTVTAR_Adj_Gross_Income, OTVTAR_Prior_Tenant,
        OTVTAR_Anticipated_Rent, OTVTAR_MHC_Land, OTVTAR_MHC_Work,
        OTVTAR_MHC_Materials, OTVTAR_MHC_Cash, OTVTAR_MHC_Equipment,
        OTVTAR_Recert_Date, OTVTAR_Empr_Name, OTVTAR_Empr_Address1,
        OTVTAR_Empr_Address2, OTVTAR_Empr_City, OTVTAR_Empr_State,
        OTVTAR_Empr_ZipCode, OTVTAR_Empr_Telephone,
        OTVTAR_Housing_Code, OTVTAR_Housing_Cost, OTVTAR_Priority_Code,
        OTVTAR_Credit_Verified, OTVTAR_Total_Assets, OTVTAR_Previous_Aid,
        OTVTAR_Removal_Code, OTVTAR_Removal_Date
    )
    VALUES (
        @DEX_ROW_ID,
        @OTVTAR_Eligibility_Code, @OTVTAR_Program_ID, @OTVTAR_Applicant_ID,
        @OTVTAR_Time, @OTVTAR_Date, @OTVTAR_App_Last_Name, @OTVTAR_App_First_Name,
        @OTVTAR_App_Middle_Name, @OTVTAR_Cur_Name, @OTVTAR_Cur_Address1,
        @OTVTAR_Cur_Address2, @OTVTAR_Cur_City, @OTVTAR_Cur_CountyCode,
        @OTVTAR_Cur_State, @OTVTAR_Cur_ZipCode, @OTVTAR_Cur_Telephone,
        @OTVTAR_Perm_Name, @OTVTAR_Perm_Address1, @OTVTAR_Perm_Address2,
        @OTVTAR_Perm_City, @OTVTAR_Perm_State, @OTVTAR_Perm_ZipCode,
        @OTVTAR_Perm_Telephone, @OTVTAR_Sex, @OTVTAR_Project_ID,
        @OTVTAR_Fam_Minority_Code, @OTVTAR_Tribal_Code, @OTVTAR_Bedrooms,
        @OTVTAR_Birth_Date, @OTVTAR_Elderly, @OTVTAR_Disabled,
        @OTVTAR_Handicapped, @OTVTAR_HusbWife, @OTVTAR_Family_Count,
        @OTVTAR_DIB, @OTVTAR_Marital_Status, @OTVTAR_Dependent_Count,
        @OTVTAR_VANumber, @OTVTAR_Wages, @OTVTAR_Benefits_SS,
        @OTVTAR_Benefits_SSI, @OTVTAR_Benefits_VA, @OTVTAR_Benefits_Other,
        @OTVTAR_Welfare_AFDC, @OTVTAR_Welfare_OAA, @OTVTAR_Welfare_AD,
        @OTVTAR_Welfare_Other, @OTVTAR_Other_Income, @OTVTAR_Gross_Income,
        @OTVTAR_Adj_Gross_Income, @OTVTAR_Prior_Tenant,
        @OTVTAR_Anticipated_Rent, @OTVTAR_MHC_Land, @OTVTAR_MHC_Work,
        @OTVTAR_MHC_Materials, @OTVTAR_MHC_Cash, @OTVTAR_MHC_Equipment,
        @OTVTAR_Recert_Date, @OTVTAR_Empr_Name, @OTVTAR_Empr_Address1,
        @OTVTAR_Empr_Address2, @OTVTAR_Empr_City, @OTVTAR_Empr_State,
        @OTVTAR_Empr_ZipCode, @OTVTAR_Empr_Telephone,
        @OTVTAR_Housing_Code, @OTVTAR_Housing_Cost, @OTVTAR_Priority_Code,
        @OTVTAR_Credit_Verified, @OTVTAR_Total_Assets, @OTVTAR_Previous_Aid,
        @OTVTAR_Removal_Code, @OTVTAR_Removal_Date
    );
END;
GO

-- VALIDATE THE TRIGGER AND DELETE IF EXIST
IF OBJECT_ID('trg_Validate_TAR_Applicant_Insert', 'TR') IS NOT NULL
BEGIN
    PRINT 'DELETE TRIGGER AND ADDING IT AGAIN';
    DROP TRIGGER trg_Validate_TAR_Applicant_Insert;
END
ELSE
BEGIN
    PRINT 'DO NOT EXIST... CREATING...';
END
GO

--CREATE THE TRIGGER
CREATE TRIGGER trg_Validate_TAR_Applicant_Insert
ON TAR00201_TAR_Applicant_MSTR
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    --OTVTAR_Program_ID IS MANDATORY
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE LTRIM(RTRIM(ISNULL(OTVTAR_Program_ID, ''))) = ''
    )
    BEGIN
        RAISERROR('Program_ID IS MANDATORY', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;

    --Applicant_ID IS MANDATORY
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE LTRIM(RTRIM(ISNULL(OTVTAR_Applicant_ID, ''))) = ''
    )
    BEGIN
        RAISERROR('Applicant_ID IS MANDATORY', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO

--MASK
--ALTER TABLE TAR00201_TAR_Applicant_MSTR
--ALTER COLUMN OTVTAR_Cur_Telephone ADD MASKED WITH (FUNCTION = 'partial(0,"XXXX",4)');

--REMOVE PERMISSION UNMASK
--REVOKE UNMASK TO apiCNIQ;

--USE chickasawnation
--GO
--SELECT OTVTAR_Cur_Telephone FROM TAR00201_TAR_Applicant_MSTR;
--GO
--SELECT SYSTEM_USER, USER_NAME();

--DELETE FROM TAR00201_TAR_Applicant_MSTR