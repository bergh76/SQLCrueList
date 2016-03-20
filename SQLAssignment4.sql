/* sohail.hasware@accordance.se    */

USE PassengerManifest  -- Calls the database to use for SQL select/join question
/*
Jag vill fr�n eran databas kunna st�lla f�ljande fr�gor: */
/* 4. Vad �r genomsnittsl�nen p� bes�ttningen, levande och d�da. */
UPDATE PassengerList SET PassengerList.TotalSalary = StandardSalary + COALESCE(TotalBonus,0)
FROM PassengerList 
	LEFT JOIN RankList ON PassengerList.RankID = RankList.ID 
	LEFT JOIN CrewBonusList ON PassengerList.ID = CrewBonusList.CrewID
	,(
		SELECT a.CrewID
		, SUM(a.TotalBonusMoney) TotalBonus
		, COUNT(a.CrewID) As BonusItems
		FROM CrewBonusList a
			RIGHT JOIN PassengerList b ON a.CrewID = b.ID
			--WHERE b.ID = a.TotalBonusMoney
		GROUP BY a.CrewID	
	)
AS TotalBonusMoney
	
SELECT	AVG(d.TotalSalary) AS 'Average Salary Dead'
		, AVG(a.TotalSalary) AS 'Average Salary Alive'
		FROM PassengerList d, PassengerList a
		WHERE d.Alive = 0 and a.Alive = 1