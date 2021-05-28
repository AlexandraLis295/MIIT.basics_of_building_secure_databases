/* 1.	���������� ������ ����� */
SELECT * FROM Services

/* 2.	���������� ������ ������� � ���� �� ������� ������ */
SELECT T1.TariffName, SUM(S.Price) AS Price
FROM Tariffs AS T1
INNER JOIN Tariffs_Services AS T2
ON T1.ID=T2.ID_Tariff
INNER JOIN Services AS S
ON T2.ID_Service=S.ID
GROUP BY T1.TariffName

/* 3.	���������� ������ ��������� �� ������� ������ */
SELECT FullName, TariffName
FROM Subcribers AS S
INNER JOIN PhoneNumbers AS P
ON S.ID=P.ID_Subcriber
INNER JOIN Tariffs AS T
ON P.ID_Tariff=T.ID
WHERE TariffName='�����������'

/* 4.	���������� ������ ����� ���������������� ������� */
SELECT TariffName, COUNT(ID_Tariff) AS Quantity
FROM PhoneNumbers AS P
INNER JOIN Tariffs AS T
ON P.ID_Tariff=T.ID
GROUP BY TariffName
ORDER BY Quantity DESC

/* 5.	���������� ���������� ������������� ������� ����� ��������� */
SELECT TariffName,
	(100*COUNT(ID_Tariff)/(SELECT COUNT(*) FROM PhoneNumbers)) AS [Percent]
FROM PhoneNumbers AS P
INNER JOIN Tariffs AS T
ON P.ID_Tariff=T.ID
GROUP BY TariffName