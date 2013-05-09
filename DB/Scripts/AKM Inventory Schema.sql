--*****************************************************************
--* Revision History
--*
--* 2013-04-08 8:00am  Data Model Version Draft 1.01 
--* 2013-05-08 8:00am  Data Model Version Draft 1.02 
--*****************************************************************

use <intranet5>

go
-- DatabaseRole [DR_RELSUser_role]
CREATE ROLE [DR_RELSUser_role] AUTHORIZATION [dbo]
GO
-- DatabaseRole [DW_RELSUser_role]
CREATE ROLE [DW_RELSUser_role] AUTHORIZATION [dbo]
GO

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

if exists (select * from sysobjects where id = object_id('Address'))
begin
   print 'Dropping old version of Address'
   drop table Address
end
go

if exists (select * from sysobjects where id = object_id('POAudit'))
begin
   print 'Dropping old version of POAudit'
   drop table POAudit
end
go

if exists (select * from sysobjects where id = object_id('POItems'))
begin
   print 'Dropping old version of POItems'
   drop table POItems
end
go

if exists (select * from sysobjects where id = object_id('POFrequency'))
begin
   print 'Dropping old version of POFrequency'
   drop table POFrequency
end
go

if exists (select * from sysobjects where id = object_id('POLocation'))
begin
   print 'Dropping old version of POLocation'
   drop table POLocation
end
go

if exists (select * from sysobjects where id = object_id('POLocationTypes'))
begin
   print 'Dropping old version of POLocationTypes'
   drop table POLocationTypes
end
go

if exists (select * from sysobjects where id = object_id('POPlanogram'))
begin
   print 'Dropping old version of POPlanogram'
   drop table POPlanogram
end
go

if exists (select * from sysobjects where id = object_id('POProductLines'))
begin
   print 'Dropping old version of POProductLines'
   drop table POProductLines
end
go

if exists (select * from sysobjects where id = object_id('POTracking'))
begin
   print 'Dropping old version of POTracking'
   drop table POTracking
end
go

if exists (select * from sysobjects where id = object_id('POWarehouseLocation'))
begin
   print 'Dropping old version of POWarehouseLocation'
   drop table POWarehouseLocation
end
go

if exists (select * from sysobjects where id = object_id('PurchaseOrder'))
begin
   print 'Dropping old version of PurchaseOrder'
   drop table PurchaseOrder
end
go

if exists (select * from sysobjects where id = object_id('StockLedgerAccount'))
begin
   print 'Dropping old version of StockLedgerAccount'
   drop table StockLedgerAccount
end
go


/*==============================================================*/
/* Table: Address                                               */
/*==============================================================*/
print 'Creating new version of Address'
create table [dbo].[Address] (
	AddressID                       t_ID			NOT NULL,
    AddressLine1                    t_Address       NULL,
    AddressLine2                    t_Address       NULL,
    AddressLine3                    t_Address       NULL,
    City                            t_City          NULL,
    State                           t_State         NULL,
    PostalCode                      t_PostalCode    NULL,
    Country                         t_Address       NULL,
	Phone							t_Phone			NULL,
	Extension						t_Phone			NULL,
	ActiveDate						t_TimeStamp		NULL,
	ShippingDescription				t_Description		NULL,

    constraint cpk_Address primary key clustered (AddressID)
)
go

/*==============================================================*/
/* Table: POAudit                                               */
/*==============================================================*/
print 'Creating new version of POAudit'
CREATE TABLE [dbo].[POAudit](
	AuditID						t_ID					NOT NULL,
	SequenceNumber				t_SequenceNumber		NOT NULL,
	DateTime					t_TimeStamp				NOT NULL default current_timestamp,
	TypeCode					t_Code					NOT NULL default 1,
	UserName					t_Name					NULL,
	Description					t_LongDescription		NULL,
	constraint Audit_PK primary key nonclustered (AuditID, SequenceNumber)
) 
go


grant select on DBO.POAudit to DR_RELSUSER_role
grant select, insert, update, delete on DBO.POAudit to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: POItems                                               */
/*==============================================================*/
print 'Creating new version of POItems'
CREATE TABLE [dbo].[POItems](
	ItemID						t_ItemID				NOT NULL,
	OrderID						t_PurchaseOrderNumber	NOT NULL,
	VendorItemID				t_ID					NULL,
	Description					t_Description			NULL,
	DateTime					t_TimeStamp				NULL,
	LocationOnHandItemCount		t_Count					NULL,
	InTransitItemCount			t_Count					NULL,
	LastOrderItemsSalesCount	t_Count					NULL,
	AnticipatedItemSalesCount	t_Count					NULL,
	MaxLocationItemCount		t_Count					NULL,
	MaxItemCount				t_Count					NULL,
	OrderQuantity				t_Count					NULL,
	SentQuantity				t_Count					NULL,
	ReceivedQuantity			t_Count					NULL,
	StatusCode					t_Code					NULL,
	constraint POItems_PK primary key nonclustered (ItemID, OrderID)
) 
go


