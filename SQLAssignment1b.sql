USE PassengerManifest  -- Calls the database to use for SQL select/join question
/*
Jag vill fr�n eran databas kunna st�lla f�ljande fr�gor: */

/* b. Utav dem som har omkommit, visa namn, d�dsorsak och datumet.	*/
SELECT 	CONCAT(FirstName,+ ' ' + LastName) AS 'Full Name', 
		StatusList.StatusType AS 'Cause of Death', 
		CAST(KilledDate AS DATE) AS 'Time Of Death'
FROM PassengerList
	JOIN StatusList ON PassengerList.StatusID = StatusList.ID
WHERE Alive = 0
