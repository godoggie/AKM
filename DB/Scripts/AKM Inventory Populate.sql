--**********************************************************************
--* Production Data
--**********************************************************************

--delete from GROUP_FILTER
--delete from DATA_TYPE_DEFINITION
go
DBCC CHECKIDENT (data_type_definition, RESEED, 0)
go

-----------
delete from InvPOFrequency

insert into InvPOFrequency(FrequencyID, FrequencyInDays, Description) values (1, 7, 'Weekly')
insert into InvPOFrequency(FrequencyID, FrequencyInDays, Description) values (2, 14, 'Bi-Monthly')
insert into InvPOFrequency(FrequencyID, FrequencyInDays, Description) values (3, 28, 'Monthly')

-----------
delete from InvPOLocationTypes

insert into InvPOLocationTypes(LocationTypeID, LocationTypeCode, Description) values (1, 'M', 'Mall')
insert into InvPOLocationTypes(LocationTypeID, LocationTypeCode, Description) values (2, 'A', 'AirPort')
insert into InvPOLocationTypes(LocationTypeID, LocationTypeCode, Description) values (3, 'B', 'Base')
insert into InvPOLocationTypes(LocationTypeID, LocationTypeCode, Description) values (4, 'C', 'Counter')
insert into InvPOLocationTypes(LocationTypeID, LocationTypeCode, Description) values (5, 'R', 'Resort')
insert into InvPOLocationTypes(LocationTypeID, LocationTypeCode, Description) values (6, 'Z', 'Zoom Stretch')
go

-----------
delete from InvPOPlanogram
go

insert into InvPOPlanogram(PlanogramID, PlanogramVersion, Description) values (1, '1.0', 'AKM Cart')
insert into InvPOPlanogram(PlanogramID, PlanogramVersion, Description) values (2, '1.1', 'Zoom 1.1')
insert into InvPOPlanogram(PlanogramID, PlanogramVersion, Description) values (3, '9.1', 'Zoom 9.1')
go

-----------
delete from InvPOProductLines
go

insert into InvPOProductLines(ProductLineID, ProductLineCode, Description) values (1, 'P',	'Proactive')
insert into InvPOProductLines(ProductLineID, ProductLineCode, Description) values (2, 'Z', 'Zoom')
insert into InvPOProductLines(ProductLineID, ProductLineCode, Description) values (3, 'W', 'Wen')
go

-----------
delete from InvPOWarehouseLocation
go

insert into InvPOWarehouseLocation(WarehouseID, WarehouseCode, Description) values (1, 'E', 'East')
insert into InvPOWarehouseLocation(WarehouseID, WarehouseCode, Description) values (2, 'W', 'West')
insert into InvPOWarehouseLocation(WarehouseID, WarehouseCode, Description) values (3, 'C', 'Canada')
go

-----------
delete from InvPOBusinessTypes
go

insert into InvPOBusinessTypes(BusinessTypeID, BusinessTypeCode, Description) values (1, 'PC',	'Proactive Cart')
insert into InvPOBusinessTypes(BusinessTypeID, BusinessTypeCode, Description) values (2, 'PZ', 'Proactive Zoom')
insert into InvPOBusinessTypes(BusinessTypeID, BusinessTypeCode, Description) values (3, 'W', 'Wen')
insert into InvPOBusinessTypes(BusinessTypeID, BusinessTypeCode, Description) values (4, 'H', 'HBC')
go


--**********************************************************************
--* Demo Seed Data  - be sure to import akmstoredata and item_mapping data FIRST!!
--**********************************************************************

-- re-create data for POLocation
truncate table InvPOItems
delete from PurchaseOrder where OrderID is not null
delete from InvPOLocation where LocationID is not null

INSERT INTO InvPOLocation(LocationID, ExternalID, FrequencyID, LocationTypeID, PlanogramID, ProductLineID, WarehouseID, StoreID, EstimatedOrderDays, EstimatedShipDays) 
SELECT DISTINCT StoreID, StoreID, 1, 1, 1, 1, 1, StoreID, 2, 3 
FROM akmstoredata
where Store_Closed = 0;  -- not closed 

