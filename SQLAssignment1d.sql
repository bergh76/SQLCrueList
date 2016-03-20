USE PassengerManifest
/*
Jag vill fr�n eran databas kunna st�lla f�ljande fr�gor: */

/* d. Alla d�da fr�n en viss planet.*/
SELECT FirstName, LastName,
	OriginList.OriginName AS 'Planet', 
	StatusList.StatusType AS 'Status'
FROM PassengerList 
	JOIN StatusList ON PassengerList.StatusID = StatusList.ID	
	JOIN OriginList ON PassengerList.OriginID = OriginList.ID
WHERE Alive = 0 AND OriginName = 'Earth'		
