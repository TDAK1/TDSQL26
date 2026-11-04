/*
Example lesson stub
*/
SELECT	PatientId,
		Hospital,
		Ward,
		AdmittedDate,
		DischargeDate,
		Tariff
FROM	PatientStay
--WHERE Hospital IN ('PRUH', 'KINGSTON')
--AND Ward IN ('DAY SURGERY', 'GENERAL SURGERY')
--WHERE Ward NOT LIKE '%s%'
WHERE	AdmittedDate BETWEEN '2024-02-27' AND '2024-03-01';