grant select on DBO.POItems to DR_RELSUSER_role
grant select, insert, update, delete on DBO.POItems to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: POLocation                                            */
/*==============================================================*/
print 'Creating new version of POLocation'
CREATE TABLE [dbo].[POLocation](
	LocationID				t_ID					NOT NULL,
	ExternalID				t_ID					NULL,
	FrequencyID				t_ID					NULL,
	LocationTypeID			t_ID					NULL,
	PlanogramID				t_ID					NULL,
	ProductLineID			t_ID					NULL,
	WarehouseID				t_ID					NULL,
	StoreID					t_ID					NULL,
	EstimatedShipDays		t_Count					NULL,
	EstimatedOrderDays		t_Count					NULL,
	constraint POLocation_PK primary key nonclustered (LocationID)
) 
go

grant select on DBO.POLocation to DR_RELSUSER_role
grant select, insert, update, delete on DBO.POLocation to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: POFrequency                                           */
/*==============================================================*/
print 'Creating new version of POFrequency'
CREATE TABLE [dbo].[POFrequency](
	FrequencyID			t_ID						NOT NULL,
	FrequencyInDays		t_Count						NULL,
	Description			t_Description				NULL,
	constraint POFrequency_PK primary key nonclustered (FrequencyID)
) 
go

grant select on DBO.POFrequency to DR_RELSUSER_role
grant select, insert, update, delete on DBO.POFrequency to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: POLocationTypes                                       */
/*==============================================================*/
print 'Creating new version of POLocationTypes'
CREATE TABLE [dbo].[POLocationTypes](
	LocationTypeID			t_ID					NOT NULL,
	LocationTypeCode		t_Code2					NULL,
	Description				t_Description			NULL,
	constraint POLocationTypes_PK primary key nonclustered (LocationTypeID)
) 
go

grant select on DBO.POLocationTypes to DR_RELSUSER_role
grant select, insert, update, delete on DBO.POLocationTypes to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: POPlanogram                                       */
/*==============================================================*/
print 'Creating new version of POPlanogram'
CREATE TABLE [dbo].[POPlanogram](
	PlanogramID				t_ID					NOT NULL,
	PlanogramVersion		t_Planogram				NULL,
	Description				t_Description			NULL,
	constraint POPlanogram_PK primary key nonclustered (PlanogramID)
) 
go

grant select on DBO.POLocationTypes to DR_RELSUSER_role
grant select, insert, update, delete on DBO.POLocationTypes to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: POProductLines                                       */
/*==============================================================*/
print 'Creating new version of POProductLines'
CREATE TABLE [dbo].[POProductLines](
	ProductLineID			t_ID					NOT NULL,
	ProductLineCode			t_Code2					NULL,
	Description				t_Description			NULL,
	constraint POProductLines_PK primary key nonclustered (ProductLineID)
) 
go

grant select on DBO.POProductLines to DR_RELSUSER_role
grant select, insert, update, delete on DBO.POProductLines to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: POTracking                                       */
/*==============================================================*/
print 'Creating new version of POTracking'
CREATE TABLE [dbo].[POTracking](
	OrderID					t_PurchaseOrderNumber	NOT NULL,
	TrackingNumber			t_TrackingNumber		NOT NULL,
	ShippingService			t_ReferenceNumber		NULL,
	constraint POTracking_PK primary key nonclustered (OrderID, TrackingNumber)
) 
go

grant select on DBO.POTracking to DR_RELSUSER_role
grant select, insert, update, delete on DBO.POTracking to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: POWarehouseLocation                                   */
/*==============================================================*/
print 'Creating new version of POWarehouseLocation'
CREATE TABLE [dbo].[POWarehouseLocation](
	WarehouseID				t_ID					NOT NULL,
	WarehouseCode			t_Code2					NULL,
	Description				t_Description			NULL,
	constraint POWarehouseLocation_PK primary key nonclustered (WarehouseID)
) 
go

grant select on DBO.POWarehouseLocation to DR_RELSUSER_role
grant select, insert, update, delete on DBO.POWarehouseLocation to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: PurchaseOrder                                         */
/*==============================================================*/
print 'Creating new version of PurchaseOrder'
CREATE TABLE [dbo].[PurchaseOrder](
	OrderID					t_PurchaseOrderNumber	NOT NULL,
	VendorOrderID			t_PurchaseOrderNumber	NULL,
	LocationID				t_ID					NULL,
	Description				t_Description			NULL,
	OrderDate				t_TimeStamp				NULL,
	ShipDate				t_TimeStamp				NULL,
	ReceivedDate			t_TimeStamp				NULL,
	ShippingInstructions	t_LongDescription		NULL,
	StatusCode				t_Code					NULL,
	constraint PurchaseOrder_PK primary key nonclustered (OrderID)
) 
go

