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
    OTVTAR_Program_ID       CHAR(15),
    OTVTAR_Applicant_ID     CHAR(11),
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
    @OTVTAR_Removal_Date DATETIME,
    @DEX_ROW_ID INT
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
        OTVTAR_Removal_Code, OTVTAR_Removal_Date, DEX_ROW_ID
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
        @OTVTAR_Removal_Code, @OTVTAR_Removal_Date, @DEX_ROW_ID
    );
END;
GO

-- UPDATE STORE PROCEDURE
CREATE PROCEDURE sp_Update_TAR_Applicant
    @DEX_ROW_ID INT = NULL,
    @OTVTAR_Eligibility_Code SMALLINT = NULL,
    @OTVTAR_Program_ID CHAR(15) = NULL,
    @OTVTAR_Applicant_ID CHAR(11) = NULL,
    @OTVTAR_Time DATETIME = NULL,
    @OTVTAR_Date DATETIME = NULL,
    @OTVTAR_App_Last_Name CHAR(21) = NULL,
    @OTVTAR_App_First_Name CHAR(21) = NULL,
    @OTVTAR_App_Middle_Name CHAR(21) = NULL,
    @OTVTAR_Cur_Name CHAR(31) = NULL,
    @OTVTAR_Cur_Address1 CHAR(31) = NULL,
    @OTVTAR_Cur_Address2 CHAR(31) = NULL,
    @OTVTAR_Cur_City CHAR(21) = NULL,
    @OTVTAR_Cur_CountyCode CHAR(3) = NULL,
    @OTVTAR_Cur_State CHAR(3) = NULL,
    @OTVTAR_Cur_ZipCode CHAR(11) = NULL,
    @OTVTAR_Cur_Telephone CHAR(11) = NULL,
    @OTVTAR_Perm_Name CHAR(31) = NULL,
    @OTVTAR_Perm_Address1 CHAR(31) = NULL,
    @OTVTAR_Perm_Address2 CHAR(31) = NULL,
    @OTVTAR_Perm_City CHAR(21) = NULL,
    @OTVTAR_Perm_State CHAR(3) = NULL,
    @OTVTAR_Perm_ZipCode CHAR(11) = NULL,
    @OTVTAR_Perm_Telephone CHAR(11) = NULL,
    @OTVTAR_Sex SMALLINT = NULL,
    @OTVTAR_Project_ID CHAR(15) = NULL,
    @OTVTAR_Fam_Minority_Code SMALLINT = NULL,
    @OTVTAR_Tribal_Code CHAR(3) = NULL,
    @OTVTAR_Bedrooms SMALLINT = NULL,
    @OTVTAR_Birth_Date DATETIME = NULL,
    @OTVTAR_Elderly TINYINT = NULL,
    @OTVTAR_Disabled TINYINT = NULL,
    @OTVTAR_Handicapped TINYINT = NULL,
    @OTVTAR_HusbWife TINYINT = NULL,
    @OTVTAR_Family_Count SMALLINT = NULL,
    @OTVTAR_DIB CHAR(7) = NULL,
    @OTVTAR_Marital_Status SMALLINT = NULL,
    @OTVTAR_Dependent_Count SMALLINT = NULL,
    @OTVTAR_VANumber CHAR(11) = NULL,
    @OTVTAR_Wages TINYINT = NULL,
    @OTVTAR_Benefits_SS TINYINT = NULL,
    @OTVTAR_Benefits_SSI TINYINT = NULL,
    @OTVTAR_Benefits_VA TINYINT = NULL,
    @OTVTAR_Benefits_Other TINYINT = NULL,
    @OTVTAR_Welfare_AFDC TINYINT = NULL,
    @OTVTAR_Welfare_OAA TINYINT = NULL,
    @OTVTAR_Welfare_AD TINYINT = NULL,
    @OTVTAR_Welfare_Other TINYINT = NULL,
    @OTVTAR_Other_Income TINYINT = NULL,
    @OTVTAR_Gross_Income INT = NULL,
    @OTVTAR_Adj_Gross_Income INT = NULL,
    @OTVTAR_Prior_Tenant TINYINT = NULL,
    @OTVTAR_Anticipated_Rent INT = NULL,
    @OTVTAR_MHC_Land INT = NULL,
    @OTVTAR_MHC_Work INT = NULL,
    @OTVTAR_MHC_Materials INT = NULL,
    @OTVTAR_MHC_Cash INT = NULL,
    @OTVTAR_MHC_Equipment INT = NULL,
    @OTVTAR_Recert_Date DATETIME = NULL,
    @OTVTAR_Empr_Name CHAR(31) = NULL,
    @OTVTAR_Empr_Address1 CHAR(31) = NULL,
    @OTVTAR_Empr_Address2 CHAR(31) = NULL,
    @OTVTAR_Empr_City CHAR(21) = NULL,
    @OTVTAR_Empr_State CHAR(3) = NULL,
    @OTVTAR_Empr_ZipCode CHAR(11) = NULL,
    @OTVTAR_Empr_Telephone CHAR(11) = NULL,
    @OTVTAR_Housing_Code SMALLINT = NULL,
    @OTVTAR_Housing_Cost INT = NULL,
    @OTVTAR_Priority_Code SMALLINT = NULL,
    @OTVTAR_Credit_Verified TINYINT = NULL,
    @OTVTAR_Total_Assets INT = NULL,
    @OTVTAR_Previous_Aid TINYINT = NULL,
    @OTVTAR_Removal_Code SMALLINT = NULL,
    @OTVTAR_Removal_Date DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- EXIST THE RECORD?
    IF NOT EXISTS (
        SELECT 1
        FROM TAR00201_TAR_Applicant_MSTR
        WHERE OTVTAR_Program_ID = @OTVTAR_Program_ID AND
        OTVTAR_Applicant_ID = @OTVTAR_Applicant_ID
    )
    BEGIN
        RAISERROR('RECORD NOT FOUND', 16, 1);
        RETURN;
    END;

    -- UPDATE IF ANY VALUE IS NOT NULL
    UPDATE TAR00201_TAR_Applicant_MSTR
    SET
        OTVTAR_Eligibility_Code = COALESCE(@OTVTAR_Eligibility_Code, OTVTAR_Eligibility_Code),
        OTVTAR_Program_ID = COALESCE(@OTVTAR_Program_ID, OTVTAR_Program_ID),
        OTVTAR_Applicant_ID = COALESCE(@OTVTAR_Applicant_ID, OTVTAR_Applicant_ID),
        OTVTAR_Time = COALESCE(@OTVTAR_Time, OTVTAR_Time),
        OTVTAR_Date = COALESCE(@OTVTAR_Date, OTVTAR_Date),
        OTVTAR_App_Last_Name = COALESCE(@OTVTAR_App_Last_Name, OTVTAR_App_Last_Name),
        OTVTAR_App_First_Name = COALESCE(@OTVTAR_App_First_Name, OTVTAR_App_First_Name),
        OTVTAR_App_Middle_Name = COALESCE(@OTVTAR_App_Middle_Name, OTVTAR_App_Middle_Name),
        OTVTAR_Cur_Name = COALESCE(@OTVTAR_Cur_Name, OTVTAR_Cur_Name),
        OTVTAR_Cur_Address1 = COALESCE(@OTVTAR_Cur_Address1, OTVTAR_Cur_Address1),
        OTVTAR_Cur_Address2 = COALESCE(@OTVTAR_Cur_Address2, OTVTAR_Cur_Address2),
        OTVTAR_Cur_City = COALESCE(@OTVTAR_Cur_City, OTVTAR_Cur_City),
        OTVTAR_Cur_CountyCode = COALESCE(@OTVTAR_Cur_CountyCode, OTVTAR_Cur_CountyCode),
        OTVTAR_Cur_State = COALESCE(@OTVTAR_Cur_State, OTVTAR_Cur_State),
        OTVTAR_Cur_ZipCode = COALESCE(@OTVTAR_Cur_ZipCode, OTVTAR_Cur_ZipCode),
        OTVTAR_Cur_Telephone = COALESCE(@OTVTAR_Cur_Telephone, OTVTAR_Cur_Telephone),
        OTVTAR_Perm_Name = COALESCE(@OTVTAR_Perm_Name, OTVTAR_Perm_Name),
        OTVTAR_Perm_Address1 = COALESCE(@OTVTAR_Perm_Address1, OTVTAR_Perm_Address1),
        OTVTAR_Perm_Address2 = COALESCE(@OTVTAR_Perm_Address2, OTVTAR_Perm_Address2),
        OTVTAR_Perm_City = COALESCE(@OTVTAR_Perm_City, OTVTAR_Perm_City),
        OTVTAR_Perm_State = COALESCE(@OTVTAR_Perm_State, OTVTAR_Perm_State),
        OTVTAR_Perm_ZipCode = COALESCE(@OTVTAR_Perm_ZipCode, OTVTAR_Perm_ZipCode),
        OTVTAR_Perm_Telephone = COALESCE(@OTVTAR_Perm_Telephone, OTVTAR_Perm_Telephone),
        OTVTAR_Sex = COALESCE(@OTVTAR_Sex, OTVTAR_Sex),
        OTVTAR_Project_ID = COALESCE(@OTVTAR_Project_ID, OTVTAR_Project_ID),
        OTVTAR_Fam_Minority_Code = COALESCE(@OTVTAR_Fam_Minority_Code, OTVTAR_Fam_Minority_Code),
        OTVTAR_Tribal_Code = COALESCE(@OTVTAR_Tribal_Code, OTVTAR_Tribal_Code),
        OTVTAR_Bedrooms = COALESCE(@OTVTAR_Bedrooms, OTVTAR_Bedrooms),
        OTVTAR_Birth_Date = COALESCE(@OTVTAR_Birth_Date, OTVTAR_Birth_Date),
        OTVTAR_Elderly = COALESCE(@OTVTAR_Elderly, OTVTAR_Elderly),
        OTVTAR_Disabled = COALESCE(@OTVTAR_Disabled, OTVTAR_Disabled),
        OTVTAR_Handicapped = COALESCE(@OTVTAR_Handicapped, OTVTAR_Handicapped),
        OTVTAR_HusbWife = COALESCE(@OTVTAR_HusbWife, OTVTAR_HusbWife),
        OTVTAR_Family_Count = COALESCE(@OTVTAR_Family_Count, OTVTAR_Family_Count),
        OTVTAR_DIB = COALESCE(@OTVTAR_DIB, OTVTAR_DIB),
        OTVTAR_Marital_Status = COALESCE(@OTVTAR_Marital_Status, OTVTAR_Marital_Status),
        OTVTAR_Dependent_Count = COALESCE(@OTVTAR_Dependent_Count, OTVTAR_Dependent_Count),
        OTVTAR_VANumber = COALESCE(@OTVTAR_VANumber, OTVTAR_VANumber),
        OTVTAR_Wages = COALESCE(@OTVTAR_Wages, OTVTAR_Wages),
        OTVTAR_Benefits_SS = COALESCE(@OTVTAR_Benefits_SS, OTVTAR_Benefits_SS),
        OTVTAR_Benefits_SSI = COALESCE(@OTVTAR_Benefits_SSI, OTVTAR_Benefits_SSI),
        OTVTAR_Benefits_VA = COALESCE(@OTVTAR_Benefits_VA, OTVTAR_Benefits_VA),
        OTVTAR_Benefits_Other = COALESCE(@OTVTAR_Benefits_Other, OTVTAR_Benefits_Other),
        OTVTAR_Welfare_AFDC = COALESCE(@OTVTAR_Welfare_AFDC, OTVTAR_Welfare_AFDC),
        OTVTAR_Welfare_OAA = COALESCE(@OTVTAR_Welfare_OAA, OTVTAR_Welfare_OAA),
        OTVTAR_Welfare_AD = COALESCE(@OTVTAR_Welfare_AD, OTVTAR_Welfare_AD),
        OTVTAR_Welfare_Other = COALESCE(@OTVTAR_Welfare_Other, OTVTAR_Welfare_Other),
        OTVTAR_Other_Income = COALESCE(@OTVTAR_Other_Income, OTVTAR_Other_Income),
        OTVTAR_Gross_Income = COALESCE(@OTVTAR_Gross_Income, OTVTAR_Gross_Income),
        OTVTAR_Adj_Gross_Income = COALESCE(@OTVTAR_Adj_Gross_Income, OTVTAR_Adj_Gross_Income),
        OTVTAR_Prior_Tenant = COALESCE(@OTVTAR_Prior_Tenant, OTVTAR_Prior_Tenant),
        OTVTAR_Anticipated_Rent = COALESCE(@OTVTAR_Anticipated_Rent, OTVTAR_Anticipated_Rent),
        OTVTAR_MHC_Land = COALESCE(@OTVTAR_MHC_Land, OTVTAR_MHC_Land),
        OTVTAR_MHC_Work = COALESCE(@OTVTAR_MHC_Work, OTVTAR_MHC_Work),
        OTVTAR_MHC_Materials = COALESCE(@OTVTAR_MHC_Materials, OTVTAR_MHC_Materials),
        OTVTAR_MHC_Cash = COALESCE(@OTVTAR_MHC_Cash, OTVTAR_MHC_Cash),
        OTVTAR_MHC_Equipment = COALESCE(@OTVTAR_MHC_Equipment, OTVTAR_MHC_Equipment),
        OTVTAR_Recert_Date = COALESCE(@OTVTAR_Recert_Date, OTVTAR_Recert_Date),
        OTVTAR_Empr_Name = COALESCE(@OTVTAR_Empr_Name, OTVTAR_Empr_Name),
        OTVTAR_Empr_Address1 = COALESCE(@OTVTAR_Empr_Address1, OTVTAR_Empr_Address1),
        OTVTAR_Empr_Address2 = COALESCE(@OTVTAR_Empr_Address2, OTVTAR_Empr_Address2),
        OTVTAR_Empr_City = COALESCE(@OTVTAR_Empr_City, OTVTAR_Empr_City),
        OTVTAR_Empr_State = COALESCE(@OTVTAR_Empr_State, OTVTAR_Empr_State),
        OTVTAR_Empr_ZipCode = COALESCE(@OTVTAR_Empr_ZipCode, OTVTAR_Empr_ZipCode),
        OTVTAR_Empr_Telephone = COALESCE(@OTVTAR_Empr_Telephone, OTVTAR_Empr_Telephone),
        OTVTAR_Housing_Code = COALESCE(@OTVTAR_Housing_Code, OTVTAR_Housing_Code),
        OTVTAR_Housing_Cost = COALESCE(@OTVTAR_Housing_Cost, OTVTAR_Housing_Cost),
        OTVTAR_Priority_Code = COALESCE(@OTVTAR_Priority_Code, OTVTAR_Priority_Code),
        OTVTAR_Credit_Verified = COALESCE(@OTVTAR_Credit_Verified, OTVTAR_Credit_Verified),
        OTVTAR_Total_Assets = COALESCE(@OTVTAR_Total_Assets, OTVTAR_Total_Assets),
        OTVTAR_Previous_Aid = COALESCE(@OTVTAR_Previous_Aid, OTVTAR_Previous_Aid),
        OTVTAR_Removal_Code = COALESCE(@OTVTAR_Removal_Code, OTVTAR_Removal_Code),
        OTVTAR_Removal_Date = COALESCE(@OTVTAR_Removal_Date, OTVTAR_Removal_Date)
    WHERE OTVTAR_Program_ID = @OTVTAR_Program_ID AND OTVTAR_Applicant_ID = @OTVTAR_Applicant_ID;
