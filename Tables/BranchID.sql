--branch ID e acct Branch ID sao os mesmo numeros
--acct branch Add ID e como os numeros da agencia dos bancos no brasil

SELECT DISTINCT
     [branch_id]
     ,[acct_branch_id]
	 ,[acct_branch_add_id]
     ,[acct_branch_desc]
	  ,[acct_branch_code]
      ,[acct_branch_lat]
      ,[acct_branch_lon]
FROM dbo.stg_p1 sp
ORDER BY sp.branch_id ASC