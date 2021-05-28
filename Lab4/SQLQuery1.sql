/* 1.	Показать товар с самой маленькой стандартной ценой (цена больше нуля) (Таблица Production.Product). 
Показать поля [Name], StandardCost */
SELECT [Name]
, StandardCost
FROM Production.Product
WHERE StandardCost =
    (SELECT MIN (StandardCost)
    FROM Production.Product
    WHERE StandardCost > 0)

/* Показать количество продуктов и размер, для которого представлено максимальное количество 
продуктов (Таблица Production.Product). */
SELECT Size
, COUNT(ProductID) AS [Count]
FROM Production.Product
WHERE Size IS NOT NULL
GROUP BY Size
HAVING COUNT(ProductID) >= ALL
    (SELECT COUNT(ProductID)
    FROM Production.Product
    WHERE Size IS NOT NULL
    GROUP BY Size)

/* 3.	Показать товары, для которых существует только один стиль в одном
цвете (стиль и цвет определен) (Таблица Production.Product). Показать поля [Name], Style и Color. */
SELECT DISTINCT p1.[Name]
    ,p1.Style
    ,p1.Color
FROM Production.Product AS p1
WHERE p1.Style IS NOT NULL 
    AND p1.Color IS NOT NULL 
    AND EXISTS (
        SELECT COUNT(DISTINCT p2.Style)
        FROM Production.Product AS p2
        WHERE p2.Style IS NOT NULL 
        AND p1.Color = p2.Color
        HAVING COUNT(DISTINCT p2.Style) = 1)
ORDER BY p1.Color;

/* Показать товары, цена которых равна минимальной (больше нуля) 
цене товара того же размера (размер определен) (Таблица Production.Product) */
/* не знаю, правильно ли поняла задание, но попыталась отразить минимальную цену в каждой размерной линейке одного товара */
SELECT DISTINCT p1.ListPrice
    ,p1.Size
    ,p1.[Name]
FROM Production.Product AS p1
WHERE p1.Size IS NOT NULL 
AND p1.ListPrice = 
    (SELECT MIN(ListPrice)
    FROM Production.Product AS p2
    WHERE p2.ListPrice > 0 AND
    p2.Size = p1.Size)

/* Показать товары, цена которых больше средней цены в любой линейке продуктов 
(линейка продуктов определена) (Таблица Production.Product) */
SELECT DISTINCT ListPrice
    ,ProductLine
    ,[Name]
FROM Production.Product
WHERE ProductLine IS NOT NULL 
AND ListPrice > (SELECT MAX(MinListPrice)
				FROM 
				(SELECT AVG(ListPrice) As MinListPrice
				 FROM Production.Product
				 WHERE ListPrice > 0 AND ProductLine IS NOT NULL
				 GROUP BY ProductLine) AS T)
