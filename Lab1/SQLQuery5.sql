SELECT ScrapReasonID
, [Name]
FROM Production.ScrapReason
WHERE [Name] IN ('Color incorrect','Drill size too large','Drill size too small','Paint process failed')
