USE chickasawnation;  
GO  

-- CREATE THE TABLE TAR40100_TAR_County_MSTR (CLUSTERED)
CREATE TABLE TAR40100_TAR_County_MSTR (
    OTVTAR_CountyCode CHAR(3) NOT NULL,
    OTVTAR_CountyName CHAR(31) NOT NULL,
    DEX_ROW_ID INT,
    CONSTRAINT PK_TAR_County_MSTR PRIMARY KEY CLUSTERED (OTVTAR_CountyCode)
);
GO  

--CREATE INDEX(UNIQUES) 
CREATE UNIQUE INDEX UQ_TAR_County_Code_Name
ON TAR40100_TAR_County_MSTR (OTVTAR_CountyCode, OTVTAR_CountyName);
GO  

USE chickasawnation;
GO

-- CREATE STORE PROCEDURE TO INSERT (TABLE NAME: TAR40100_TAR_County_MSTR)
CREATE PROCEDURE sp_Insert_TAR_County
    @OTVTAR_CountyCode CHAR(3),
    @OTVTAR_CountyName CHAR(31),
    @DEX_ROW_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- VALIDATE IF EXIST THE COMBINATION BETWEEN OTVTAR_CountyCode AND OTVTAR_CountyName
    IF EXISTS (
        SELECT 1 
        FROM TAR40100_TAR_County_MSTR
        WHERE OTVTAR_CountyCode = @OTVTAR_CountyCode
           OR (OTVTAR_CountyCode = @OTVTAR_CountyCode AND OTVTAR_CountyName = @OTVTAR_CountyName)
    )
    BEGIN
        RAISERROR ('A record with this County Code or Code-Name combination already exists.', 16, 1);
        RETURN;
    END;

    -- INSERT NEW RECORD
    INSERT INTO TAR40100_TAR_County_MSTR (
        OTVTAR_CountyCode,
        OTVTAR_CountyName,
        DEX_ROW_ID
    )
    VALUES (
        @OTVTAR_CountyCode,
        @OTVTAR_CountyName,
        @DEX_ROW_ID
    );
END;
GO

CREATE PROCEDURE sp_Select_TAR_County
    @OTVTAR_CountyCode CHAR(15),
    @OTVTAR_CountyName CHAR(11)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM TAR40100_TAR_County_MSTR
    WHERE OTVTAR_CountyCode = @OTVTAR_CountyCode
       OR OTVTAR_CountyName = @OTVTAR_CountyName;
END;
GO