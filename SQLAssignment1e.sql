USE PassengerManifest  -- Calls the database to use for SQL select/join question
/*
Jag vill från eran databas kunna ställa följande frågor: */

	/*	e. Alla döda med namn och mellan två datum. */
	SELECT CONCAT(FirstName, +' ' + LastName) AS 'Full Name', KilledDate AS 'Time Of Death'
	FROM PassengerList
	WHERE Alive = 0 AND KilledDate BETWEEN '2109-04-06 04:45:19' AND '2109-04-08 17:32:45'
	ORDER BY KilledDate ASC