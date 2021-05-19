/* ������� EmployeeID, ShipDate � ������� �� SubTotal ��� ������������ EmployeeID � ���������� ShipDate, 
������������� ����� ������ ������������ StandardPrice �� ����������� ShipDate �� ������� Purchasing.PurchaseOrderHeader. (������������ CUBE) */

SELECT EmployeeID
, ShipDate
, MIN(SubTotal) AS MINSubTotal
FROM Purchasing.PurchaseOrderHeader
GROUP BY CUBE(EmployeeID, ShipDate)

/* ��������� ��� ������� � ��������, ��������, ��� �� ����� ���� ����� ��� ������� EmployeeID, 
� �������� ���������� ShipDate ��� ����� ShipDate �������� ����������� StandardPrice */