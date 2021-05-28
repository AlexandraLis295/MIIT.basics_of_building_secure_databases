SELECT DocumentNode
, Title
, ISNULL(NULLIF(FileExtension, ''), '.txt') AS FileExtension
FROM Production.Document
