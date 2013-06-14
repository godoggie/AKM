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
execute sp_addtype t_Date,		        'Date',   'NULL', 'dbo'
go

if exists (select * from sysobjects where id = object_id('Address'))
begin
   print 'Dropping old version of Address'
   drop table Address
end
go

if exists (select * from sysobjects where id = object_id('InvAuditLog'))
begin
   print 'Dropping old version of InvAuditLog'
   drop table InvAuditLog
end
go

if exists (select * from sysobjects where id = object_id('InvPOItems'))
begin
   print 'Dropping old version of InvPOItems'
   drop table InvPOItems
end
go

if exists (select * from sysobjects where id = object_id('InvPOFrequency'))
begin
   print 'Dropping old version of InvPOFrequency'
   drop table InvPOFrequency
end
go

if exists (select * from sysobjects where id = object_id('InvPOLocation'))
begin
   print 'Dropping old version of InvPOLocation'
   drop table InvPOLocation
end
go

if exists (select * from sysobjects where id = object_id('InvPOLocationTypes'))
begin
   print 'Dropping old version of InvPOLocationTypes'
   drop table InvPOLocationTypes
end
go

if exists (select * from sysobjects where id = object_id('InvPOPlanogram'))
begin
   print 'Dropping old version of InvPOPlanogram'
   drop table InvPOPlanogram
end
go

if exists (select * from sysobjects where id = object_id('InvPOProductLines'))
begin
   print 'Dropping old version of InvPOProductLines'
   drop table InvPOProductLines
end
go

if exists (select * from sysobjects where id = object_id('InvPOTracking'))
begin
   print 'Dropping old version of InvPOTracking'
   drop table InvPOTracking
end
go

if exists (select * from sysobjects where id = object_id('InvItems'))
begin
   print 'Dropping old version of InvItems'
   drop table InvItems
end
go

if exists (select * from sysobjects where id = object_id('InvPOWarehouseLocation'))
begin
   print 'Dropping old version of InvPOWarehouseLocation'
   drop table InvPOWarehouseLocation
end
go

if exists (select * from sysobjects where id = object_id('InvPurchaseOrder'))
begin
   print 'Dropping old version of InvPurchaseOrder'
   drop table InvPurchaseOrder
end
go

if exists (select * from sysobjects where id = object_id('InvPOBusinessTypes'))
begin
   print 'Dropping old version of InvPOBusinessTypes'
   drop table InvPOBusinessTypes
end
go

if exists (select * from sysobjects where id = object_id('InvWarehouseInventory'))
begin
   print 'Dropping old version of InvWarehouseInventory'
   drop table InvWarehouseInventory
end
go

if exists (select * from sysobjects where id = object_id('InvItemMinMax'))
begin
   print 'Dropping old version of InvItemMinMax'
   drop table InvItemMinMax
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
/* Table: InvAuditLog                                               */
/*==============================================================*/
print 'Creating new version of InvAuditLog'
CREATE TABLE [dbo].[InvAuditLog](
	AuditID						bigint identity			NOT NULL,
	SequenceNumber				t_SequenceNumber		NOT NULL,
	DateTime					t_TimeStamp				NOT NULL default current_timestamp,
	TypeCode					t_Code					NOT NULL default 1,
	UserName					t_Name					NULL,
	Source						t_Name					NULL,
	Description					varchar(MAX)			NULL,
	constraint InvAudit_PK primary key nonclustered (AuditID, SequenceNumber)
) 
go


grant select on DBO.InvAuditLog to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvAuditLog to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvPOItems                                               */
/*==============================================================*/
print 'Creating new version of InvPOItems'
CREATE TABLE [dbo].[InvPOItems](
	ItemID						t_ItemID				NOT NULL,
	OrderID						t_PurchaseOrderNumber	NOT NULL,
	VendorItemID				t_ItemID				NULL,
	Description					t_Description			NULL,
	DateTime					t_TimeStamp				NULL,
	LocationOnHandItemCount		t_Count					NULL,
	InTransitItemCount			t_Count					NULL,
	LastOrderItemSalesCount		t_Count					NULL,
	AnticipatedItemSalesCount	t_Count					NULL,
	MaxLocationItemCount		t_Count					NULL,
	MaxItemCount				t_Count					NULL,
	OrderQuantity				t_Count					NULL,
	SentQuantity				t_Count					NULL,
	ReceivedQuantity			t_Count					NULL,
	StatusCode					t_Code					NULL,
	constraint InvPOItems_PK primary key nonclustered (ItemID, OrderID)
) 
go


