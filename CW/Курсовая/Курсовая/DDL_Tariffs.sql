CREATE TABLE Tariffs
(ID INT PRIMARY KEY,
ID_Operator INT FOREIGN KEY REFERENCES Operators(ID),
TariffName NVARCHAR(20))