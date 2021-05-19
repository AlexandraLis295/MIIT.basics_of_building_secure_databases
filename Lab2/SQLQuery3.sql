/* Найти количество номеров телефона разного типа (PhoneNumberTypeID) из таблицы Person.PersonPhone, 
где в номере телефона первые три цифры совпадают с последними тремя. */

SELECT PhoneNumberTypeID,
COUNT(PhoneNumberTypeID) AS PhoneNumber
FROM Person.PersonPhone
WHERE RIGHT(PhoneNumber, 3) LIKE LEFT(PhoneNumber, 3)
GROUP BY PhoneNumberTypeID
