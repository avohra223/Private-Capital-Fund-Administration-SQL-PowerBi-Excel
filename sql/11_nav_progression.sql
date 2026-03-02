-- Query 11: NAV Progression by Fund Over Time
-- Business question: How has each fund's net asset value evolved quarter by quarter?

SELECT
    Funds.Fund_Name,
    Funds.Strategy,
    NAV_Quarterly.Quarter_End_Date,
    NAV_Quarterly.Gross_NAV_Fund_Base,
    NAV_Quarterly.Net_NAV_Fund_Base,
    NAV_Quarterly.Total_Called_To_Date,
    NAV_Quarterly.Total_Distributed_To_Date,
    ROUND(NAV_Quarterly.Net_NAV_Fund_Base - LAG(NAV_Quarterly.Net_NAV_Fund_Base) 
        OVER (PARTITION BY Funds.Fund_ID ORDER BY NAV_Quarterly.Quarter_End_Date), 2) AS NAV_Change
FROM NAV_Quarterly
JOIN Funds ON NAV_Quarterly.Fund_ID = Funds.Fund_ID
ORDER BY Funds.Fund_Name, NAV_Quarterly.Quarter_End_Date;
