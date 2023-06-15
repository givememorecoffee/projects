USE safety;

SELECT Division, SUM(Headcount) AS Total_Headcount
FROM locations
WHERE Division = "KJ";

SELECT Location_ID, MAX(STR_TO_DATE(Audit_Date, "%m/%d/%Y")) AS recent_date
FROM audits
WHERE Location_ID = 2415;

SELECT Location_ID, MAX(STR_TO_DATE(Audit_Date, "%m/%d/%Y")) AS recent_date
FROM audits
WHERE Location_ID = 2415;

SELECT COUNT(Auditor) AS auditor_ain
FROM audits
WHERE Auditor LIKE ("%ain%");

SELECT COUNT(Audit_Date) AS total_audits, Auditor
FROM audits
GROUP BY Auditor;

SELECT COUNT(Auditor) AS no_correctiveaction
FROM audits
WHERE Corrective_Action IS NULL;

SELECT Location_ID, COUNT(Incident_ID) AS incident_number
FROM nmi
GROUP BY Location_ID
HAVING COUNT(Incident_ID) > 110;

SELECT Location_ID, COUNT(Incident_ID) AS incident_number_lti
FROM lti
GROUP BY Location_ID
HAVING Location_ID REGEXP "^[2,3]";

SELECT Location_ID, Headcount
FROM locations
WHERE Headcount > (SELECT AVG(Headcount) FROM locations);

SELECT lo.Location_ID, Headcount, Division, COUNT(Incident_ID) AS LTI, COUNT(Incident_ID)/Headcount AS LTI_Percent
FROM locations AS lo JOIN lti
ON lo.Location_ID = lti.Location_ID
GROUP BY lo.Location_ID, Headcount, Division
HAVING COUNT(Incident_ID)/Headcount > 0.2;

SELECT lo.Location_ID, Headcount, Division, COUNT(Incident_ID) AS NMI, COUNT(Incident_ID)/Headcount AS NMI_Percent
FROM locations AS lo JOIN nmi
ON lo.Location_ID = nmi.Location_ID
GROUP BY lo.Location_ID, Headcount, Division
HAVING Division = "PK";