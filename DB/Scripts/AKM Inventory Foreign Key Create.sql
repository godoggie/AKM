----------
---------- InvPOLocation
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_akmstoredata]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation]  WITH CHECK ADD  CONSTRAINT [FK_InvPOLocation_akmstoredata] FOREIGN KEY([StoreID])
REFERENCES [dbo].[akmstoredata] ([StoreID])
GO

ALTER TABLE [dbo].[InvPOLocation] CHECK CONSTRAINT [FK_InvPOLocation_akmstoredata]
GO
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOFrequency]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation]  WITH CHECK ADD  CONSTRAINT [FK_InvPOLocation_InvPOFrequency] FOREIGN KEY([FrequencyID])
REFERENCES [dbo].[InvPOFrequency] ([FrequencyID])
GO

ALTER TABLE [dbo].[InvPOLocation] CHECK CONSTRAINT [FK_InvPOLocation_InvPOFrequency]
GO
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOLocationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation]  WITH CHECK ADD  CONSTRAINT [FK_InvPOLocation_InvPOLocationTypes] FOREIGN KEY([LocationTypeID])
REFERENCES [dbo].[InvPOLocationTypes] ([LocationTypeID])
GO

ALTER TABLE [dbo].[InvPOLocation] CHECK CONSTRAINT [FK_InvPOLocation_InvPOLocationTypes]
GO
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOPlanogram]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation]  WITH CHECK ADD  CONSTRAINT [FK_InvPOLocation_InvPOPlanogram] FOREIGN KEY([PlanogramID])
REFERENCES [dbo].[InvPOPlanogram] ([PlanogramID])
GO

ALTER TABLE [dbo].[InvPOLocation] CHECK CONSTRAINT [FK_InvPOLocation_InvPOPlanogram]
GO
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOProductLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation]  WITH CHECK ADD  CONSTRAINT [FK_InvPOLocation_InvPOProductLines] FOREIGN KEY([ProductLineID])
REFERENCES [dbo].[InvPOProductLines] ([ProductLineID])
GO

ALTER TABLE [dbo].[InvPOLocation] CHECK CONSTRAINT [FK_InvPOLocation_InvPOProductLines]
GO

----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOWarehouseLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation]  WITH CHECK ADD  CONSTRAINT [FK_InvPOLocation_InvPOWarehouseLocation] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[InvPOWarehouseLocation] ([WarehouseID])
GO

ALTER TABLE [dbo].[InvPOLocation] CHECK CONSTRAINT [FK_InvPOLocation_InvPOWarehouseLocation]
GO

----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOWarehouseLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation]  WITH CHECK ADD  CONSTRAINT [FK_InvPOLocation_InvPOWarehouseLocation] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[InvPOWarehouseLocation] ([WarehouseID])
GO

ALTER TABLE [dbo].[InvPOLocation] CHECK CONSTRAINT [FK_InvPOLocation_InvPOWarehouseLocation]
GO

----------
----------  InvPurchaseOrder
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPurchaseOrder_InvPOLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPurchaseOrder]'))
ALTER TABLE [dbo].[InvPurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_InvPurchaseOrder_InvPOLocation] FOREIGN KEY([LocationID])
REFERENCES [dbo].[InvPOLocation] ([LocationID])
GO

ALTER TABLE [dbo].[InvPurchaseOrder] CHECK CONSTRAINT [FK_InvPurchaseOrder_InvPOLocation]
GO

----------
----------  InvPOItems
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOItems_item_mapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOItems]'))
ALTER TABLE [dbo].[InvPOItems]  WITH CHECK ADD  CONSTRAINT [FK_InvPOItems_item_mapping] FOREIGN KEY([ItemID])
REFERENCES [dbo].[item_mapping] ([ITEMID])
GO

ALTER TABLE [dbo].[InvPOItems] CHECK CONSTRAINT [FK_InvPOItems_item_mapping]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOItems_item_mapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOItems]'))
ALTER TABLE [dbo].[InvPOItems]  WITH CHECK ADD  CONSTRAINT [FK_InvPOItems_InvPurchaseOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[InvPurchaseOrder] ([OrderID])
GO

ALTER TABLE [dbo].[InvPOItems] CHECK CONSTRAINT [FK_InvPOItems_InvPurchaseOrder]
GO

----------
----------  InvPOTracking
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOTracking_InvPurchaseOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOTracking]'))
ALTER TABLE [dbo].[InvPOTracking]  WITH CHECK ADD  CONSTRAINT [FK_InvPOTracking_InvPurchaseOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[InvPurchaseOrder] ([OrderID])
GO

ALTER TABLE [dbo].[InvPOTracking] CHECK CONSTRAINT [FK_InvPOTracking_InvPurchaseOrder]
GO

----------
----------  Address
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Address_akmStoreData]') AND parent_object_id = OBJECT_ID(N'[dbo].[Address]'))
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_akmStoreData] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO

ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_akmStoreData]
GO