grant select on DBO.InvPOItems to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvPOItems to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvPOLocation                                            */
/*==============================================================*/
print 'Creating new version of InvPOLocation'
CREATE TABLE [dbo].[InvPOLocation](
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
	constraint InvPOLocation_PK primary key nonclustered (LocationID)
) 
go

grant select on DBO.InvPOLocation to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvPOLocation to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvPOFrequency                                           */
/*==============================================================*/
print 'Creating new version of InvPOFrequency'
CREATE TABLE [dbo].[InvPOFrequency](
	FrequencyID			t_ID						NOT NULL,
	FrequencyInDays		t_Count						NULL,
	Description			t_Description				NULL,
	constraint InvPOFrequency_PK primary key nonclustered (FrequencyID)
) 
go

grant select on DBO.InvPOFrequency to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvPOFrequency to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvPOLocationTypes                                       */
/*==============================================================*/
print 'Creating new version of InvPOLocationTypes'
CREATE TABLE [dbo].[InvPOLocationTypes](
	LocationTypeID			t_ID					NOT NULL,
	LocationTypeCode		t_Code2					NULL,
	Description				t_Description			NULL,
	constraint InvPOLocationTypes_PK primary key nonclustered (LocationTypeID)
) 
go

grant select on DBO.InvPOLocationTypes to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvPOLocationTypes to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvPOPlanogram                                       */
/*==============================================================*/
print 'Creating new version of InvPOPlanogram'
CREATE TABLE [dbo].[InvPOPlanogram](
	PlanogramID				t_ID					NOT NULL,
	PlanogramVersion		t_Planogram				NULL,
	Description				t_Description			NULL,
	constraint InvPOPlanogram_PK primary key nonclustered (PlanogramID)
) 
go

grant select on DBO.InvPOLocationTypes to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvPOLocationTypes to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvPOProductLines                                       */
/*==============================================================*/
print 'Creating new version of InvPOProductLines'
CREATE TABLE [dbo].[InvPOProductLines](
	ProductLineID			t_ID					NOT NULL,
	ProductLineCode			t_Code2					NULL,
	Description				t_Description			NULL,
	constraint InvPOProductLines_PK primary key nonclustered (ProductLineID)
) 
go

grant select on DBO.InvPOProductLines to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvPOProductLines to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvPOTracking                                       */
/*==============================================================*/
print 'Creating new version of InvPOTracking'
CREATE TABLE [dbo].[InvPOTracking](
	OrderID					t_PurchaseOrderNumber	NOT NULL,
	TrackingNumber			t_TrackingNumber		NOT NULL,
	ShippingService			t_ReferenceNumber		NULL,
	constraint InvPOTracking_PK primary key nonclustered (OrderID, TrackingNumber)
) 
go

grant select on DBO.InvPOTracking to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvPOTracking to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvPOWarehouseLocation                                   */
/*==============================================================*/
print 'Creating new version of InvPOWarehouseLocation'
CREATE TABLE [dbo].[InvPOWarehouseLocation](
	WarehouseID				t_ID					NOT NULL,
	WarehouseCode			t_Code2					NULL,
	Description				t_Description			NULL,
	constraint InvPOWarehouseLocation_PK primary key nonclustered (WarehouseID)
) 
go

grant select on DBO.InvPOWarehouseLocation to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvPOWarehouseLocation to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvPurchaseOrder                                         */
/*==============================================================*/
print 'Creating new version of InvPurchaseOrder'
CREATE TABLE [dbo].[InvPurchaseOrder](
	OrderID					t_PurchaseOrderNumber	NOT NULL,
	VendorOrderID			t_PurchaseOrderNumber	NULL,
	LocationID				t_ID					NULL,
	Description				t_Description			NULL,
	OrderDate				t_Date					NULL,
	ShipDate				t_Date					NULL,
	ReceivedDate			t_Date					NULL,
	ShippingInstructions	t_LongDescription		NULL,
	StatusCode				t_Code					NULL,
	constraint InvPurchaseOrder_PK primary key nonclustered (OrderID)
) 
go

