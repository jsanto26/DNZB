/*****************************************************************************************************************
NAME:    dbo.tblBalanceAcctFact
PURPOSE: Create the dbo.tblBalanceAcctFact table
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

/****** Object:  Table [dbo].[tblBalanceAcctFact]    Script Date: 10/28/2019 1:40:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblBalanceAcctFact](
	[acct_id] [int] NOT NULL,
	[cur_bal] [decimal](20, 4) NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	[as_of_date] [date] NOT NULL,
	[prod_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL
) ON [PRIMARY]
GO