-- Set ProductLine
UPDATE InvPOLocation SET ProductLineID = 2, PlanogramID = 3, FrequencyID = 3, LocationTypeID = 6
Where StoreID in (SELECT StoreID FROM akmstoredata WHERE Store_type = 3) 
UPDATE InvPOLocation SET ProductLineID = 3 
Where StoreID in (SELECT StoreID FROM akmstoredata WHERE Store_type = 6) 

-- Set Warehouse
UPDATE InvPOLocation SET WarehouseID = 2
Where StoreID in (SELECT StoreID FROM akmstoredata WHERE ShipCoast = 'W') 
UPDATE InvPOLocation SET WarehouseID = 3
Where StoreID in (SELECT StoreID FROM akmstoredata WHERE Country = 2) 

truncate table address

INSERT INTO Address(AddressID, AddressLine1, AddressLine2, AddressLine3, City, State, PostalCode, Phone, ActiveDate, Country) 
SELECT DISTINCT StoreID, LEFT(Description,50), AddressLine1, AddressLine2, City, State, PostalCode, PhoneNumber, OpenDate, 'USA' 
FROM akmstoredata
where Store_Closed = 0;  -- not closed 

UPDATE Address SET Country = 'CAN'
Where AddressID in (SELECT StoreID FROM akmstoredata WHERE Country = 2) 
UPDATE akmstoredata SET ShippingAddressID = StoreID


INSERT INTO StockLedgerAccount (StoreID, ItemID, BeginningUnitCount, CumulativeReceivedUnitCount, CumulativeGrossSalesUnitCount, CumulativeReturnUnitCount,
								CumulativeTransferInUnitCount,CumulativeTransferOutUnitCount, CumulativeReturnToVendorUnitCount, CumulativeAdjustmentUnitCount,
								PhysicalCountDate,PhysicalCountUnitCount, PhysicalCountUpdateDatetime)
		select StoreID, Zoom_UPC, 0, 0, PhysicalQty, 0, 0, 0, 0, 0, BusinessDayDate, PhysicalQty, BusinessDayDate
		from Zoom_Sales, akmstoredata
		where units > 0
		and ZoomCartID = akmstoredata.Zoom_CartID
		and BusinessDayDate = '2013-04-07 00:00:00.000'  

-- this insert will ONLY work if an import of Yvonne's MinMax xls is done first (into MINMAX$)
INSERT INTO InvItemMinMax (LocationID, ItemID, VendorItemID, Minimum, Maximum)
		select Kiosk, Item, VendorID, MIN, MAX
		from MINMAX$

update InvItemMinMax set LocationMaximum = Maximum

--insert into akmstoredata(StoreID, SiteID, ShippingAddressID, Description, AddressLine1, City, State) values (1, 'PCM001SOBC', 1, 'Fashion Show', '123 Strip', 'Las Vegas', 'NV')
--insert into akmstoredata(StoreID, SiteID, ShippingAddressID, Description, AddressLine1, City, State) values (2, 'PCM001SOBC', 1, 'Boulevard', '456 Boulevard Ln', 'Las Vegas', 'NV')
--insert into akmstoredata(StoreID, SiteID, ShippingAddressID, Description, AddressLine1, City, State) values (3, 'PRB001NESD', 2, 'UTC', '789 La Jolla Village Dr.', 'San Diego', 'CA')

--insert into Address(AddressID, AddressLine1, AddressLine2, City, State) values (1, 'FUJIFILM', '123 Strip', 'Las Vegas', 'NV')
--insert into Address(AddressID, AddressLine1, AddressLine2, City, State) values (2, 'C/O UPS Store 3825', '123 Strip', 'Las Vegas', 'NV')


