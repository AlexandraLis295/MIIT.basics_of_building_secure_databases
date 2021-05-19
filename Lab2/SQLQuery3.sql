/* ����� ���������� ������� �������� ������� ���� (PhoneNumberTypeID) �� ������� Person.PersonPhone, 
��� � ������ �������� ������ ��� ����� ��������� � ���������� �����. */

SELECT PhoneNumberTypeID,
COUNT(PhoneNumberTypeID) AS PhoneNumber
FROM Person.PersonPhone
WHERE RIGHT(PhoneNumber, 3) LIKE LEFT(PhoneNumber, 3)
GROUP BY PhoneNumberTypeID
