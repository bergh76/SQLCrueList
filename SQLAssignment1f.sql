USE PassengerManifest  -- Calls the database to use for SQL select/join question
/*
Jag vill fr�n eran databas kunna st�lla f�ljande fr�gor: */

/* 	f. Visa antal av olika rang.*/
SELECT COUNT(*) AS 'Count List', RankType AS 'Rank'
FROM PassengerList	
	LEFT JOIN RankList ON PassengerList.RankID = RankList.ID
GROUP BY RankType 