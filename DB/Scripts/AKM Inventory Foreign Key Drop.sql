----------
---------- InvPOLocation
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_akmstoredata]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation] DROP CONSTRAINT [FK_InvPOLocation_akmstoredata]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOFrequency]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation] DROP CONSTRAINT [FK_InvPOLocation_InvPOFrequency]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOLocationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation] DROP CONSTRAINT [FK_InvPOLocation_InvPOLocationTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOPlanogram]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation] DROP CONSTRAINT [FK_InvPOLocation_InvPOPlanogram]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOProductLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation] DROP CONSTRAINT [FK_InvPOLocation_InvPOProductLines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOWarehouseLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation] DROP CONSTRAINT [FK_InvPOLocation_InvPOWarehouseLocation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOLocation_InvPOWarehouseLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOLocation]'))
ALTER TABLE [dbo].[InvPOLocation] DROP CONSTRAINT [FK_InvPOLocation_InvPOWarehouseLocation]
GO

----------
----------  InvPurchaseOrder
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPurchaseOrder_InvPOLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPurchaseOrder]'))
ALTER TABLE [dbo].[InvPurchaseOrder] DROP CONSTRAINT [FK_InvPurchaseOrder_InvPOLocation]
GO

----------
----------  InvPOItems
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOItems_ItemMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOItems]'))
ALTER TABLE [dbo].[InvPOItems] DROP CONSTRAINT [FK_InvPOItems_ItemMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOItems_InvPurchaseOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOItems]'))
ALTER TABLE [dbo].[InvPOItems] DROP CONSTRAINT [FK_InvPOItems_InvPurchaseOrder]
GO

----------
----------  InvPOTracking
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InvPOTracking_InvPurchaseOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[InvPOTracking]'))
ALTER TABLE [dbo].[InvPOTracking] DROP CONSTRAINT [FK_InvPOTracking_InvPurchaseOrder]
GO

--SELECT * 
--FROM sys.foreign_keys
--WHERE referenced_object_id = object_id('InvPurchaseOrder')
