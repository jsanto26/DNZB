/*****************************************************************************************************************
NAME:    LoadData
PURPOSE: ETL process for Example data
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------  
1.1     10/28/2019   Jose Santos       1. Added fact table load for DNZB2 Project
RUNTIME: 
Approx. 1 min
NOTES:
These are the varioius Extract, Transform, and Load steps needed for the Example Data
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/


INSERT INTO [dbo].[tblAccountDim]
           ([acct_id]
           ,[open_date]
           ,[close_date]
           ,[open_close_code]
           ,[acct_cust_role_id]
           ,[cust_rel_id]
           ,[acct_branch_add_id])


TRUNCATE TABLE dbo.tblAccountDim;



INSERT INTO [dbo].[tblAreaDim]
           ([acct_area_id])

TRUNCATE TABLE dbo.tblAreaDim;


INSERT INTO [dbo].[tblBalanceAcctFact]
           ([acct_id]
           ,[cur_bal]
           ,[loan_amt]
           ,[as_of_date]
           ,[prod_id]
           ,[cust_id])

TRUNCATE TABLE dbo.tblBalanceAcctFact

INSERT INTO [dbo].[tblBranchAddDim]
           ([acct_branch_add_id]
           ,[acct_branch_add_type]
           ,[acct_branch_add_lat]
           ,[acct_branch_add_lon]
           ,[branch_id])

TRUNCATE TABLE dbo.tblBranchAddDim

INSERT INTO [dbo].[tblBranchDim]
           ([branch_id]
           ,[acct_branch_desc]
           ,[acct_branch_code]
           ,[acct_region_id]
           ,[acct_area_id]
           ,[acct_branch_add_id]
           ,[pri_branch_id])

TRUNCATE TABLE dbo.tblBranchDim

INSERT INTO [dbo].[tblCustAddDim]
           ([cust_add_id]
           ,[cust_add_type]
           ,[cust_add_lat]
           ,[cust_add_lon]
           ,[cust_id])
TRUNCATE TABLE dbo.tblCustAddDim

INSERT INTO [dbo].[tblCustomerDim]
           ([cust_id]
           ,[cust_rel_id]
           ,[last_name]
           ,[first_name]
           ,[gender]
           ,[birth_date]
           ,[cust_since_date]
           ,[cust_add_id]
           ,[pri_cust_id])

TRUNCATE TABLE dbo.tblCustomerDim

INSERT INTO [dbo].[tblLinkDim]
           ([acct_cust_role_id]
           ,[cust_rel_id]
           ,[acct_id]
           ,[cust_id])

TRUNCATE TABLE dbo.tblLinkDim

INSERT INTO [dbo].[tblPriCustBranAcctDim]
           ([pri_cust_id]
           ,[pri_branch_id]
           ,[acct_id]
           ,[cust_rel_id]
           ,[cust_pri_branch_dist])
		   
TRUNCATE TABLE dbo.tblPriCustBranAcctDim

INSERT INTO [dbo].[tblProduct]
           ([prod_id])

TRUNCATE TABLE dbo.tblProduct

INSERT INTO [dbo].[tblRegionDim]
           ([acct_region_id])

TRUNCATE TABLE dbo.tblRegionDim