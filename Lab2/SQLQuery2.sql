/* ����� ���������� ������� �������� ���� �� ������� Production.Product. */

SELECT COUNT(ISNULL([Weight],0)) AS NullWeight
FROM Production.Product
WHERE [Weight] IS NULL
