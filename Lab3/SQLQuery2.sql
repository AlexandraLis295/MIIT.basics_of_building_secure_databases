/* Показать номера аккаунтов (AcCountNumber) и поля FirstName, LastName из таблиц Person.Person, Sales.Customer. */
SELECT AccountNumber
, FirstName
, LastName
FROM Person.Person AS Table1
INNER JOIN Sales.Customer AS Table2
ON Table1.BusinessEntityID=Table2.PersonID

/* 2.	Показать список продуктов (поле Name) в котором указано, есть ли у продукта единицы измерения веса или нет, из таблиц 
Production.Product, Production.UnitMeasure, используя LEFT OUTER JOIN */
SELECT Product.Name
, UnitMeasure.Name
FROM 
Production.Product AS Product
LEFT OUTER JOIN Production.UnitMeasure AS UnitMeasure
ON Product.WeightUnitMeasureCode=UnitMeasure.UnitMeasureCode;

/* 3.	Показать список людей (поля FirstName, LastName), в котором указано, имеется ли логин идентификатор (LoginID) или нет, 
из таблиц HumanResources.Employee, Person.Person, используя RIGHT OUTER JOIN */
SELECT FirstName
, LastName
, LoginID
FROM HumanResources.Employee AS HumanResources
RIGHT OUTER JOIN Person.Person AS Person
ON HumanResources.BusinessEntityID=Person.BusinessEntityID

/* 4.	Показать список продуктов (ProductID), которые имеют несколько скидок на единицу продукции (UnitPriceDiscount), 
из таблицы Sales.SalesOrderDetail, используя SELF JOIN. */
SELECT DISTINCT Sales1.ProductID
, Sales1.UnitPriceDiscount
FROM Sales.SalesOrderDetail AS Sales1
INNER JOIN Sales.SalesOrderDetail AS Sales2
ON Sales1.ProductID=Sales2.ProductID
AND Sales1.UnitPriceDiscount<>Sales2.UnitPriceDiscount
ORDER BY Sales1.ProductID;

/* 5.	Показать список скидок на единицу продукции (UnitPriceDiscount), к которым относятся несколько продуктов (ProductID), 
из таблицы Sales.SalesOrderDetail, используя SELF JOIN. */
SELECT DISTINCT Sales1.ProductID
, Sales1.UnitPriceDiscount
FROM Sales.SalesOrderDetail AS Sales1
INNER JOIN Sales.SalesOrderDetail AS Sales2
ON Sales1.UnitPriceDiscount=Sales2.UnitPriceDiscount
AND Sales1.ProductID<>Sales2.ProductID
ORDER BY Sales1.UnitPriceDiscount;

/* 6.	Показать подкатегории продуктов (ProductSubcategoryID из таблицы Production.Product), 
которые имеют несколько цветов начинающихся на «B», используя SELF JOIN */
SELECT DISTINCT Production1.ProductSubcategoryID
, Production1.Color
FROM Production.Product AS Production1
INNER JOIN Production.Product AS Production2
ON Production1.ProductSubcategoryID=Production2.ProductSubcategoryID
AND Production1.Color<>Production2.Color
WHERE Production1.Color LIKE 'B%' 
AND Production2.Color LIKE 'B%'
ORDER BY Production1.ProductSubcategoryID;

/* 7.	Показать комбинированный список таблиц Person.EmailAddress, Person.Person по полям BusinessEntityID, 
rowguid, ModifiedDate, используя UNION. */
SELECT BusinessEntityID
, rowguid
, ModifiedDate
FROM Person.EmailAddress
UNION
SELECT BusinessEntityID
, rowguid
, ModifiedDate
FROM Person.Person

/* 8.	Показать список ProductID, которые содержатся в таблице Production.Product, 
но не содержатся в таблице Production. ProductDocument. */
SELECT ProductID
FROM Production.Product
EXCEPT
SELECT ProductID
FROM Production.ProductDocument