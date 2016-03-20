USE PassengerManifest  -- Calls the database to use for SQL select/join question
/*
Jag vill från eran databas kunna ställa följande frågor:
1. Lista alla som har omkommit.
		a. Listan ska visa fullständiga namnet, avd.namn, från vilken planet, kön, ras och
		och rang.
*/

SELECT 
	CONCAT(FirstName, +' "'+ Alias +'" '+  LastName) AS 'Full Name', Gender,
	OriginList.OriginName AS 'Origin', 
	RankList.RankType AS 'Rank',
	DepartmentList.DepartmentName AS 'Department',
	Race.RaceType AS 'Race'
	FROM PassengerList
		LEFT JOIN RankList ON PassengerList.RankID = RankList.ID 
		LEFT JOIN DepartmentList ON PassengerList.DepartmentID = DepartmentList.ID
		LEFT JOIN OriginList ON PassengerList.OriginID = OriginList.ID
		LEFT JOIN StatusList ON PassengerList.StatusID = StatusList.ID
		LEFT JOIN Race ON PassengerList.RaceID = Race.ID		
	WHERE	(Alive = 0) 
	ORDER BY StatusList.StatusType, RankList.RankType ASC

