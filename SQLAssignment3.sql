USE PassengerManifest  -- Calls the database to use for SQL select/join question
/*
Jag vill fr�n eran databas kunna st�lla f�ljande fr�gor: */


/* 3. Gruppera alla baserat p� d�dsorsak.*/
	SELECT COUNT(*) AS 'Count List', StatusType AS 'Type Of Death'
	FROM PassengerList	
	LEFT JOIN StatusList ON PassengerList.StatusID = StatusList.ID
	WHERE Alive = 0
	GROUP BY StatusType 
