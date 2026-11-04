SELECT   c.CustomerId,
         c.FirstName || ' ' || c.LastName AS CustomerFullName,
         c.City,
         COALESCE (e.FirstName || ' ' || e.LastName, 'No Support Rep') AS SupportRepFullName,
         COALESCE (SUM(i.Total), 0) AS InvoiceTotal
FROM     Customer AS c
         LEFT OUTER JOIN
         Employee AS e
         ON e.EmployeeId = c.SupportRepId
         LEFT OUTER JOIN
         Invoice AS i
         ON i.CustomerId = c.CustomerId
WHERE    c.City IN ('London', 'Paris')
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.City, e.FirstName, e.LastName;