grant select on DBO.InvPurchaseOrder to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvPurchaseOrder to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvItems                                              */
/*==============================================================*/
print 'Creating new version of InvItems'
CREATE TABLE [dbo].[InvItems](
	ItemID					t_ItemID				NOT NULL,
	VendorItemID			t_ItemID				NOT NULL,
	WarehouseItemID			t_ItemID				NULL,
	Description				t_Description			NULL,
	ItemType				t_Code					NULL,
	StatusCode				t_Code					NULL,
	constraint InvItems_PK primary key nonclustered (ItemID, VendorItemID)
) 
go

grant select on DBO.InvItems to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvItems to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvWarehouseInventory                                 */
/*==============================================================*/
print 'Creating new version of InvWarehouseInventory'
CREATE TABLE [dbo].[InvWarehouseInventory](
	WarehouseID				t_ID					NOT NULL,
	ItemID					t_ItemID				NOT NULL,
	VendorItemID			t_ItemID				NULL,
	UnitOfMeasure			t_Code2					NULL,
	QuantityOnHand			t_Count					NULL,
	QuantityAllocated		t_Count					NULL,
	StatusCode				t_Code					NULL,
	constraint InvWarehouseInventory_PK primary key nonclustered (WarehouseID, ItemID)
) 
go

grant select on DBO.InvWarehouseInventory to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvWarehouseInventory to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvItemMinMax                                         */
/*==============================================================*/
print 'Creating new version of InvItemMinMax'
CREATE TABLE [dbo].[InvItemMinMax](
	LocationID				t_ID					NOT NULL,
	ItemID					t_ItemID				NOT NULL,
	VendorItemID			t_ItemID				NULL,
	Minimum					t_Count					NULL,
	Maximum					t_Count					NULL,
	LocationMaximum			t_Count					NULL,
	constraint InvItemMinMax_PK primary key nonclustered (LocationID, ItemID)
) 
go

grant select on DBO.InvItemMinMax to DR_RELSUSER_role
grant select, insert, update, delete on DBO.InvItemMinMax to DW_RELSUSER_role
go

/*==============================================================*/
/* Table: InvPOBusinessTypes                                       */
/*==============================================================*/
print 'Creating new version of InvPOBusinessTypes'
CREATE TABLE [dbo].[InvPOBusinessTypes](
	BusinessTypeID			t_ID					NOT NULL,
	BusinessTypeCode		t_Code2					NULL,
	Description				t_Description			NULL,
	constraint InvPOBusinessTypes_PK primary key nonclustered (BusinessTypeID)
) 
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
/* View: InvPOLocationView									*/
/*==============================================================*/
if exists (select * from sysobjects where id = object_id('InvPOLocationView'))
begin
   print 'Dropping old version of InvPOLocationView'
   drop view InvPOLocationView
end
go

print 'Creating new version of InvPOLocationView'
go
CREATE VIEW [dbo].InvPOLocationView
AS
SELECT	dbo.InvPOLocation.LocationID, ISNULL(dbo.akmstoredata.Zoom_CartID, dbo.InvPOLocation.LocationID) as ExternalLocationID, dbo.InvPOPlanogram.PlanogramVersion, dbo.InvPOWarehouseLocation.WarehouseCode, dbo.akmstoredata.StoreID, 
        dbo.akmstoredata.Description, dbo.InvPOLocationTypes.LocationTypeCode, dbo.InvPOProductLines.Description AS Product, dbo.InvPOLocation.EstimatedShipDays, 
        dbo.InvPOLocation.EstimatedOrderDays, dbo.InvPOFrequency.Description AS Frequency, dbo.InvPOLocation.FrequencyID, dbo.InvPOLocation.LocationTypeID, 
        dbo.InvPOLocation.PlanogramID, dbo.InvPOLocation.ProductLineID, dbo.InvPOProductLines.ProductLineCode, dbo.InvPOLocation.WarehouseID, dbo.akmstoredata.Store_Closed as StoreClosed, dbo.akmstoredata.Store_type as StoreType
