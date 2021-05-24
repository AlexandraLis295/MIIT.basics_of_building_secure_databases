/* Вывести EmployeeID, ShipDate и минимум по SubTotal для всевозможных EmployeeID с одинаковой ShipDate, 
предусмотреть вывод самого минимального StandardPrice за определнный ShipDate из таблицы Purchasing.PurchaseOrderHeader. (Использовать CUBE) */

SELECT EmployeeID
, ShipDate
, MIN(SubTotal) AS MINSubTotal
FROM Purchasing.PurchaseOrderHeader
GROUP BY CUBE(EmployeeID, ShipDate)

/* Обсуждала это задание с Дмитрием, выяснила, что он здесь имел ввиду для каждого EmployeeID, 
у которого одинаковый ShipDate для этого ShipDate выводить минимальный StandardPrice */