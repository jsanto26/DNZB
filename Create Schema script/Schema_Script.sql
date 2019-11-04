/*****************************************************************************************************************
NAME:    Schema Script
PURPOSE:  
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/04/2019  Jose Santos       1. 
RUNTIME: 
Approx. 1 min
NOTES:

LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

 USE [DFNB2]
GO
/****** Object:  Table [dbo].[tblAccountFact]    Script Date: 11/4/2019 3:12:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountFact](
	[as_of_date] [date] NOT NULL,
	[acct_id] [int] NOT NULL,
	[cur_bal] [decimal](20, 4) NOT NULL,
 CONSTRAINT [PK_tblAccountFact] PRIMARY KEY CLUSTERED 
(
	[as_of_date] ASC,
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 11/4/2019 3:12:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBranchDim](
	[branch_id] [smallint] NOT NULL,
	[branch_desc] [varchar](100) NOT NULL,
	[branch_code] [varchar](5) NOT NULL,
	[region_id] [int] NOT NULL,
	[area_id] [int] NOT NULL,
	[address_id] [int] NULL,
 CONSTRAINT [PK_tblBranchDim] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAccountDim]    Script Date: 11/4/2019 3:12:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccountDim](
	[acct_id] [int] NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	[prod_id] [smallint] NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[pri_cust_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblAccountDim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Total_Loan_Year]    Script Date: 11/4/2019 3:12:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--1) How much are the loans in years (2019, 2018, 2017, 2016)?

CREATE VIEW [dbo].[vw_Total_Loan_Year]
AS
     SELECT DISTINCT 
            ad.branch_id
          , b.branch_desc AS Branch_desc
          , AVG(ad.loan_amt) AS Total_Loan
          , YEAR(as_of_date) AS Year
       FROM tblAccountDim AS ad
            INNER JOIN
            dbo.tblBranchDim AS b ON b.branch_id = ad.branch_id
            INNER JOIN
            dbo.tblAccountFact AS af ON ad.acct_id = af.acct_id
      WHERE YEAR(af.as_of_date) IN
                                  (
                                   2019
                                 , 2018
                                 , 2017
                                 , 2016
                                  )
      GROUP BY branch_desc
             , YEAR(as_of_date)
             , ad.branch_id;



GO
/****** Object:  Table [dbo].[tblCustomerRoleDim]    Script Date: 11/4/2019 3:12:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomerRoleDim](
	[Customer_role_id] [smallint] NOT NULL,
	[cut_role_desc] [varchar](50) NULL,
 CONSTRAINT [PK_tblCustomerRoleDim] PRIMARY KEY CLUSTERED 
(
	[Customer_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomer_AccountDim]    Script Date: 11/4/2019 3:12:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer_AccountDim](
	[cust_acct_id] [int] NOT NULL,
	[acct_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblCustomer_AccountDim] PRIMARY KEY CLUSTERED 
(
	[cust_acct_id] ASC,
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomerDim]    Script Date: 11/4/2019 3:12:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomerDim](
	[cust_id] [smallint] NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[birth_date] [date] NOT NULL,
	[cust_since_date] [date] NOT NULL,
	[cust_pri_branch_dist] [decimal](7, 2) NOT NULL,
	[Branch_id] [smallint] NOT NULL,
	[Address_id] [int] NOT NULL,
	[rel_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblCustomerDim] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Customer]    Script Date: 11/4/2019 3:12:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--2) Total of Existents Customers and New Customers (2019)
CREATE VIEW [dbo].[vw_Customer]
As
SELECT DISTINCT 
       cd.cust_id
     , ca.acct_id
     , cd.gender
     , Year(ad.open_date) AS Start_Year
     , ad.open_close_code AS Status_Account
     , DATENAME(M, cd.birth_date) AS Birth_month
     , DATEDIFF(Month, cd.cust_since_date, GETDATE()) / 12 AS Years_Client
     , DATEDIFF(Month, cd.birth_date, GETDATE()) / 12 AS Age
     , cd.Branch_id
  FROM dbo.tblCustomerDim AS cd
       INNER JOIN
       dbo.tblCustomer_AccountDim AS ca ON cd.cust_id = ca.cust_id
       INNER JOIN
       dbo.tblAccountFact AS af ON ca.acct_id = af.acct_id
       INNER JOIN
       dbo.tblAccountDim AS ad ON af.acct_id = ad.acct_id
       INNER JOIN
       dbo.tblCustomerRoleDim AS cr ON ca.acct_cust_role_id = cr.Customer_role_id
 GROUP BY cd.gender
        , ad.open_date
        , cd.cust_id
        , cd.cust_since_date
        , cd.birth_date
        , cd.cust_since_date
        , cd.birth_date
        , cd.Branch_id
        , ca.acct_id
        , af.as_of_date
        , af.cur_bal
        , ad.open_close_code
        , cr.Customer_role_id
        , cd.first_name
        , cd.last_name;
GO
/****** Object:  Table [dbo].[tblAddressDim]    Script Date: 11/4/2019 3:12:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddressDim](
	[Address_id] [int] NOT NULL,
	[Address_type] [varchar](1) NOT NULL,
	[Latitude] [decimal](16, 12) NOT NULL,
	[Longitude] [decimal](16, 12) NOT NULL,
 CONSTRAINT [PK_tblAddressDim] PRIMARY KEY CLUSTERED 
(
	[Address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblAreaDim]    Script Date: 11/4/2019 3:12:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAreaDim](
	[area_id] [int] NOT NULL,
	[area_desc] [varchar](50) NULL,
 CONSTRAINT [PK_tblAreaDim] PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductDim]    Script Date: 11/4/2019 3:12:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductDim](
	[prod_id] [smallint] NOT NULL,
	[prod_desc] [varchar](50) NULL,
 CONSTRAINT [PK_tblProductDim] PRIMARY KEY CLUSTERED 
(
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegionDim]    Script Date: 11/4/2019 3:12:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegionDim](
	[Region_id] [int] NOT NULL,
	[Region_name] [varchar](50) NULL,
 CONSTRAINT [PK_tblRegionDim] PRIMARY KEY CLUSTERED 
(
	[Region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblrelationshipDim]    Script Date: 11/4/2019 3:12:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrelationshipDim](
	[rel_id] [smallint] NOT NULL,
	[rel_des] [varchar](50) NULL,
 CONSTRAINT [PK_tblrelationshipDim] PRIMARY KEY CLUSTERED 
(
	[rel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountDim_tblBranchDim] FOREIGN KEY([branch_id])
REFERENCES [dbo].[tblBranchDim] ([branch_id])
GO
ALTER TABLE [dbo].[tblAccountDim] CHECK CONSTRAINT [FK_tblAccountDim_tblBranchDim]
GO
ALTER TABLE [dbo].[tblAccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountDim_tblCustomerDim] FOREIGN KEY([pri_cust_id])
REFERENCES [dbo].[tblCustomerDim] ([cust_id])
GO
ALTER TABLE [dbo].[tblAccountDim] CHECK CONSTRAINT [FK_tblAccountDim_tblCustomerDim]
GO
ALTER TABLE [dbo].[tblAccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblAccountDim_tblProductDim] FOREIGN KEY([prod_id])
REFERENCES [dbo].[tblProductDim] ([prod_id])
GO
ALTER TABLE [dbo].[tblAccountDim] CHECK CONSTRAINT [FK_tblAccountDim_tblProductDim]
GO
ALTER TABLE [dbo].[tblBranchDim]  WITH CHECK ADD  CONSTRAINT [FK_tblBranchDim_tblAddressDim] FOREIGN KEY([address_id])
REFERENCES [dbo].[tblAddressDim] ([Address_id])
GO
ALTER TABLE [dbo].[tblBranchDim] CHECK CONSTRAINT [FK_tblBranchDim_tblAddressDim]
GO
ALTER TABLE [dbo].[tblBranchDim]  WITH CHECK ADD  CONSTRAINT [FK_tblBranchDim_tblAreaDim] FOREIGN KEY([area_id])
REFERENCES [dbo].[tblAreaDim] ([area_id])
GO
ALTER TABLE [dbo].[tblBranchDim] CHECK CONSTRAINT [FK_tblBranchDim_tblAreaDim]
GO
ALTER TABLE [dbo].[tblBranchDim]  WITH CHECK ADD  CONSTRAINT [FK_tblBranchDim_tblBranchDim] FOREIGN KEY([branch_id])
REFERENCES [dbo].[tblBranchDim] ([branch_id])
GO
ALTER TABLE [dbo].[tblBranchDim] CHECK CONSTRAINT [FK_tblBranchDim_tblBranchDim]
GO
ALTER TABLE [dbo].[tblBranchDim]  WITH CHECK ADD  CONSTRAINT [FK_tblBranchDim_tblRegionDim] FOREIGN KEY([region_id])
REFERENCES [dbo].[tblRegionDim] ([Region_id])
GO
ALTER TABLE [dbo].[tblBranchDim] CHECK CONSTRAINT [FK_tblBranchDim_tblRegionDim]
GO
ALTER TABLE [dbo].[tblCustomer_AccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomer_AccountDim_tblCustomerDim] FOREIGN KEY([cust_id])
REFERENCES [dbo].[tblCustomerDim] ([cust_id])
GO
ALTER TABLE [dbo].[tblCustomer_AccountDim] CHECK CONSTRAINT [FK_tblCustomer_AccountDim_tblCustomerDim]
GO
ALTER TABLE [dbo].[tblCustomer_AccountDim]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomer_AccountDim_tblCustomerRoleDim] FOREIGN KEY([acct_cust_role_id])
REFERENCES [dbo].[tblCustomerRoleDim] ([Customer_role_id])
GO
ALTER TABLE [dbo].[tblCustomer_AccountDim] CHECK CONSTRAINT [FK_tblCustomer_AccountDim_tblCustomerRoleDim]
GO
ALTER TABLE [dbo].[tblCustomerDim]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerDim_tblAddressDim] FOREIGN KEY([Address_id])
REFERENCES [dbo].[tblAddressDim] ([Address_id])
GO
ALTER TABLE [dbo].[tblCustomerDim] CHECK CONSTRAINT [FK_tblCustomerDim_tblAddressDim]
GO
ALTER TABLE [dbo].[tblCustomerDim]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerDim_tblCustomerDim] FOREIGN KEY([cust_id])
REFERENCES [dbo].[tblCustomerDim] ([cust_id])
GO
ALTER TABLE [dbo].[tblCustomerDim] CHECK CONSTRAINT [FK_tblCustomerDim_tblCustomerDim]
GO
ALTER TABLE [dbo].[tblCustomerDim]  WITH CHECK ADD  CONSTRAINT [FK_tblCustomerDim_tblrelationshipDim] FOREIGN KEY([rel_id])
REFERENCES [dbo].[tblrelationshipDim] ([rel_id])
GO
ALTER TABLE [dbo].[tblCustomerDim] CHECK CONSTRAINT [FK_tblCustomerDim_tblrelationshipDim]
GO
