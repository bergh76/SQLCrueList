USE PassengerManifest  -- Calls the database to use for SQL select/join question
/*
Jag vill från eran databas kunna ställa följande frågor: */

/* b. Utav dem som har omkommit, visa namn, dödsorsak och datumet.	*/
SELECT 	CONCAT(FirstName,+ ' ' + LastName) AS 'Full Name', 
		StatusList.StatusType AS 'Cause of Death', 
		CAST(KilledDate AS DATE) AS 'Time Of Death'
FROM PassengerList
	JOIN StatusList ON PassengerList.StatusID = StatusList.ID
WHERE Alive = 0
