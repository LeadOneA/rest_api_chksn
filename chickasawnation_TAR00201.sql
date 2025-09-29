CREATE TABLE TAR00201(
	[OTVTAR_Eligibility_Code] [smallint] NOT NULL,
	[OTVTAR_Program_ID] [char](15) NOT NULL,
	[OTVTAR_Applicant_ID] [char](11) NOT NULL,
	[OTVTAR_Time] [datetime] NOT NULL,
	[OTVTAR_Date] [datetime] NOT NULL,
	[OTVTAR_App_Last_Name] [char](21) NOT NULL,
	[OTVTAR_App_First_Name] [char](21) NOT NULL,
	[OTVTAR_App_Middle_Name] [char](21) NOT NULL,
	[OTVTAR_Cur_Name] [char](31) NOT NULL,
	[OTVTAR_Cur_Address1] [char](31) NOT NULL,
	[OTVTAR_Cur_Address2] [char](31) NOT NULL,
	[OTVTAR_Cur_City] [char](21) NOT NULL,
	[OTVTAR_Cur_CountyCode] [char](3) NOT NULL,
	[OTVTAR_Cur_State] [char](3) NOT NULL,
	[OTVTAR_Cur_ZipCode] [char](11) NOT NULL,
	[OTVTAR_Cur_Telephone] [char](11) NOT NULL,
	[OTVTAR_Perm_Name] [char](31) NOT NULL,
	[OTVTAR_Perm_Address1] [char](31) NOT NULL,
	[OTVTAR_Perm_Address2] [char](31) NOT NULL,
	[OTVTAR_Perm_City] [char](21) NOT NULL,
	[OTVTAR_Perm_State] [char](3) NOT NULL,
	[OTVTAR_Perm_ZipCode] [char](11) NOT NULL,
	[OTVTAR_Perm_Telephone] [char](11) NOT NULL,
	[OTVTAR_Sex] [smallint] NOT NULL,
	[OTVTAR_Project_ID] [char](15) NOT NULL,
	[OTVTAR_Fam_Minority_Code] [smallint] NOT NULL,
	[OTVTAR_Tribal_Code] [char](3) NOT NULL,
	[OTVTAR_Bedrooms] [smallint] NOT NULL,
	[OTVTAR_Birth_Date] [datetime] NOT NULL,
	[OTVTAR_Elderly] [tinyint] NOT NULL,
	[OTVTAR_Disabled] [tinyint] NOT NULL,
	[OTVTAR_Handicapped] [tinyint] NOT NULL,
	[OTVTAR_HusbWife] [tinyint] NOT NULL,
	[OTVTAR_Family_Count] [smallint] NOT NULL,
	[OTVTAR_DIB] [char](7) NOT NULL,
	[OTVTAR_Marital_Status] [smallint] NOT NULL,
	[OTVTAR_Dependent_Count] [smallint] NOT NULL,
	[OTVTAR_VANumber] [char](11) NOT NULL,
	[OTVTAR_Wages] [tinyint] NOT NULL,
	[OTVTAR_Benefits_SS] [tinyint] NOT NULL,
	[OTVTAR_Benefits_SSI] [tinyint] NOT NULL,
	[OTVTAR_Benefits_VA] [tinyint] NOT NULL,
	[OTVTAR_Benefits_Other] [tinyint] NOT NULL,
	[OTVTAR_Welfare_AFDC] [tinyint] NOT NULL,
	[OTVTAR_Welfare_OAA] [tinyint] NOT NULL,
	[OTVTAR_Welfare_AD] [tinyint] NOT NULL,
	[OTVTAR_Welfare_Other] [tinyint] NOT NULL,
	[OTVTAR_Other_Income] [tinyint] NOT NULL,
	[OTVTAR_Gross_Income] [int] NOT NULL,
	[OTVTAR_Adj_Gross_Income] [int] NOT NULL,
	[OTVTAR_Prior_Tenant] [tinyint] NOT NULL,
	[OTVTAR_Anticipated_Rent] [int] NOT NULL,
	[OTVTAR_MHC_Land] [int] NOT NULL,
	[OTVTAR_MHC_Work] [int] NOT NULL,
	[OTVTAR_MHC_Materials] [int] NOT NULL,
	[OTVTAR_MHC_Cash] [int] NOT NULL,
	[OTVTAR_MHC_Equipment] [int] NOT NULL,
	[OTVTAR_Recert_Date] [datetime] NOT NULL,
	[OTVTAR_Empr_Name] [char](31) NOT NULL,
	[OTVTAR_Empr_Address1] [char](31) NOT NULL,
	[OTVTAR_Empr_Address2] [char](31) NOT NULL,
	[OTVTAR_Empr_City] [char](21) NOT NULL,
	[OTVTAR_Empr_State] [char](3) NOT NULL,
	[OTVTAR_Empr_ZipCode] [char](11) NOT NULL,
	[OTVTAR_Empr_Telephone] [char](11) NOT NULL,
	[OTVTAR_Housing_Code] [smallint] NOT NULL,
	[OTVTAR_Housing_Cost] [int] NOT NULL,
	[OTVTAR_Priority_Code] [smallint] NOT NULL,
	[OTVTAR_Credit_Verified] [tinyint] NOT NULL,
	[OTVTAR_Total_Assets] [int] NOT NULL,
	[OTVTAR_Previous_Aid] [tinyint] NOT NULL,
	[OTVTAR_Removal_Code] [smallint] NOT NULL,
	[OTVTAR_Removal_Date] [datetime] NOT NULL,
	[OTVTAR_Priority_Rank] [smallint] NOT NULL,
	[OTVTAR_OverCrowded] [tinyint] NOT NULL,
	[NOTEINDX] [numeric](19, 5) NOT NULL,
	[OTVTAR_Veteran] [tinyint] NOT NULL,
	[DEX_ROW_ID] [int] IDENTITY(1,1) NOT NULL,
CONSTRAINT [PKTAR00201] PRIMARY KEY CLUSTERED 
(
	[OTVTAR_Program_ID] ASC,
	[OTVTAR_Applicant_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
 
ALTER TABLE [dbo].[TAR00201]  WITH CHECK ADD CHECK  ((datepart(day,[OTVTAR_Time])=(1) AND datepart(month,[OTVTAR_Time])=(1) AND datepart(year,[OTVTAR_Time])=(1900)))
GO
 
ALTER TABLE [dbo].[TAR00201]  WITH CHECK ADD CHECK  ((datepart(hour,[OTVTAR_Date])=(0) AND datepart(minute,[OTVTAR_Date])=(0) AND datepart(second,[OTVTAR_Date])=(0) AND datepart(millisecond,[OTVTAR_Date])=(0)))
GO
 
ALTER TABLE [dbo].[TAR00201]  WITH CHECK ADD CHECK  ((datepart(hour,[OTVTAR_Birth_Date])=(0) AND datepart(minute,[OTVTAR_Birth_Date])=(0) AND datepart(second,[OTVTAR_Birth_Date])=(0) AND datepart(millisecond,[OTVTAR_Birth_Date])=(0)))
GO
 
ALTER TABLE [dbo].[TAR00201]  WITH CHECK ADD CHECK  ((datepart(hour,[OTVTAR_Recert_Date])=(0) AND datepart(minute,[OTVTAR_Recert_Date])=(0) AND datepart(second,[OTVTAR_Recert_Date])=(0) AND datepart(millisecond,[OTVTAR_Recert_Date])=(0)))
GO
 
ALTER TABLE [dbo].[TAR00201]  WITH CHECK ADD CHECK  ((datepart(hour,[OTVTAR_Removal_Date])=(0) AND datepart(minute,[OTVTAR_Removal_Date])=(0) AND datepart(second,[OTVTAR_Removal_Date])=(0) AND datepart(millisecond,[OTVTAR_Removal_Date])=(0)))
GO