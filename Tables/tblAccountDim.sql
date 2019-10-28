/*****************************************************************************************************************
NAME:    dbo.tblAccountDim
PURPOSE: Create the dbo.tblAccountDim table
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

/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 10/28/2019 2:30:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountDim](
	[acct_id] [int] NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[open_close_code] [date] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL,
	[cust_rel_id] [smallint] NOT NULL,
	[acct_branch_add_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


