
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/16/2022 11:32:30
-- Generated from EDMX file: C:\Users\Lenovo\Desktop\Projelerim+MY\EntityDesktop\EntityDesktop\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DbEntityUrun];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_TBLSATIS_TBLMUSTERI]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBLSATIS] DROP CONSTRAINT [FK_TBLSATIS_TBLMUSTERI];
GO
IF OBJECT_ID(N'[dbo].[FK_TBLSATIS_TBLURUN]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBLSATIS] DROP CONSTRAINT [FK_TBLSATIS_TBLURUN];
GO
IF OBJECT_ID(N'[dbo].[FK_TBLURUN_TBLKATAGORI]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TBLURUN] DROP CONSTRAINT [FK_TBLURUN_TBLKATAGORI];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TBLKATAGORI]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBLKATAGORI];
GO
IF OBJECT_ID(N'[dbo].[TBLMUSTERI]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBLMUSTERI];
GO
IF OBJECT_ID(N'[dbo].[TBLSATIS]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBLSATIS];
GO
IF OBJECT_ID(N'[dbo].[TBLURUN]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TBLURUN];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TBLKATAGORI'
CREATE TABLE [dbo].[TBLKATAGORI] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [AD] varchar(30)  NULL
);
GO

-- Creating table 'TBLMUSTERI'
CREATE TABLE [dbo].[TBLMUSTERI] (
    [MUSTERID] int IDENTITY(1,1) NOT NULL,
    [MUSTERIAD] varchar(50)  NULL,
    [MUSTERISOYAD] varchar(30)  NULL,
    [SEHIR] varchar(15)  NULL
);
GO

-- Creating table 'TBLSATIS'
CREATE TABLE [dbo].[TBLSATIS] (
    [SATISID] int IDENTITY(1,1) NOT NULL,
    [FIYAT] decimal(18,2)  NULL,
    [TARIH] datetime  NULL,
    [TBLMUSTERI_MUSTERID] int  NULL,
    [TBLURUN_URUNID] int  NULL
);
GO

-- Creating table 'TBLURUN'
CREATE TABLE [dbo].[TBLURUN] (
    [URUNID] int IDENTITY(1,1) NOT NULL,
    [URUNAD] varchar(30)  NULL,
    [MARKA] varchar(30)  NULL,
    [STOK] smallint  NULL,
    [FIYAT] decimal(18,2)  NULL,
    [DURUM] bit  NULL,
    [TBLKATEGORI_ID] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'TBLKATAGORI'
ALTER TABLE [dbo].[TBLKATAGORI]
ADD CONSTRAINT [PK_TBLKATAGORI]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [MUSTERID] in table 'TBLMUSTERI'
ALTER TABLE [dbo].[TBLMUSTERI]
ADD CONSTRAINT [PK_TBLMUSTERI]
    PRIMARY KEY CLUSTERED ([MUSTERID] ASC);
GO

-- Creating primary key on [SATISID] in table 'TBLSATIS'
ALTER TABLE [dbo].[TBLSATIS]
ADD CONSTRAINT [PK_TBLSATIS]
    PRIMARY KEY CLUSTERED ([SATISID] ASC);
GO

-- Creating primary key on [URUNID] in table 'TBLURUN'
ALTER TABLE [dbo].[TBLURUN]
ADD CONSTRAINT [PK_TBLURUN]
    PRIMARY KEY CLUSTERED ([URUNID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TBLKATEGORI_ID] in table 'TBLURUN'
ALTER TABLE [dbo].[TBLURUN]
ADD CONSTRAINT [FK_TBLURUN_TBLKATAGORI]
    FOREIGN KEY ([TBLKATEGORI_ID])
    REFERENCES [dbo].[TBLKATAGORI]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBLURUN_TBLKATAGORI'
CREATE INDEX [IX_FK_TBLURUN_TBLKATAGORI]
ON [dbo].[TBLURUN]
    ([TBLKATEGORI_ID]);
GO

-- Creating foreign key on [TBLMUSTERI_MUSTERID] in table 'TBLSATIS'
ALTER TABLE [dbo].[TBLSATIS]
ADD CONSTRAINT [FK_TBLSATIS_TBLMUSTERI]
    FOREIGN KEY ([TBLMUSTERI_MUSTERID])
    REFERENCES [dbo].[TBLMUSTERI]
        ([MUSTERID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBLSATIS_TBLMUSTERI'
CREATE INDEX [IX_FK_TBLSATIS_TBLMUSTERI]
ON [dbo].[TBLSATIS]
    ([TBLMUSTERI_MUSTERID]);
GO

-- Creating foreign key on [TBLURUN_URUNID] in table 'TBLSATIS'
ALTER TABLE [dbo].[TBLSATIS]
ADD CONSTRAINT [FK_TBLSATIS_TBLURUN]
    FOREIGN KEY ([TBLURUN_URUNID])
    REFERENCES [dbo].[TBLURUN]
        ([URUNID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TBLSATIS_TBLURUN'
CREATE INDEX [IX_FK_TBLSATIS_TBLURUN]
ON [dbo].[TBLSATIS]
    ([TBLURUN_URUNID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------