grant select on DBO.PurchaseOrder to DR_RELSUSER_role
grant select, insert, update, delete on DBO.PurchaseOrder to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: StockLedgerAccount                                    */
/*==============================================================*/
print 'Creating new version of StockLedgerAccount'
create table [dbo].StockLedgerAccount (
        StoreID		                           t_ID		               NOT NULL,
        ItemID                                 t_ItemID                NOT NULL,
        BeginningUnitCount                     t_Count                 NULL,
        CumulativeReceivedUnitCount            t_Count                 NULL,
        CumulativeGrossSalesUnitCount          t_Count                 NULL,
        CumulativeReturnUnitCount              t_Count                 NULL,
        CumulativeTransferInUnitCount          t_Count                 NULL,
        CumulativeTransferOutUnitCount         t_Count                 NULL,
        CumulativeReturnToVendorUnitCount      t_Count                 NULL,
        CumulativeAdjustmentUnitCount          t_Count                 NULL,
        PhysicalCountDate                      t_TimeStamp             NULL,
        PhysicalCountUnitCount                 t_Count                 NULL,
        PhysicalCountUpdateDatetime            t_TimeStamp             NULL,

        constraint cpk_StockLedgerAccount primary key clustered (StoreID, ItemID)
)
go
grant select on DBO.StockLedgerAccount to DR_RELSUSER_role
grant select, insert, update, delete on DBO.StockLedgerAccount to DW_RELSUSER_role
go

/*==============================================================*/
/* View: PurchaseOrderItemView									*/
/*==============================================================*/
if exists (select * from sysobjects where id = object_id('PurchaseOrderItemView'))
begin
   print 'Dropping old version of PurchaseOrderItemView'
   drop view PurchaseOrderItemView
end
go


print 'Creating new version of PurchaseOrderItemView'
go
CREATE VIEW [dbo].[PurchaseOrderItemView]
AS
SELECT        PO.LocationID, POW.WarehouseCode, PO.OrderID, PO.VendorOrderID, PO.ShipDate, POL.EstimatedShipDays, POL.EstimatedOrderDays, POF.Description as Frequency, POP.PlanogramVersion, 
                         POI.ItemID, POI.VendorItemID, POI.Description AS ItemDescription, POI.LocationOnHandItemCount, POI.InTransitItemCount, POI.AnticipatedItemSalesCount, POI.LastOrderItemsSalesCount,
						 POI.MaxItemCount, POI.MaxLocationItemCount, POI.OrderQuantity, PO.StatusCode, PO.ShippingInstructions
FROM            dbo.PurchaseOrder AS PO INNER JOIN
                         dbo.POItems AS POI ON PO.OrderID = POI.OrderID INNER JOIN
                         dbo.POLocation AS POL ON PO.LocationID = POL.LocationID INNER JOIN
                         dbo.POWarehouseLocation AS POW ON POL.WarehouseID = POW.WarehouseID INNER JOIN
                         dbo.POPlanogram AS POP ON POL.PlanogramID = POP.PlanogramID INNER JOIN
                         dbo.POFrequency AS POF ON POL.FrequencyID = POF.FrequencyID

GO


/*==============================================================*/
/* View: POLocationView									*/
/*==============================================================*/
if exists (select * from sysobjects where id = object_id('POLocationView'))
begin
   print 'Dropping old version of POLocationView'
   drop view POLocationView
end
go

print 'Creating new version of POLocationView'
go
CREATE VIEW [dbo].[POLocationView]
AS
SELECT        dbo.POLocation.LocationID, dbo.POPlanogram.PlanogramVersion, dbo.POWarehouseLocation.WarehouseCode, dbo.akmstoredata.StoreID, 
                         dbo.akmstoredata.Description, dbo.POLocationTypes.LocationTypeCode, dbo.POProductLines.Description AS Product, dbo.POLocation.EstimatedShipDays, 
                         dbo.POLocation.EstimatedOrderDays, dbo.POFrequency.Description AS Frequency, dbo.POLocation.FrequencyID, dbo.POLocation.LocationTypeID, 
                         dbo.POLocation.PlanogramID, dbo.POLocation.ProductLineID, dbo.POLocation.WarehouseID
FROM            dbo.akmstoredata INNER JOIN
                         dbo.POLocation ON dbo.akmstoredata.StoreID = dbo.POLocation.StoreID INNER JOIN
                         dbo.POFrequency ON dbo.POLocation.FrequencyID = dbo.POFrequency.FrequencyID INNER JOIN
                         dbo.POLocationTypes ON dbo.POLocation.LocationTypeID = dbo.POLocationTypes.LocationTypeID INNER JOIN
                         dbo.POPlanogram ON dbo.POLocation.PlanogramID = dbo.POPlanogram.PlanogramID INNER JOIN
                         dbo.POProductLines ON dbo.POLocation.ProductLineID = dbo.POProductLines.ProductLineID INNER JOIN
                         dbo.POWarehouseLocation ON dbo.POLocation.WarehouseID = dbo.POWarehouseLocation.WarehouseID

GO