----------
---------- POLocation
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_akmstoredata]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation] DROP CONSTRAINT [FK_POLocation_akmstoredata]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POFrequency]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation] DROP CONSTRAINT [FK_POLocation_POFrequency]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POLocationTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation] DROP CONSTRAINT [FK_POLocation_POLocationTypes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POPlanograms]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation] DROP CONSTRAINT [FK_POLocation_POPlanogram]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POProductLines]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation] DROP CONSTRAINT [FK_POLocation_POProductLines]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POWarehouseLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation] DROP CONSTRAINT [FK_POLocation_POWarehouseLocation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POLocation_POWarehouseLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[POLocation]'))
ALTER TABLE [dbo].[POLocation] DROP CONSTRAINT [FK_POLocation_POWarehouseLocation]
GO

----------
----------  PurchaseOrder
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrder_POLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]'))
ALTER TABLE [dbo].[PurchaseOrder] DROP CONSTRAINT [FK_PurchaseOrder_POLocation]
GO

----------
----------  POItems
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POItems_item_mapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[POItems]'))
ALTER TABLE [dbo].[POItems] DROP CONSTRAINT [FK_POItems_item_mapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POItems_item_mapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[POItems]'))
ALTER TABLE [dbo].[POItems] DROP CONSTRAINT [FK_POItems_PurchaseOrder]
GO

----------
----------  POTracking
----------
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_POTracking_PurchaseOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[POTracking]'))
ALTER TABLE [dbo].[POTracking] DROP CONSTRAINT [FK_POTracking_PurchaseOrder]
GO
