--**********************************************************************
--* Production Data
--**********************************************************************

--delete from GROUP_FILTER
--delete from DATA_TYPE_DEFINITION
go
DBCC CHECKIDENT (data_type_definition, RESEED, 0)
go

-----------
delete from POFrequency

insert into POFrequency(FrequencyID, FrequencyInDays, Description) values (1, 7, 'Weekly')
insert into POFrequency(FrequencyID, FrequencyInDays, Description) values (2, 14, 'Bi-Monthly')
insert into POFrequency(FrequencyID, FrequencyInDays, Description) values (3, 28, 'Monthly')

-----------
delete from POLocationTypes

insert into POLocationTypes(LocationTypeID, LocationTypeCode, Description) values (1, 'M', 'Mall')
insert into POLocationTypes(LocationTypeID, LocationTypeCode, Description) values (2, 'A', 'Airport')
insert into POLocationTypes(LocationTypeID, LocationTypeCode, Description) values (3, 'B', 'Base')
insert into POLocationTypes(LocationTypeID, LocationTypeCode, Description) values (4, 'C', 'Counter')
insert into POLocationTypes(LocationTypeID, LocationTypeCode, Description) values (5, 'R', 'Resort')
insert into POLocationTypes(LocationTypeID, LocationTypeCode, Description) values (6, 'Z', 'Zoom Stretch')
go

-----------
delete from POPlanogram
go

insert into POPlanogram(PlanogramID, PlanogramVersion, Description) values (1, '1.0', 'AKM Cart')
insert into POPlanogram(PlanogramID, PlanogramVersion, Description) values (2, '1.1', 'Zoom 1.1')
insert into POPlanogram(PlanogramID, PlanogramVersion, Description) values (3, '9.1', 'Zoom 9.1')
go

-----------
delete from POProductLines
go

insert into POProductLines(ProductLineID, ProductLineCode, Description) values (1, 'P',	'Proactive')
insert into POProductLines(ProductLineID, ProductLineCode, Description) values (2, 'Z', 'Zoom')
insert into POProductLines(ProductLineID, ProductLineCode, Description) values (3, 'W', 'Wen')
go

-----------
delete from POWarehouseLocation
go

insert into POWarehouseLocation(WarehouseID, WarehouseCode, Description) values (1, 'E', 'East')
insert into POWarehouseLocation(WarehouseID, WarehouseCode, Description) values (2, 'W', 'West')
insert into POWarehouseLocation(WarehouseID, WarehouseCode, Description) values (3, 'C', 'Canada')
go


--**********************************************************************
--* Demo Seed Data  - be sure to import akmstoredata and item_mapping data FIRST!!
--**********************************************************************

--insert into akmstoredata(StoreID, SiteID, ShippingAddressID, Description, AddressLine1, City, State) values (1, 'PCM001SOBC', 1, 'Fashion Show', '123 Strip', 'Las Vegas', 'NV')
--insert into akmstoredata(StoreID, SiteID, ShippingAddressID, Description, AddressLine1, City, State) values (2, 'PCM001SOBC', 1, 'Boulevard', '456 Boulevard Ln', 'Las Vegas', 'NV')
--insert into akmstoredata(StoreID, SiteID, ShippingAddressID, Description, AddressLine1, City, State) values (3, 'PRB001NESD', 2, 'UTC', '789 La Jolla Village Dr.', 'San Diego', 'CA')

insert into Address(AddressID, AddressLine1, AddressLine2, City, State) values (1, 'FUJIFILM', '123 Strip', 'Las Vegas', 'NV')
insert into Address(AddressID, AddressLine1, AddressLine2, City, State) values (2, 'C/O UPS Store 3825', '123 Strip', 'Las Vegas', 'NV')


--insert into item_mapping(ITEMID, GITEMID, ITEMTYPE, ITEMNAME, ITEMCATEGORY) values (1, 'PA2082', 1, '1 - Original 3 Piece System', 'PROACTIV')
--insert into item_mapping(ITEMID, GITEMID, ITEMTYPE, ITEMNAME, ITEMCATEGORY) values (2, 'PA2011', 1, '2 - Mini Maintenance', 'PROACTIV')
--insert into item_mapping(ITEMID, GITEMID, ITEMTYPE, ITEMNAME, ITEMCATEGORY) values (3, 'PA0274', 1, '3 - Renewing Cleanser', 'PROACTIV')
--insert into item_mapping(ITEMID, GITEMID, ITEMTYPE, ITEMNAME, ITEMCATEGORY) values (310100, 'YB2057', 2, '310100 - SC System 30-day Dark', 'SHEERCOVER' )

delete from POLocation
go

insert into POLocation(LocationID, ExternalID, LocationTypeID, PlanogramID, ProductLineID, WarehouseID, StoreID, EstimatedShipDays, EstimatedOrderDays, FrequencyID) 
values (1, 1, 1, 1, 1, 1, 1, 3, 2, 1)
insert into POLocation(LocationID, ExternalID, LocationTypeID, PlanogramID, ProductLineID, WarehouseID, StoreID, EstimatedShipDays, EstimatedOrderDays, FrequencyID) 
values (2, 2, 1, 2, 1, 1, 2, 3, 2, 1)
insert into POLocation(LocationID, ExternalID, LocationTypeID, PlanogramID, ProductLineID, WarehouseID, StoreID, EstimatedShipDays, EstimatedOrderDays, FrequencyID) 
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
delete from POItems
go

insert into POItems(ItemID, OrderID, VendorItemID, Description, DateTime, LocationOnHandItemCount, InTransitItemCount, LastOrderItemsSalesCount, AnticipatedItemSalesCount, MaxLocationItemCount, MaxItemCount, OrderQuantity, StatusCode) 
values (1, 1, 1, 'Item 1 Desc', '2013-04-20 00:00:00.000', 5, 5, 3, 3, 15, 21, 5, 1)
insert into POItems(ItemID, OrderID, VendorItemID, Description, DateTime, LocationOnHandItemCount, InTransitItemCount, LastOrderItemsSalesCount, AnticipatedItemSalesCount, MaxLocationItemCount, MaxItemCount, OrderQuantity, StatusCode) 
values (2, 2, 2, 'Item 2', '2013-04-20 00:00:00.000', 15, 2, 3, 3, 25, 30, 7, 1)
insert into POItems(ItemID, OrderID, VendorItemID, Description, DateTime, LocationOnHandItemCount, InTransitItemCount, LastOrderItemsSalesCount, AnticipatedItemSalesCount, MaxLocationItemCount, MaxItemCount, OrderQuantity, StatusCode) 
values (3, 2, 3, 'Item 3', '2013-04-20 00:00:00.000', 20, 15, 9, 10, 15, 40, 10, 1)
insert into POItems(ItemID, OrderID, VendorItemID, Description, DateTime, LocationOnHandItemCount, InTransitItemCount, LastOrderItemsSalesCount, AnticipatedItemSalesCount, MaxLocationItemCount, MaxItemCount, OrderQuantity, StatusCode) 
values (1, 3, 1, 'Item 1 desc',	'2013-04-20 00:00:00.000', 8, 8, 4, 3, 20, 25, 8, 1)




