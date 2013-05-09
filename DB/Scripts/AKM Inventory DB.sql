set nocount on

use master
go
-- If the database already exists then drop it
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'intranet5')
BEGIN
    -- First kick everybody else off so that the database can be dropped successfully
    alter database [intranet5] set single_user with rollback immediate
    DROP DATABASE [intranet5]
END
GO

-- Create a new database
CREATE DATABASE [intranet5]
    ON (NAME = N'intranet5_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\intranet5_Data.MDF' , SIZE = 10MB, FILEGROWTH = 10%)
    LOG ON (NAME = N'intranet5_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\intranet5_Log.LDF' , SIZE = 1MB, FILEGROWTH = 10%)
    COLLATE SQL_Latin1_General_CP1_CI_AS
GO

-- Explicitly set each of the database options
exec sp_dboption N'intranet5', N'autoclose', N'false'
GO

exec sp_dboption N'intranet5', N'bulkcopy', N'true'
GO
-- NOTE: This option must be changed to 'false' in the production system
-- A setting of true sets the 'Recovery Model' to 'Simple'
-- A setting of false sets the 'Recovery Model' to 'Full'
-- The 'Full' recovery model requires transaction log management (scheduled backups)
exec sp_dboption N'intranet5', N'trunc. log', N'true'
GO

exec sp_dboption N'intranet5', N'torn page detection', N'true'
GO

exec sp_dboption N'intranet5', N'read only', N'false'
GO

exec sp_dboption N'intranet5', N'dbo use', N'false'
GO

exec sp_dboption N'intranet5', N'single', N'false'
GO

exec sp_dboption N'intranet5', N'autoshrink', N'false'
GO

exec sp_dboption N'intranet5', N'ANSI null default', N'false'
GO

exec sp_dboption N'intranet5', N'recursive triggers', N'false'
GO

exec sp_dboption N'intranet5', N'ANSI nulls', N'false'
GO

exec sp_dboption N'intranet5', N'concat null yields null', N'false'
GO

exec sp_dboption N'intranet5', N'cursor close on commit', N'false'
GO

exec sp_dboption N'intranet5', N'default to local cursor', N'false'
GO

exec sp_dboption N'intranet5', N'quoted identifier', N'false'
GO

exec sp_dboption N'intranet5', N'ANSI warnings', N'false'
GO

exec sp_dboption N'intranet5', N'auto create statistics', N'true'
GO

exec sp_dboption N'intranet5', N'auto update statistics', N'true'
GO

if( ( (@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 724) )
 or ( (@@microsoftversion / power(2, 24) = 7) and (@@microsoftversion & 0xffff >= 1082) ) )
    exec sp_dboption N'intranet5', N'db chaining', N'false'
GO

use intranet5
go

--exec sp_changedbowner akmsa

-- DatabaseRole [DR_RELSUser_role]
CREATE ROLE [DR_RELSUser_role] AUTHORIZATION [dbo]
GO
-- DatabaseRole [DW_RELSUser_role]
CREATE ROLE [DW_RELSUser_role] AUTHORIZATION [dbo]
GO

-- ********************************************************************************
-- Create the user-defined data types
-- ********************************************************************************

-- User defined defaults
create default dbo.Set_To_Empty_String as ''
go
create default dbo.Set_To_Zero as 0
go

