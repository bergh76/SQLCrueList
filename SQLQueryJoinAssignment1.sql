USE PassengerManifest  -- Calls the database to use for SQL select/join question

SELECT 
	FirstName, LastName, Alias, Gender, Age, -- Columnnames from PasserngerList
	RankList.RankType, 
	DepartmentList.DepartmentName, 
	RankList.Salary, 
	OriginList.OriginName, 
	StatusList.StatusType

  FROM 
	PassengerList -- The data tabel

-- Joins tabel RankList, DepartmentList, OriginList and StatusList with PassengerList
  JOIN 
	RankList 
	ON PassengerList.RankID = RankList.RankID 
  JOIN 
	DepartmentList 
	ON PassengerList.DepartmentID = DepartmentList.DepartmentID
  JOIN 
	OriginList 
	ON PassengerList.OriginID = OriginList.OriginID
  JOIN 
	StatusList 
	ON PassengerList.StatusID = StatusList.StatusID
  
  ORDER BY -- Sortorder by Status Ascending and then by RankType Ascending
	StatusList.StatusType, RankList.RankType 
	ASC

