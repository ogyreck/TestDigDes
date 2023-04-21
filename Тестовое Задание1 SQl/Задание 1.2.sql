USE TestDigDes

DECLARE @iBegin INT;
SET @iBegin = 1;

DECLARE @iEnd INT;
SET @iEnd = (SELECT count(id) FROM employee);

DECLARE @chiefLevel INT;
DROP TABLE #ChiefCount
--Создаем временную таблицу для подсчета зависимостей 
Create Table #ChiefCount( Id int, ChiefLevel int)
 

WHILE (@iBegin < @iEnd)
BEGIN;
WITH  Rec (ID, Chief_id, Name)
AS (
    SELECT ID,Chief_id, Name  
	FROM Employee e 
	WHERE e.id = @iBegin
    UNION ALL

    SELECT e.id,e.Chief_id, e.name
    FROM Rec 
		JOIN employee e on rec.id = e.chief_id  
)

SELECT @chiefLevel= (SELECT  COUNT(rec.id) 
FROM Employee AS e, Rec
WHERE e.id  = @iBegin)

INSERT INTO #ChiefCount values (@iBegin, @chiefLevel) 

SET @iBegin = @iBegin +1
END;

SELECT MAX(ChiefLevel) MaxChiefLevel FROM #ChiefCount



