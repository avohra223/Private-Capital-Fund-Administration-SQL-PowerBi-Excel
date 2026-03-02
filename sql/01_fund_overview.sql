-- Query 1: Fund Overview
-- Business question: What funds are we administering and what is their size?

SELECT Fund_Name, Strategy, Fund_Size
FROM Funds
ORDER BY Fund_Size DESC;
