/*****************************************************************************************************************
NAME:    dbo.tblAccountDim
PURPOSE: Create the dbo.tblAccountDim table
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

/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 10/30/2019 12:27:58 PM ******/
DROP TABLE [dbo].[tblAccountDim]
GO

/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 10/30/2019 12:27:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountDim](
	[Address_id] [int] NOT NULL,
	[Address_Type] [date] NOT NULL,
	[Latitude] [date] NOT NULL,
	[Longitude] [varchar](1) NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	[prod_id] [smallint] NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[pri_cust_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblAccountDim_1] PRIMARY KEY CLUSTERED 
(
	[Address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




