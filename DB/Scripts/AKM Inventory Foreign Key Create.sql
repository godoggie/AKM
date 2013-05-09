----------
---------- POLocation
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_akmstoredata]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation]  WITH CHECK ADD  CONSTRAINT [FK_POLocation_akmstoredata] FOREIGN KEY([StoreID])
REFERENCES [dbo].[akmstoredata] ([StoreID])
GO

ALTER TABLE [dbo].[POLocation] CHECK CONSTRAINT [FK_POLocation_akmstoredata]
GO
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POFrequency]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation]  WITH CHECK ADD  CONSTRAINT [FK_POLocation_POFrequency] FOREIGN KEY([FrequencyID])
REFERENCES [dbo].[POFrequency] ([FrequencyID])
GO

ALTER TABLE [dbo].[POLocation] CHECK CONSTRAINT [FK_POLocation_POFrequency]
GO
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POLocationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation]  WITH CHECK ADD  CONSTRAINT [FK_POLocation_POLocationTypes] FOREIGN KEY([LocationTypeID])
REFERENCES [dbo].[POLocationTypes] ([LocationTypeID])
GO

ALTER TABLE [dbo].[POLocation] CHECK CONSTRAINT [FK_POLocation_POLocationTypes]
GO
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POPlanograms]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation]  WITH CHECK ADD  CONSTRAINT [FK_POLocation_POPlanogram] FOREIGN KEY([PlanogramID])
REFERENCES [dbo].[POPlanogram] ([PlanogramID])
GO

ALTER TABLE [dbo].[POLocation] CHECK CONSTRAINT [FK_POLocation_POPlanogram]
GO
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POProductLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation]  WITH CHECK ADD  CONSTRAINT [FK_POLocation_POProductLines] FOREIGN KEY([ProductLineID])
REFERENCES [dbo].[POProductLines] ([ProductLineID])
GO

ALTER TABLE [dbo].[POLocation] CHECK CONSTRAINT [FK_POLocation_POProductLines]
GO

----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POWarehouseLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation]  WITH CHECK ADD  CONSTRAINT [FK_POLocation_POWarehouseLocation] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[POWarehouseLocation] ([WarehouseID])
GO

ALTER TABLE [dbo].[POLocation] CHECK CONSTRAINT [FK_POLocation_POWarehouseLocation]
GO

----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POWarehouseLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation]  WITH CHECK ADD  CONSTRAINT [FK_POLocation_POWarehouseLocation] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[POWarehouseLocation] ([WarehouseID])
GO

ALTER TABLE [dbo].[POLocation] CHECK CONSTRAINT [FK_POLocation_POWarehouseLocation]
GO

----------
----------  PurchaseOrder
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrder_POLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]'))
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_POLocation] FOREIGN KEY([LocationID])
REFERENCES [dbo].[POLocation] ([LocationID])
GO

ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_POLocation]
GO

----------
----------  POItems
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POItems_item_mapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[POItems]'))
ALTER TABLE [dbo].[POItems]  WITH CHECK ADD  CONSTRAINT [FK_POItems_item_mapping] FOREIGN KEY([ItemID])
REFERENCES [dbo].[item_mapping] ([ITEMID])
GO

ALTER TABLE [dbo].[POItems] CHECK CONSTRAINT [FK_POItems_item_mapping]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POItems_item_mapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[POItems]'))
ALTER TABLE [dbo].[POItems]  WITH CHECK ADD  CONSTRAINT [FK_POItems_PurchaseOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[PurchaseOrder] ([OrderID])
GO

ALTER TABLE [dbo].[POItems] CHECK CONSTRAINT [FK_POItems_PurchaseOrder]
GO

----------
----------  POTracking
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POTracking_PurchaseOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[POTracking]'))
ALTER TABLE [dbo].[POTracking]  WITH CHECK ADD  CONSTRAINT [FK_POTracking_PurchaseOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[PurchaseOrder] ([OrderID])
GO

ALTER TABLE [dbo].[POTracking] CHECK CONSTRAINT [FK_POTracking_PurchaseOrder]
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