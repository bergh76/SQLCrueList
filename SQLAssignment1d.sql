USE PassengerManifest
/*
Jag vill från eran databas kunna ställa följande frågor: */

/* d. Alla döda från en viss planet.*/
SELECT FirstName, LastName,
	OriginList.OriginName AS 'Planet', 
	StatusList.StatusType AS 'Status'
FROM PassengerList 
	JOIN StatusList ON PassengerList.StatusID = StatusList.ID	
	JOIN OriginList ON PassengerList.OriginID = OriginList.ID
WHERE Alive = 0 AND OriginName = 'Earth'		
