/*
Example lesson stub
*/
-- Show patient stay details and calculate follow-up, reminder, and stay length.
-- Limit admissions to the specified dates and order by tariff and patient ID.
SELECT		PatientId,
			Hospital,
			Ward,
			AdmittedDate,
			DischargeDate,
			DATEADD(MONTH, 3, DischargeDate) AS followupdate,
			DATEADD(WEEK, -2, AdmittedDate) AS reminderdate,
			DATEDIFF(DAY, AdmittedDate, DischargeDate) AS lenthofSTAY,
			Tariff
FROM		PatientStay
--WHERE Hospital IN ('PRUH', 'KINGSTON')
--AND Ward IN ('DAY SURGERY', 'GENERAL SURGERY')
--WHERE Ward NOT LIKE '%s%'
WHERE		AdmittedDate BETWEEN '2024-02-27' AND '2024-03-01'
ORDER BY	Tariff DESC, PatientId DESC;

-- Combine the two text values into a greeting.
-- Return the concatenated text as a single result.
SELECT	CONCAT('Hello', 'Thaonga');

-- Add three months to the supplied date.
-- Return the calculated date as a single result.
SELECT	DATEADD(MONTH, 3, '2026-11-04');

-- Aggregate patient counts and tariff statistics for each hospital and ward.
-- Group the results by both location fields.
SELECT		Hospital,
			Ward,
			COUNT(*) AS NUMBERofPATIENTS,
			sum(Tariff) AS TotalTariff,
			MAX(Tariff) AS MostExpensiveTariff,
			MIN(Tariff) AS LeastExpensiveTariff,
			AVG(Tariff) AS AverageTariff
FROM		PatientStay
GROUP BY	Hospital, Ward;

-- Find stays at either selected hospital with a tariff of at least five.
-- Demonstrate combining OR and AND conditions.
SELECT	*
FROM	PatientStay
WHERE	(Hospital = 'Oxleas'
		OR Hospital = 'PRUH')
		AND Tariff >= 5;

-- Calculate daily tariff for stays admitted within the specified date range.
-- Use an exclusive upper date bound to include all times on the start date.
SELECT	Hospital,
		PatientId,
		DischargeDate,
		Tariff / DATEDIFF(DAY, AdmittedDate, DischargeDate) AS DailyTariff
FROM	PatientStay
WHERE	AdmittedDate >= '2024-02-26'
		AND AdmittedDate < '2024-03-01';