--insert into item_mapping(ITEMID, GITEMID, ITEMTYPE, ITEMNAME, ITEMCATEGORY) values (1, 'PA2082', 1, '1 - Original 3 Piece System', 'PROACTIV')
--insert into item_mapping(ITEMID, GITEMID, ITEMTYPE, ITEMNAME, ITEMCATEGORY) values (2, 'PA2011', 1, '2 - Mini Maintenance', 'PROACTIV')
--insert into item_mapping(ITEMID, GITEMID, ITEMTYPE, ITEMNAME, ITEMCATEGORY) values (3, 'PA0274', 1, '3 - Renewing Cleanser', 'PROACTIV')
--insert into item_mapping(ITEMID, GITEMID, ITEMTYPE, ITEMNAME, ITEMCATEGORY) values (310100, 'YB2057', 2, '310100 - SC System 30-day Dark', 'SHEERCOVER' )

/*
delete from InvPOLocation
go

insert into InvPOLocation(LocationID, ExternalID, LocationTypeID, PlanogramID, ProductLineID, WarehouseID, StoreID, EstimatedShipDays, EstimatedOrderDays, FrequencyID) 
values (1, 1, 1, 1, 1, 1, 1, 3, 2, 1)
insert into InvPOLocation(LocationID, ExternalID, LocationTypeID, PlanogramID, ProductLineID, WarehouseID, StoreID, EstimatedShipDays, EstimatedOrderDays, FrequencyID) 
values (2, 2, 1, 2, 1, 1, 2, 3, 2, 1)
insert into InvPOLocation(LocationID, ExternalID, LocationTypeID, PlanogramID, ProductLineID, WarehouseID, StoreID, EstimatedShipDays, EstimatedOrderDays, FrequencyID) 
values (3, 3, 2, 2, 2, 2, 3, 4, 2, 2)
go 

-----------
delete from PurchaseOrder
go

insert into PurchaseOrder(OrderID, VendorOrderID, LocationID, Description, OrderDate, ShipDate, ShippingInstructions, StatusCode) 
values (1, 1, 1, 'test order 1', '2013-04-20', '2013-04-22', 'some instr', 1  )
insert into PurchaseOrder(OrderID, VendorOrderID, LocationID, Description, OrderDate, ShipDate, ShippingInstructions, StatusCode) 
values (2, 2, 2, 'test order 2', '2013-04-20', '2013-04-22', 'some instr for 2', 1  )
insert into PurchaseOrder(OrderID, VendorOrderID, LocationID, Description, OrderDate, ShipDate, ShippingInstructions, StatusCode) 
values (3, 3, 3, 'test order 3', '2013-04-20', '2013-04-22', 'some instr for 3', 1  )
go

-----------
delete from InvPOItems
go

insert into InvPOItems(ItemID, OrderID, VendorItemID, Description, DateTime, LocationOnHandItemCount, InTransitItemCount, LastOrderItemsSalesCount, AnticipatedItemSalesCount, MaxLocationItemCount, MaxItemCount, OrderQuantity, StatusCode) 
values (1, 1, 1, 'Item 1 Desc', '2013-04-20 00:00:00.000', 5, 5, 3, 3, 15, 21, 5, 1)
insert into InvPOItems(ItemID, OrderID, VendorItemID, Description, DateTime, LocationOnHandItemCount, InTransitItemCount, LastOrderItemsSalesCount, AnticipatedItemSalesCount, MaxLocationItemCount, MaxItemCount, OrderQuantity, StatusCode) 
values (2, 2, 2, 'Item 2', '2013-04-20 00:00:00.000', 15, 2, 3, 3, 25, 30, 7, 1)
insert into InvPOItems(ItemID, OrderID, VendorItemID, Description, DateTime, LocationOnHandItemCount, InTransitItemCount, LastOrderItemsSalesCount, AnticipatedItemSalesCount, MaxLocationItemCount, MaxItemCount, OrderQuantity, StatusCode) 
values (3, 2, 3, 'Item 3', '2013-04-20 00:00:00.000', 20, 15, 9, 10, 15, 40, 10, 1)
insert into InvPOItems(ItemID, OrderID, VendorItemID, Description, DateTime, LocationOnHandItemCount, InTransitItemCount, LastOrderItemsSalesCount, AnticipatedItemSalesCount, MaxLocationItemCount, MaxItemCount, OrderQuantity, StatusCode) 
values (1, 3, 1, 'Item 1 desc',	'2013-04-20 00:00:00.000', 8, 8, 4, 3, 20, 25, 8, 1)

*/


