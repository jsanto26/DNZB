/*****************************************************************************************************************
NAME:    dbo.tblCustomer_AccountDim
PURPOSE: Create the dbo.tblCustomer_AccountDim table
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/30/2019   Jose Santos       1. Built this table DNBZ Project
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

/****** Object:  Table [dbo].[tblCustomer_AccountDim]    Script Date: 10/30/2019 1:27:36 PM ******/
DROP TABLE [dbo].[tblCustomer_AccountDim]
GO

/****** Object:  Table [dbo].[tblCustomer_AccountDim]    Script Date: 10/30/2019 1:27:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCustomer_AccountDim](
	[cust_acct_id] [int] NOT NULL,
	[acct_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL
) ON [PRIMARY]
GO