set nocount on
-- User defined types used in the creation of the table schemas
execute sp_addtype t_ID,                'Int',          'NULL', 'dbo'
execute sp_addtype t_IDEncrypted,       'Varchar(30)',  'NULL', 'dbo'
execute sp_addtype t_LogNumber,         'Int',          'NULL', 'dbo'
execute sp_bindefault 'dbo.Set_To_Zero', 't_LogNumber'
execute sp_addtype t_EnterpriseLogNumber, 'BigInt',     'NULL', 'dbo'
execute sp_bindefault 'dbo.Set_To_Zero', 't_EnterpriseLogNumber'
execute sp_addtype t_SequenceNumber,    'Int',          'NULL', 'dbo'
execute sp_addtype t_Count,             'Int',          'NULL', 'dbo'
execute sp_addtype t_Code,              'Smallint',     'NULL', 'dbo'
execute sp_addtype t_Flag,              'Bit',          'NULL', 'dbo'
execute sp_bindefault 'dbo.Set_To_Zero', 't_Flag'
execute sp_addtype t_Money,             'Money',        'NULL', 'dbo'
execute sp_addtype t_Quantity,          'Float',        'NULL', 'dbo'
execute sp_addtype t_Percent,           'Money',        'NULL', 'dbo'
execute sp_addtype t_Text,              'Text',         'NULL', 'dbo'
execute sp_addtype t_Signature,         'Image',        'NULL', 'dbo'
execute sp_addtype t_TimeStamp,         'DateTime',     'NULL', 'dbo'
execute sp_addtype t_Description,       'Varchar(100)', 'NULL', 'dbo'
execute sp_addtype t_AccountID,         'Varchar(20)',  'NULL', 'dbo'
execute sp_addtype t_AccountEncrypted,  'Varchar(60)',  'NULL', 'dbo'
execute sp_addtype t_ItemID,            'Varchar(20)',  'NULL', 'dbo'
execute sp_addtype t_MerchandiseID,     'int',          'NULL', 'dbo'
execute sp_addtype t_DepartmentID,      'Int',          'NULL', 'dbo'
execute sp_addtype t_AuthCode,          'Varchar(10)',  'NULL', 'dbo'
execute sp_addtype t_FullName,          'Varchar(60)',  'NULL', 'dbo'
execute sp_addtype t_Name,              'Varchar(40)',  'NULL', 'dbo'
execute sp_addtype t_LongName,          'Varchar(40)',  'NULL', 'dbo'
execute sp_addtype t_ShortName,         'Varchar(20)',  'NULL', 'dbo'
execute sp_addtype t_Password,          'Varchar(20)',  'NULL', 'dbo'
exec sp_bindefault 'dbo.Set_To_Empty_String', 't_Password'
execute sp_addtype t_Address,           'Varchar(50)',  'NULL', 'dbo'
execute sp_addtype t_City,              'Varchar(30)',  'NULL', 'dbo'
execute sp_addtype t_State,             'Varchar(20)',  'NULL', 'dbo'
execute sp_addtype t_PostalCode,        'Varchar(15)',  'NULL', 'dbo'
execute sp_addtype t_Phone,             'Varchar(20)',  'NULL', 'dbo'
execute sp_addtype t_Char,              'Char(1)',      'NULL', 'dbo'
execute sp_addtype t_Email,             'Varchar(80)',  'NULL', 'dbo'
execute sp_addtype t_Salutation,        'Varchar(5)',   'NULL', 'dbo'
execute sp_addtype t_TaxCode,           'Varchar(5)',   'NULL', 'dbo'
execute sp_addtype t_Code2,             'Varchar(2)',   'NULL', 'dbo'
execute sp_addtype t_Code3,             'Varchar(3)',   'NULL', 'dbo'
execute sp_addtype t_LongDescription,   'Varchar(300)', 'NULL', 'dbo'
execute sp_addtype t_MessageID,         'Varchar(70)',  'NULL', 'dbo'
execute sp_addtype t_PrintLine,         'Varchar(52)',  'NULL', 'dbo'
execute sp_addtype t_TrackingNumber,    'Varchar(25)',  'NULL', 'dbo'
execute sp_addtype t_MailBoxNumber,     'Varchar(10)',  'NULL', 'dbo'
execute sp_addtype t_ReferenceNumber,   'Varchar(22)',  'NULL', 'dbo'
execute sp_addtype t_LabelTemplate,     'Varchar(2000)','NULL', 'dbo'
execute sp_addtype t_Parameter,         'Varchar(32)',  'NULL', 'dbo'
execute sp_addtype t_SQL,               'Varchar(1000)','NULL', 'dbo'
execute sp_addtype t_ShortDate,         'SmallDateTime','NULL', 'dbo'
execute sp_addtype t_Notes,             'Varchar (300)','NULL', 'dbo'
execute sp_addtype t_ShortDescription,  'Varchar (64)', 'NULL', 'dbo'
execute sp_addtype t_Hours,             'Decimal(10,2)','NULL', 'dbo'
execute sp_addtype t_PurchaseOrderNumber,'Varchar(25)','NULL', 'dbo'
execute sp_addtype t_Attribute,         'Varchar (255)','NULL', 'dbo'
execute sp_addtype t_SerialNumber,      'Varchar (20)','NULL', 'dbo'
execute sp_addtype t_VendorID,          'Varchar(20)','NULL', 'dbo'
execute sp_addtype t_VendorName,        'Varchar(100)','NULL', 'dbo'
execute sp_addtype t_ItemAttribute,     'Varchar (30)','NULL', 'dbo'
execute sp_addtype t_MessageTitle,      'Varchar (40)','NULL', 'dbo'
execute sp_addtype t_MessageText,       'Varchar (1024)','NULL', 'dbo'
execute sp_addtype t_ReceiptID,         'Varchar (64)','NULL', 'dbo'
execute sp_addtype t_Amount,            'Decimal(18,5)','NULL', 'dbo'
execute sp_addtype t_Encrypted,         'Varbinary(8000)', 'NULL', 'dbo'
execute sp_addtype t_LongSerialNumber,  'Varchar(40)', 'NULL', 'dbo'
execute sp_addtype t_CustomerID,        'BigInt',     'NULL', 'dbo'
execute sp_addtype t_Planogram,         'Varchar(5)',   'NULL', 'dbo'
go
