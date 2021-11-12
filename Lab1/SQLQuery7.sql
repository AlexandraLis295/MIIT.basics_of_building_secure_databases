SELECT ProductID
, [Name]
, COALESCE(Color,CAST([Weight] AS VARCHAR(40)), 'UNKNOWN') AS Meauserement
FROM Production.Product