  
/*****************************************************************************************************************
NAME:    LoadData
PURPOSE: ETL process for Example data
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/30/2019   Jose Santos       1. Built this table for DNZB Project
RUNTIME: 
Approx. 1 min
NOTES:
These are the varioius Extract, Transform, and Load steps needed for the Example Data
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

-- 1) Create the Account Fact table

-- SELECT DISTINCT 
--       s.as_of_date, 
--       s.acct_id, 
--       s.cur_bal
-- INTO dbo.tblAccountFact
-- FROM dbo.stg_p1 AS s
-- ORDER BY 1, 
--          2;
-- dbo.tblAccountFact

TRUNCATE TABLE dbo.tblAccountFact;

INSERT INTO dbo.tblAccountFact
       SELECT DISTINCT 
              s.as_of_date, 
              s.acct_id, 
              s.cur_bal
       FROM dbo.stg_p1 AS s
       ORDER BY 1, 
                2;

-- 2) Create the Product Dimension table

-- SELECT DISTINCT 
--        s.prod_id
-- INTO dbo.tblProductDim
-- FROM dbo.stg_p1 AS s;

TRUNCATE TABLE dbo.tblProductDim;

INSERT INTO dbo.tblProductDim
       SELECT DISTINCT 
              s.prod_id
       FROM dbo.stg_p1 AS s;

-- 3) Create the Area Dimension table

-- SELECT DISTINCT 
--       s.acct_area_id AS area_id
-- INTO dbo.tblAreaDim
-- FROM dbo.stg_p1 AS s;

TRUNCATE TABLE dbo.tblAreaDim;

INSERT INTO dbo.[tblAreaDim]
       SELECT DISTINCT 
              s.acct_area_id AS area_id
       FROM dbo.stg_p1 AS s;


-- 4) Create the Region Dimension table

-- SELECT DISTINCT 
--       s.acct_region_id AS Region_id
-- INTO dbo.tblRegionDim
-- FROM dbo.stg_p1 AS s;

TRUNCATE TABLE dbo.tblRegionDim;

INSERT INTO dbo.tblRegionDim
       SELECT DISTINCT 
              s.acct_region_id AS Region_id
       FROM dbo.stg_p1 AS s;

-- 5) Create the Address Dimension table--

-- SELECT DISTINCT 
--       s.acct_branch_add_id AS Address_id, 
--       s.acct_branch_add_type AS Address_Type, 
--       s.acct_branch_lat AS Latitude, 
--       s.acct_branch_lon AS Longitude
-- INTO dbo.tblAddressDim
-- FROM dbo.stg_p1 AS s;

TRUNCATE TABLE dbo.tblAddressDim;

INSERT INTO dbo.tblAddressDim
       SELECT DISTINCT 
              s.acct_branch_add_id AS Address_id, 
              s.acct_branch_add_type AS Address_Type, 
              s.acct_branch_lat AS Latitude, 
              s.acct_branch_lon AS Longitude
       FROM dbo.stg_p1 AS s;


-- 6) Create the  Dimension table--

-- SELECT DISTINCT 
--       s.acct_id AS Address_id, 
--       s.open_date AS Address_Type, 
--       s.close_date AS Latitude, 
--       s.open_close_code AS Longitude, 
--       s.loan_amt, 
--       s.prod_id, 
--       s.branch_id, 
--       s.pri_cust_id
-- INTO dbo.tblAccountDim
-- FROM dbo.stg_p1 AS s;

TRUNCATE TABLE dbo.tblAccountDim;

INSERT INTO dbo.tblAccountDim
       SELECT DISTINCT 
              s.acct_id AS Address_id, 
              s.open_date AS Address_Type, 
              s.close_date AS Latitude, 
              s.open_close_code AS Longitude, 
              s.loan_amt, 
              s.prod_id, 
              s.branch_id, 
              s.pri_cust_id
       FROM dbo.stg_p1 AS s;


-- 7) Create the  Customer Role Dimension table--

-- SELECT DISTINCT 
--       s.acct_cust_role_id AS Customer_role_id
-- INTO dbo.tblCustomerRoleDim
-- FROM dbo.stg_p1 AS s;

TRUNCATE TABLE dbo.tblCustomerRoleDim;

INSERT INTO dbo.tblCustomerRoleDim
       SELECT DISTINCT 
              s.acct_cust_role_id AS Customer_role_id
       FROM dbo.stg_p1 AS s;

-- 8) Create the Customer Dimension table--

--SELECT DISTINCT 
--       s.cust_id, 
--       s.last_name, 
--       s.first_name,
--	   s.gender, 
--       s.birth_date, 
--       s.cust_since_date, 
--       s.cust_pri_branch_dist, 
--       s.pri_branch_id, 
--       s.acct_branch_add_id AS Address_id, 
--       s.cust_rel_id
-- INTO dbo.tblCustomerDim
-- FROM dbo.stg_p1 AS s;

TRUNCATE TABLE dbo.tblCustomerDim;

INSERT INTO dbo.tblCustomerDim
       SELECT DISTINCT 
              s.cust_id AS Customer_id, 
              s.last_name, 
              s.first_name, 
              s.gender, 
              s.birth_date, 
              s.cust_since_date, 
              s.cust_pri_branch_dist 
             -- s.pri_branch_id, 
             -- s.acct_branch_add_id AS Address_id, 
              --s.cust_rel_id
       FROM dbo.stg_p1 AS s;

-- 9) Create the Customer Account Dimension table--

-- SELECT DISTINCT 
--       s.acct_id AS cust_acct_id, 
--       s.acct_id, 
--       s.cust_id, 
--       s.acct_cust_role_id
--  INTO dbo.tblCustomer_AccountDim
--  FROM dbo.stg_p1 AS s;

TRUNCATE TABLE dbo.tblCustomer_AccountDim;

INSERT INTO dbo.tblCustomer_AccountDim
       SELECT DISTINCT 
              s.acct_id AS cust_acct_id, 
              s.acct_id, 
              s.cust_id, 
              s.acct_cust_role_id
       FROM dbo.stg_p1 AS s;

-- 10) Create the Branch Dimension table--

-- SELECT DISTINCT 
--       s.branch_id, 
--       s.acct_branch_desc AS branch_desc, 
--       s.acct_branch_add_id AS address_id, 
--       s.acct_branch_code AS branch_code, 
--       s.acct_region_id AS region_id, 
--       s.acct_area_id AS area_id
-- INTO dbo.tblBranchDim
-- FROM dbo.stg_p1 AS s;

TRUNCATE TABLE dbo.tblBranchDim;

INSERT INTO dbo.tblBranchDim
       SELECT DISTINCT 
              s.branch_id, 
              s.acct_branch_desc AS branch_desc, 
              s.acct_branch_add_id AS address_id, 
              s.acct_branch_code AS branch_code, 
              s.acct_region_id AS region_id, 
              s.acct_area_id AS area_id
       FROM dbo.stg_p1 AS s;

