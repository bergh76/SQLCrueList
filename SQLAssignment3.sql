USE PassengerManifest  -- Calls the database to use for SQL select/join question
/*
Jag vill från eran databas kunna ställa följande frågor: */


/* 3. Gruppera alla baserat på dödsorsak.*/
	SELECT COUNT(*) AS 'Count List', StatusType AS 'Type Of Death'
	FROM PassengerList	
	LEFT JOIN StatusList ON PassengerList.StatusID = StatusList.ID
	WHERE Alive = 0
	GROUP BY StatusType 
