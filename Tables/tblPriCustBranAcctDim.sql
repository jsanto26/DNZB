/*****************************************************************************************************************
NAME:    dbo.tblPriCustBranAcctDim
PURPOSE: Create the dbo.tblPriCustBranAcctDim table
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

/****** Object:  Table [dbo].[tblPriCustBranAcctDim]    Script Date: 10/28/2019 3:08:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblPriCustBranAcctDim](
	[pri_cust_id] [smallint] NOT NULL,
	[pri_branch_id] [smallint] NOT NULL,
	[acct_id] [smallint] NOT NULL,
	[cust_rel_id] [smallint] NOT NULL,
	[cust_pri_branch_dist] [smallint] NOT NULL
) ON [PRIMARY]
GO


