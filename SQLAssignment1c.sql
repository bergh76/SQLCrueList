USE PassengerManifest  -- Calls the database to use for SQL select/join question
/*
Jag vill från eran databas kunna ställa följande frågor: */
/* C. Alla döda utav kaptensgrad som tjänar över 50000.   */

UPDATE PassengerList SET PassengerList.TotalSalary = (StandardSalary + CBL.TotalBonus)
FROM PassengerList PL
	LEFT JOIN RankList ON PL.RankID = RankList.ID 
	LEFT JOIN CrewBonusList ON PL.ID = CrewBonusList.CrewID,
 (
			SELECT CBL.CrewID 
			, SUM(CBL.TotalBonusMoney) As TotalBonus
			, COUNT(CBL.CrewID) As BonusItems
			FROM CrewBonusList CBL
				JOIN PassengerList b ON b.ID = CBL.CrewID
		GROUP BY CBL.CrewID
	)
AS CBL
SELECT 
	FirstName, LastName,
	RankList.RankType AS 'Rank', 
	TotalSalary
FROM PassengerList
	JOIN StatusList ON PassengerList.StatusID = StatusList.ID	
	JOIN RankList ON PassengerList.RankID = RankList.ID
WHERE Alive = 0 AND TotalSalary >= 50000 AND RankType = 'Captain'
