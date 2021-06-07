SELECT ProductID
, StartDate
, EndDate
, ListPrice
FROM Production.ProductListPriceHistory
WHERE ListPrice BETWEEN 50 AND 60
AND EndDate IS NOT NULL