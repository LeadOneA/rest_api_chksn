USE chickasawnation;
GO
CREATE TABLE TAR00100_TAR_Program_MSTR(
    OTVTAR_Program_ID CHAR(15) NOT NULL,
    OTVTAR_Program_Descripti CHAR(31),
    DEX_ROW_ID INT,
    CONSTRAINT PK_TAR_Program_MSTR PRIMARY KEY CLUSTERED (OTVTAR_Program_ID)
);
GO

CREATE UNIQUE INDEX UX_TAR_Program_MSTR_ID_Descripti
ON TAR00100_TAR_Program_MSTR (OTVTAR_Program_ID, OTVTAR_Program_Descripti);
GO
--CREATE STORE PROCEDURE TO INSERT DATA
CREATE PROCEDURE sp_Insert_TAR_Program
    @OTVTAR_Program_ID CHAR(15),
    @OTVTAR_Program_Descripti CHAR(31),
    @DEX_ROW_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (
        SELECT 1
        FROM TAR00100_TAR_Program_MSTR
        WHERE OTVTAR_Program_ID = @OTVTAR_Program_ID
    )
    BEGIN
        INSERT INTO TAR00100_TAR_Program_MSTR (OTVTAR_Program_ID, OTVTAR_Program_Descripti, DEX_ROW_ID)
        VALUES (@OTVTAR_Program_ID, @OTVTAR_Program_Descripti, @DEX_ROW_ID);
    END
    ELSE
    BEGIN
        RAISERROR ('A record with this Program Id already exists.', 16, 1);
        RETURN;
    END
END;
GO

--CREATE STORE PROCEDURE TO SEARCH DATA
CREATE PROCEDURE sp_Select_TAR_Program
    @OTVTAR_Program_ID CHAR(15),
    @OTVTAR_Program_Descripti CHAR(11)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM TAR00100_TAR_Program_MSTR
    WHERE OTVTAR_Program_ID = @OTVTAR_Program_ID
       OR OTVTAR_Program_Descripti = @OTVTAR_Program_Descripti;
END;
GO