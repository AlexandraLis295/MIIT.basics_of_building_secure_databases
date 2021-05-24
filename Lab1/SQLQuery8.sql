SELECT p.ProductID
, p.BusinessEntityID
, p.AverageLeadTime
, p.StandardPrice
FROM Purchasing.ProductVendor AS p
ORDER BY p.StandardPrice