FROM	dbo.akmstoredata INNER JOIN
        dbo.InvPOLocation ON dbo.akmstoredata.StoreID = dbo.InvPOLocation.StoreID INNER JOIN
        dbo.InvPOFrequency ON dbo.InvPOLocation.FrequencyID = dbo.InvPOFrequency.FrequencyID INNER JOIN
        dbo.InvPOLocationTypes ON dbo.InvPOLocation.LocationTypeID = dbo.InvPOLocationTypes.LocationTypeID INNER JOIN
        dbo.InvPOPlanogram ON dbo.InvPOLocation.PlanogramID = dbo.InvPOPlanogram.PlanogramID INNER JOIN
        dbo.InvPOProductLines ON dbo.InvPOLocation.ProductLineID = dbo.InvPOProductLines.ProductLineID INNER JOIN
        dbo.InvPOWarehouseLocation ON dbo.InvPOLocation.WarehouseID = dbo.InvPOWarehouseLocation.WarehouseID
GO

/*==============================================================*/
/* View: InvPurchaseOrderItemView									*/
/*==============================================================*/
if exists (select * from sysobjects where id = object_id('InvPurchaseOrderItemView'))
begin
   print 'Dropping old version of InvPurchaseOrderItemView'
   drop view InvPurchaseOrderItemView
end
go


print 'Creating new version of InvPurchaseOrderItemView'
go
CREATE VIEW [dbo].InvPurchaseOrderItemView
AS
SELECT	PO.LocationID, POL.ExternalLocationID, POL.Description, POL.WarehouseCode, PO.OrderID, PO.VendorOrderID, PO.OrderDate, PO.ShipDate, PO.ReceivedDate, POL.EstimatedShipDays, POL.EstimatedOrderDays, 
		POL.Frequency as Frequency, POL.PlanogramVersion, POI.ItemID, POI.VendorItemID, POI.Description AS ItemDescription, 
		POI.LocationOnHandItemCount, POI.InTransitItemCount, POI.AnticipatedItemSalesCount, POI.LastOrderItemSalesCount,
		POI.MaxItemCount, POI.MaxLocationItemCount, POI.OrderQuantity, PO.StatusCode, POI.StatusCode as ItemStatusCode, PO.ShippingInstructions,
		POL.ProductLineID
FROM dbo.InvPurchaseOrder AS PO INNER JOIN
     dbo.InvPOItems AS POI ON PO.OrderID = POI.OrderID INNER JOIN
     dbo.InvPOLocationView AS POL ON PO.LocationID = POL.LocationID 

GO

/*==============================================================*/
/* View: InvItemLocationView									*/
/*==============================================================*/
if exists (select * from sysobjects where id = object_id('InvItemLocationView'))
begin
   print 'Dropping old version of InvItemLocationView'
   drop view InvItemLocationView
end
go


print 'Creating new version of InvItemLocationView'
go
CREATE VIEW [dbo].[InvItemLocationView]
AS
SELECT	dbo.InvItemMinMax.LocationID, dbo.InvPOLocationView.ExternalLocationID, dbo.InvItems.ItemID, dbo.InvItems.VendorItemID, dbo.InvItems.WarehouseItemID, dbo.InvItems.Description, 
        dbo.InvItemMinMax.Minimum, dbo.InvItemMinMax.Maximum, dbo.InvItemMinMax.LocationMaximum, dbo.InvItems.ItemType, 
        dbo.InvItems.StatusCode AS ItemStatusCode, dbo.InvPOLocationView.StoreID, dbo.InvPOLocationView.ProductLineID, InvPOLocationView.StoreType
FROM    dbo.InvItemMinMax INNER JOIN
        dbo.InvItems ON dbo.InvItemMinMax.ItemID = dbo.InvItems.ItemID INNER JOIN
        dbo.InvPOLocationView ON dbo.InvItemMinMax.LocationID = dbo.InvPOLocationView.LocationID
GO


------------------------------------------------------------------------------
-- Procedure: csp_InventoryGeneratePOs
--
-- Params:    DateTimestamp - InventoryTransactionJournalEntry.DateTimestamp
--            POType - Business Type to use for the PO's 
--					1	PC	Proactive Cart
--					2	PZ	Proactive Zoom
--					3	W	Wen
--					4	H	HBC
--            ProcessedStatus (OUTPUT) - InventoryTransactionJournalEntry.ProcessedStatus
--
-- Returns:   ProcessedStatus = 1 if Succesfully generated POs
--            ProcessedStatus = 2 if Erro Generating POs
--            @@error - SQL error code (0 = SUCCESS, non-0 = Error)
--
-- Summary:   Insert New PO records into the InvPurchaseOrder and InvPOItems tables
--			  NOTE PO Status can be:
--				UnknownOrAny = 0,
--				New=1,  
--				Released=2, 
--				ChangeOrder=3, 
--				Cancelled=4, 
--				Closed=5, 
--				Partial=90,
--				ReceiveInProgress=91,
--				Suspended=92
------------------------------------------------------------------------------
if exists (select * from sysobjects where id = object_id('csp_InventoryGeneratePOs'))
begin
   print 'Dropping old version of csp_InventoryGeneratePOs'
   drop procedure csp_InventoryGeneratePOs
