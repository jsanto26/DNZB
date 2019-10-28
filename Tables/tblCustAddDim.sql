/*****************************************************************************************************************
NAME:    dbo.tblCustAddDim
PURPOSE: Create the dbo.tblCustAddDim table
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/28/2019   Jose Santos       1. Built this table DNBZ Project
RUNTIME: 
Approx. 0 min
NOTES:
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblCustAddDim]    Script Date: 10/28/2019 2:53:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCustAddDim](
	[cust_add_id] [int] NOT NULL,
	[cust_add_type] [varchar](1) NOT NULL,
	[cust_add_lat] [decimal](16, 12) NOT NULL,
	[cust_add_lon] [decimal](16, 12) NOT NULL,
	[cust_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


