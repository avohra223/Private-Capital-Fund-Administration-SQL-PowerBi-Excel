-- Query 2: LP Commitments Ranked
-- Business question: Which investors have the largest total commitments across all funds?

SELECT 
    Investors.Investor_Name,
    Investors.Investor_Type,
    SUM(Commitments.Commitment_Amount) AS Total_Commitment
FROM Investors
JOIN Commitments ON Investors.Investor_ID = Commitments.Investor_ID
GROUP BY Investors.Investor_Name, Investors.Investor_Type
ORDER BY Total_Commitment DESC;
