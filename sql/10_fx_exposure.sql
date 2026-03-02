-- Query 10: FX Exposure by Transaction
-- Business question: Which transactions involved currency conversion and what was the FX impact?

SELECT
    Transactions.Txn_ID,
    Transactions.Txn_Date,
    Funds.Fund_Name,
    Transactions.Txn_Type,
    Transactions.Amount_Local,
    Transactions.Txn_Currency,
    Transactions.FX_To_Fund_Base,
    Transactions.Amount_Fund_Base,
    ROUND(Transactions.Amount_Fund_Base - Transactions.Amount_Local, 2) AS FX_Impact
FROM Transactions
JOIN Funds ON Transactions.Fund_ID = Funds.Fund_ID
WHERE Transactions.Txn_Currency != 'USD'
ORDER BY Transactions.Txn_Date DESC;