end
go

print 'Creating csp_InventoryGeneratePOs stored procedure'
go

create procedure [dbo].csp_InventoryGeneratePOs
	@PODate t_Date, 
	@POType varchar(2), 
	@POStatus int,
    @ProcessedStatus            t_Code OUTPUT
as
begin
    declare @LastErr            int
    declare @NumRows            int
	declare @ErrDate varchar(30)
	declare @CMD varchar(500)
	set @ErrDate = cast(@PODate as varchar)
	set @ProcessedStatus = -1

    set nocount on
	BEGIN TRANSACTION
	-- Create Date part of new PO #'s for this date
	DECLARE @ORDER_DATE varchar(6) 

	Set @ORDER_DATE = (SELECT CONVERT(VARCHAR(6), @PODate, 12) AS [YYMMDD]);

	IF OBJECT_ID('tempdb..#InTransitQty') IS NOT NULL DROP TABLE #InTransitQty
	IF OBJECT_ID('tempdb..#LatestPO') IS NOT NULL DROP TABLE #LatestPO
	IF OBJECT_ID('tempdb..#AnticipatedSalesCount') IS NOT NULL DROP TABLE #AnticipatedSalesCount
	
	-- if akm cart sync corp PendingPurchase order table with our intranet one.
	--if (@POType = 1)  --Proactive cart
	--begin
	--	select @where = ' WHERE (ICD.CreateDateTimestamp >= ''' + cast(@sinceCreateDateTimestamp as varchar) + ''')'
	--end

	-- get InTrasit Quantity
	Select ItemID, LocationID, SUM(OrderQuantity) as OrderQuantity INTO #InTransitQty 
		FROM InvPOItems 
		INNER JOIN InvPurchaseOrder ON InvPurchaseOrder.OrderID = InvPOItems.OrderID
		Where InvPOItems.StatusCode NOT IN (4,5)   --set to status of ordered but not received
		GROUP BY ItemID, LocationID

	-- get orderQTY from most recent PO
 	SELECT OrderID, ItemID, VendorItemID, LocationID, ExternalLocationID, EstimatedOrderDays, EstimatedShipDays, OrderQuantity, OrderDate INTO #LatestPO 
		FROM InvPurchaseOrderItemView a
		WHERE OrderDate = (SELECT max(OrderDate) FROM InvPurchaseOrderItemView b
						   WHERE a.LocationID = b.LocationID and a.ItemID = b.ItemID)

	CREATE TABLE #AnticipatedSalesCount (ExternalLocationID varchar(10), ItemID varchar(20), SalesCount int)

	-- get AnticipatedSalesCount from E3 POS Sales
	if (@POType = 1)  -- Procactiv Cart
	begin  -- poor mans method of using (Item Max - Physical Qty - In Transit)
		INSERT INTO #AnticipatedSalesCount
		SELECT ExternalLocationID, StockLedgerAccount.ItemID, (Maximum - PhysicalCountUnitCount - #InTransitQty.OrderQuantity) as SalesCount
			from StockLedgerAccount
			INNER JOIN InvItemLocationView ON 
				StockLedgerAccount.ItemID = InvItemLocationView.ItemID
				AND StockLedgerAccount.StoreID = InvItemLocationView.StoreID
				AND ProductLineID = @POType
				INNER JOIN #InTransitQty ON 
				#InTransitQty.ItemID = InvItemLocationView.ItemID
				AND #InTransitQty.LocationID = InvItemLocationView.LocationID
	end
	-- get AnticipatedSalesCount from Zoom_Sales
	else if (@POType = 2)  -- Zoom
	begin
		INSERT INTO #AnticipatedSalesCount
		SELECT ZoomCartID as ExternalLocationID, Zoom_UPC as ItemID, SUM(Units) as SalesCount
			FROM Zoom_Sales 
			INNER JOIN #LatestPO ON ExternalLocationID = ZoomCartID AND ItemID = Zoom_UPC
			WHERE 
			BusinessDayDate BETWEEN OrderDate and DateAdd(DD, #LatestPO.EstimatedOrderDays + #LatestPO.EstimatedShipDays, OrderDate)
			GROUP BY Zoom_UPC, ZoomCartID
			--order by ZoomCartID
	end
	-- get AnticipatedSalesCount for WEN  -- possibly use... exec usp_Wen_Items_Sold '5-1-2013', '6-1-2013'
	else if (@POType = 3)  -- WEN
	begin-- poor mans method of using (Item Max - Physical Qty - In Transit)
		INSERT INTO #AnticipatedSalesCount
		SELECT ExternalLocationID, StockLedgerAccount.ItemID, (Maximum - PhysicalCountUnitCount - #InTransitQty.OrderQuantity) as SalesCount
			from StockLedgerAccount
			INNER JOIN InvItemLocationView ON 
				StockLedgerAccount.ItemID = InvItemLocationView.ItemID
				AND StockLedgerAccount.StoreID = InvItemLocationView.StoreID
				AND ProductLineID = @POType
				INNER JOIN #InTransitQty ON 
				#InTransitQty.ItemID = InvItemLocationView.ItemID
				AND #InTransitQty.LocationID = InvItemLocationView.LocationID
	end	

	-- Create New PO records for this date. NOTE. at the end we will remove ones with NO Items.
	INSERT INTO InvPurchaseOrder(OrderID, VendorOrderID, LocationID, OrderDate, StatusCode) 
	SELECT DISTINCT 
		CONCAT((SELECT RIGHT('0000'+ CONVERT(VARCHAR,LocationID),4)), LocationTypeCode, ProductLineCode, WarehouseCode, @ORDER_DATE), 
		CONCAT((SELECT RIGHT('0000'+ CONVERT(VARCHAR,LocationID),4)), LocationTypeCode, ProductLineCode, WarehouseCode, @ORDER_DATE), 
		LocationID, 
		@PODate, 
		@POStatus 
	FROM InvPOLocationView 
	where ProductLineID = @POType
	  AND StoreClosed = 0;

    SELECT @LastErr = @@error, @NumRows = @@rowcount
	SET @ProcessedStatus = @NumRows

    if ((@LastErr != 0) or (@NumRows = 0))
    begin
		ROLLBACK
        raiserror ('Update Error: csp_InventoryGeneratePOs encountered an insert/update Creating POs error for BizType=%d Date=%s',16, 1, @POType, @ErrDate) with nowait
        return -1
    end 
    -- Insert eligible items into the PO's we just generated.
	-- OrderQty = Max - ( (Current Physical Qty + InTransit) + (lesser of.. Current Physical Qty OR (Order Time / Sales Days) x Total Sales)) ) 
	INSERT INTO InvPOItems (ItemID, OrderID, VendorItemID, Description, DateTime, LocationOnHandItemCount, InTransitItemCount, LastOrderItemSalesCount,
			AnticipatedItemSalesCount, MaxLocationItemCount, MaxItemCount, OrderQuantity, ReceivedQuantity, StatusCode, SentQuantity)

 		SELECT StockLedgerAccount.ItemID, OrderID, InvItemLocationView.VendorItemID, InvItemLocationView.Description,  
			InvPurchaseOrder.OrderDate, StockLedgerAccount.PhysicalCountUnitCount,
			ISNULL((SELECT OrderQuantity from #InTransitQty where ItemID = StockLedgerAccount.ItemID and StockLedgerAccount.StoreID = #InTransitQty.LocationID), 0) as InTransitItemCount, 
			ISNULL((SELECT OrderQuantity from #LatestPO  where ItemID = StockLedgerAccount.ItemID and StockLedgerAccount.StoreID = #LatestPO.LocationID), 0) as LastOrderItemSalesCount,
			ISNULL((SELECT SalesCount from #LatestPO 
					INNER JOIN  #AnticipatedSalesCount on #LatestPO.ExternalLocationID = #AnticipatedSalesCount.ExternalLocationID 
					AND #LatestPO.ItemID = #AnticipatedSalesCount.ItemID 
					WHERE StockLedgerAccount.ItemID = #AnticipatedSalesCount.ItemID AND StockLedgerAccount.StoreID = LocationID)
				 , 0) as AnticipatedItemSalesCount, -- NOTE!! Still need to factor in if Physical Qty is less than Anticipated SALES!! 
			LocationMaximum, Maximum, 
			Maximum - PhysicalCountUnitCount as OrderQuantity, 0 as ReceivedQuantity, @POStatus as StatusCode, 0 as SentQuantity

		FROM StockLedgerAccount 
			INNER JOIN
			InvItemLocationView ON InvItemLocationView.ItemID = StockLedgerAccount.ItemID
			AND  InvItemLocationView.StoreID = StockLedgerAccount.StoreID
				INNER JOIN
				InvPurchaseOrder ON InvItemLocationView.LocationID = InvPurchaseOrder.LocationID
		WHERE InvItemLocationView.ItemStatusCode = 0
			AND PhysicalCountUnitCount < Minimum
			AND ProductLineID = @POType
			AND InvPurchaseOrder.OrderDate = @PODate
		--ORDER BY StockLedgerAccount.StoreID
		 
    SELECT @LastErr = @@error, @NumRows = @@rowcount

    if ((@LastErr != 0) or (@NumRows = 0))
    begin
		ROLLBACK
        raiserror ('Update Error: csp_InventoryGeneratePOs encountered an insert/update error Creating PO Items for BizType=%d Date=%s',16, 1, @POType, @ErrDate) with nowait
        return -1
    end 

	-- Remove all new POs that we created but ended up having NO eligable items associated. 
	--  NOTE: keep only POs that have at least 1 Item where "Realtime Inventory + In Transit < Minimum"
	DELETE FROM InvPurchaseOrder 
	WHERE OrderID IN (SELECT InvPurchaseOrder.OrderID
						FROM InvPurchaseOrder
						WHERE OrderDate = @PODate 
						AND NOT EXISTS (
							SELECT 1 FROM InvPOItems
							WHERE InvPOItems.OrderID = InvPurchaseOrder.OrderID
						))
	SELECT @LastErr = @@error, @NumRows = @@rowcount
	SET @ProcessedStatus = @ProcessedStatus - @NumRows --Return only the # that was created.

    if ((@LastErr != 0) or (@NumRows = 0))
    begin
		ROLLBACK
        raiserror ('Update Error: csp_InventoryGeneratePOs encountered an insert/update error Creating PO Items for BizType=%d Date=%s',16, 1, @POType, @ErrDate) with nowait
        return -1
    end 

	COMMIT

	DROP TABLE #InTransitQty
	DROP TABLE #AnticipatedSalesCount
	DROP TABLE #LatestPO

    return 0
end
go

------------------------------------------------------------------------------
-- Procedure: csp_InventoryGetPOs
--
-- Params:    DateTimestamp - InventoryTransactionJournalEntry.DateTimestamp
--            POType - Business Type to use for the PO's 
--            ProcessedStatus (OUTPUT) - InventoryTransactionJournalEntry.ProcessedStatus
--
-- Returns:   ProcessedStatus = 1 if Succesfully generated POs
--            ProcessedStatus = 2 if Erro Generating POs
--            @@error - SQL error code (0 = SUCCESS, non-0 = Error)
--
-- Summary:   Remove PO records from the InvPurchaseOrder and InvPOItems tables based on input
------------------------------------------------------------------------------
if exists (select * from sysobjects where id = object_id('csp_InventoryGetPOs'))
begin
   print 'Dropping old version of csp_InventoryGetPOs'
   drop procedure csp_InventoryGetPOs
end
go

print 'Creating csp_InventoryGetPOs stored procedure'
go

create procedure [dbo].csp_InventoryGetPOs
	@PODate						datetime, 
	@POType						varchar(2), 
	@POStatus					int
as
begin
    declare @LastErr            int
    declare @NumRows            int
	declare @ErrDate varchar(30)
	set @ErrDate = cast(@PODate as varchar)
	set @NumRows = 0

    set nocount on

	SELECT * FROM InvPurchaseOrderItemView 
		WHERE OrderDate = @PODate
		AND ProductLineID = @POType

    return SELECT @LastErr = @@error, @NumRows = @@rowcount

/*	SET @ProcessedStatus = @NumRows

    if (@LastErr != 0)
    begin
		ROLLBACK
        raiserror ('Update Error: csp_InventoryGeneratePOs encountered an insert/update Removing POs error for BizType=%d Date=%s',16, 1, @POType, @ErrDate) with nowait
        return -1
    end 
    
	COMMIT
    return @NumRows
	*/
end
go

------------------------------------------------------------------------------
-- Procedure: csp_InventoryRemovePOs
--
-- Params:    DateTimestamp - InventoryTransactionJournalEntry.DateTimestamp
--            POType - Business Type to use for the PO's 
--            ProcessedStatus (OUTPUT) - InventoryTransactionJournalEntry.ProcessedStatus
--
-- Returns:   ProcessedStatus = 1 if Succesfully generated POs
--            ProcessedStatus = 2 if Erro Generating POs
--            @@error - SQL error code (0 = SUCCESS, non-0 = Error)
--
-- Summary:   Remove PO records from the InvPurchaseOrder and InvPOItems tables based on input
------------------------------------------------------------------------------
if exists (select * from sysobjects where id = object_id('csp_InventoryRemovePOs'))
begin
   print 'Dropping old version of csp_InventoryRemovePOs'
   drop procedure csp_InventoryRemovePOs
end
go

print 'Creating csp_InventoryRemovePOs stored procedure'
go

create procedure [dbo].csp_InventoryRemovePOs
	@PODate						datetime, 
	@POType						varchar(2), 
	@POStatus					int,
    @ProcessedStatus            int OUTPUT
as
begin
    declare @LastErr            int
    declare @NumRows            int
	declare @ErrDate varchar(30)
	set @ErrDate = cast(@PODate as varchar)
	set @ProcessedStatus = -1
	set @NumRows = 0

    set nocount on
	BEGIN TRANSACTION

	IF OBJECT_ID('tempdb..#OrdersToRemove') IS NOT NULL DROP TABLE #OrdersToRemove
	
	-- get requested order ID's
	SELECT OrderID INTO #OrdersToRemove 
		FROM InvPurchaseOrderItemView 
		WHERE OrderDate = @PODate
		  AND ProductLineID = @POType

	DELETE FROM InvPOItems WHERE OrderID IN (SELECT OrderID FROM #OrdersToRemove)
	
	DELETE FROM InvPurchaseOrder WHERE OrderID IN (SELECT OrderID FROM #OrdersToRemove)

    SELECT @LastErr = @@error, @NumRows = @@rowcount

	SET @ProcessedStatus = @NumRows

    if (@LastErr != 0)
    begin
		ROLLBACK
        raiserror ('Update Error: csp_InventoryGeneratePOs encountered an insert/update Removing POs error for BizType=%d Date=%s',16, 1, @POType, @ErrDate) with nowait
        return -1
    end 
    
	COMMIT
    return @NumRows
end
go

------------------------------------------------------------------------------
-- Procedure: csp_InventoryAuditLogMessage
--
-- Params:    Message - Text to log
--            Type - Log Type
--            UserName - User to log on behalf of
--			  SequenceNumber - used for multi-part messages
--
-- Returns:   @@error - SQL error code (0 = SUCCESS, non-0 = Error)
--
-- Summary:   Log an audit message to the Audit Log table
------------------------------------------------------------------------------
if exists (select * from sysobjects where id = object_id('csp_InventoryAuditLogMessage'))
begin
   print 'Dropping old version of csp_InventoryAuditLogMessage'
   drop procedure csp_InventoryAuditLogMessage
end
go

print 'Creating csp_InventoryAuditLogMessage stored procedure'
go

create procedure [dbo].csp_InventoryAuditLogMessage
	@Message		varchar(MAX),
	@TypeCode		t_Code,
	@UserName		t_Name,
	@LogSource		t_Name,
    @SequenceNumber t_SequenceNumber
as
begin
    declare @LastErr            int
    declare @NumRows            int
	declare @ErrDate varchar(30)

    set nocount on
	BEGIN TRANSACTION

	INSERT INTO InvAuditLog (SequenceNumber, DateTime, TypeCode, UserName, [Source], [Description])
	VALUES (@SequenceNumber, getdate(), @TypeCode, @UserName, @LogSource, @Message)

    SELECT @LastErr = @@error, @NumRows = @@rowcount

    if ((@LastErr != 0) or (@NumRows = 0))
    begin
		ROLLBACK
        raiserror ('Update Error: csp_InventoryAuditLogMessage encountered an insert error Msg=%s',16, 1, @Message) with nowait
        return -1
    end 
    
	COMMIT
    return @NumRows
end
go
