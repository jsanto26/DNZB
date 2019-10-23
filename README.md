/*****************************************************************************************************************
NAME:    [dbo].[tblCustomerIDDim]
PURPOSE: Create the [dbo].[tblCustomerIDDim] table
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/22/2019   JSantos       1. Project 3.2
RUNTIME: 
Approx. 0 min
NOTES:
This is a college project in class IT 240
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  Table [dbo].[tbl.CustomerIDDim]    Script Date: 10/22/2019 7:52:00:00 PM ******/
DROP TABLE [dbo].[tbl.CustomerIDDim]
GO

/****** Object:  Table [dbo].[tbl.CustomerIDDim]    Script Date: 10/22/2019  7:52:00:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl.CustomerIDDim](
	[cust_id] [smallint] NOT NULL,
	[cust_id2] [smallint] NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
) ON [PRIMARY]
GO
