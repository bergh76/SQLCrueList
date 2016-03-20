USE PassengerManifest  -- Calls the database to use for SQL select/join question
/*
Jag vill från eran databas kunna ställa följande frågor: */

/* 2. Visa maxlön på den som har omkommit.*/

UPDATE PassengerList SET PassengerList.TotalSalary =  (StandardSalary + CBL.TotalBonus)
FROM PassengerList PL
	LEFT JOIN RankList ON PL.RankID = RankList.ID 
	LEFT JOIN CrewBonusList ON PL.ID = CrewBonusList.CrewID,
 (
			SELECT CBL.CrewID 
			, SUM(CBL.TotalBonusMoney) As TotalBonus
			, COUNT(CBL.CrewID) As BonusItems
			FROM CrewBonusList CBL
				JOIN PassengerList b ON b.ID = CBL.CrewID
				WHERE CBL.CrewID = b.ID
		GROUP BY CBL.CrewID
	)
AS CBL
SELECT MAX(TotalSalary) AS TotalSalary
			FROM PassengerList
	WHERE Alive = 0