END;
GO

--SELECT STORE PROCEDURE
CREATE OR ALTER PROCEDURE sp_Get_TAR_Applicant
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        OTVTAR_Eligibility_Code AS 'E-CODE',
        OTVTAR_Time AS 'TIME',
        OTVTAR_Date AS 'DATE',
        OTVTAR_App_Last_Name AS 'LAST NAME',
        OTVTAR_App_First_Name AS 'FIRST NAME',
        OTVTAR_App_Middle_Name AS 'MIDDLE NAME',
        OTVTAR_Sex AS 'SEX',
        OTVTAR_Priority_Code AS 'PRIORITY CODE',
        OTVTAR_Credit_Verified AS 'CREDIT VERIFIED',
        OTVTAR_Total_Assets 'TOTAL ASSETS'
    FROM TAR00201_TAR_Applicant_MSTR
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

use chickasawnation;
GO
CREATE PROCEDURE sp_Select_TAR_Applicant
    @OTVTAR_Program_ID CHAR(15),
    @OTVTAR_Applicant_ID CHAR(11)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM TAR00201_TAR_Applicant_MSTR
    WHERE OTVTAR_Program_ID = @OTVTAR_Program_ID
       OR OTVTAR_Applicant_ID = @OTVTAR_Applicant_ID;
END;
GO
