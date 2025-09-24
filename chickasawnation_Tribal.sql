CREATE TABLE TAR40200_TAR_Tribal_MSTR
(
    OTVTAR_Tribal_Code CHAR(3) NOT NULL,
    OTVTAR_Tribal_Name CHAR(61) NOT NULL,
    DEX_ROW_ID INT,
    CONSTRAINT PK_TAR_Tribal_MSTR PRIMARY KEY CLUSTERED (OTVTAR_Tribal_Code)
);
GO
CREATE UNIQUE INDEX IX_TAR_Tribal_MSTR_UQ
ON TAR40200_TAR_Tribal_MSTR (OTVTAR_Tribal_Code, OTVTAR_Tribal_Name);
GO
--CREATE STORE PROCEDURE TO INSERT DATA
CREATE PROCEDURE sp_Insert_TAR_Tribal
(
    @OTVTAR_Tribal_Code CHAR(3),
    @OTVTAR_Tribal_Name CHAR(61)
)
AS
BEGIN
    SET NOCOUNT ON;

    -- VALIDATE IF EXIST
    IF EXISTS (
        SELECT 1
        FROM TAR40200_TAR_Tribal_MSTR
        WHERE OTVTAR_Tribal_Code = @OTVTAR_Tribal_Code
    )
    BEGIN
        RAISERROR ('A record with this Tribal Code already exists.', 16, 1);
        RETURN;
    END

    -- CREATE NEW RECORD
    INSERT INTO TAR40200_TAR_Tribal_MSTR
    (
        OTVTAR_Tribal_Code,
        OTVTAR_Tribal_Name
    )
    VALUES
    (
        @OTVTAR_Tribal_Code,
        @OTVTAR_Tribal_Name
    );
END;
GO
--CREATE STORE PROCEDURE TO SEARCH DATA
CREATE PROCEDURE sp_Select_TAR_Tribal
    @OTVTAR_Tribal_Code CHAR(15),
    @OTVTAR_Tribal_Name CHAR(11)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM TAR40200_TAR_Tribal_MSTR
    WHERE OTVTAR_Tribal_Code = @OTVTAR_Tribal_Code
       OR OTVTAR_Tribal_Name = @OTVTAR_Tribal_Name;
END;
GO