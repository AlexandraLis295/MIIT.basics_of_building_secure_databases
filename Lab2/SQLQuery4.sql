/* ������� �� ������� ������� (ProductLine) �� ������� Production.Product, ��� ����������� ���� ������ 3 (�� ������� ��������� ������ ����).*/

SELECT ProductLine,
MIN(ListPrice) AS MINPrice
FROM Production.Product
WHERE ProductLine IS NOT NULL
GROUP BY ProductLine
HAVING MIN(ListPrice)>3