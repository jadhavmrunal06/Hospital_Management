-- Queries for Hospital Management

-- (Select/Fetch Record)
-- 1. Get the details of all the patients.
SELECT * FROM Patients;

-- 2. Get the list of all female patients.
SELECT PatientID, FirstName, LastName FROM Patients 
WHERE Gender = 'Female';

-- 3.Get all appointments for a specific patient
SELECT * FROM Appointments WHERE PatientID = 8;

-- (Insert Record)
-- 4. Insert a new patients record.
INSERT INTO Patients 
(FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber, Email) 
VALUES
('Monica','Bing','1971-09-12','Female','Central Park,USA','9876543210','Bingm@example.com');

-- 5. Insert a new Doctor record.
INSERT INTO Doctors (FirstName, LastName, Specialty, PhoneNumber, Email)
VALUES ('Santosh', 'Shinde', 'General Physician', '9594821465', 'shindes@example.com');

-- 6. Insert a new Appointment record.
INSERT INTO Appointments 
(PatientID, DoctorID, AppointmentDate, ReasonForVisit,Status)
VALUES 
(4, 1, '2024-08-27', 'Follow up','Not-Completed'),
(2, 1, '2024-08-12', 'Follow up','Completed');

-- (Update Data)
-- 7.Update an appointment status
UPDATE Appointments SET status = 'Completed' WHERE AppointmentID = 6;

-- 8. Update patient information
UPDATE Patients
SET PhoneNumber = '9977665544', Email = 'jerry.new@example.com'
WHERE PatientID = 1;

-- 9. Change the constraint of MedicalRecords table column Diagnosis to Varchar(50)
ALTER TABLE MedicalRecords
MODIFY Diagonsis VARCHAR(50);

-- 10. Remove Column Prescriptions from MedicalRecords table
ALTER TABLE MedicalRecords
DROP COLUMN Prescriptions;

-- 11. Rename Table MedicalRecords to MedRecords
ALTER TABLE MedicalRecords RENAME to MedRecords;

-- 12. Delete the table MedRecords
DROP TABLE MedRecords;

-- (Aggregate Functions)
-- 13.Count the total number of appointments
SELECT COUNT(*) AS TotalAppointments FROM Appointments;

-- (Subqueries)
-- 14. Find Patients with the Most Recent Appointment
SELECT PatientID, FirstName, LastName
FROM Patients
WHERE PatientID IN (
    SELECT PatientID
    FROM Appointments
    WHERE AppointmentDate = (SELECT MAX(AppointmentDate)
	FROM Appointments
    )
);

-- 15.Find doctors who have more than 3 appointments.
SELECT DoctorID, FirstName, LastName
FROM Doctors
WHERE DoctorID IN (
    SELECT DoctorID
    FROM Appointments
    GROUP BY DoctorID
    HAVING COUNT(AppointmentID) > 3
);
-- 16.Get patients who have had an appointment with doctor ID 1
SELECT PatientID, FirstName, LastName
FROM Patients
WHERE PatientID IN (SELECT PatientID FROM Appointments WHERE DoctorID = 1);

-- 17.Get patients who have had appointments with more than one doctor.
SELECT PatientID, FirstName, LastName
FROM Patients
WHERE PatientID IN 
(SELECT PatientID FROM Appointments GROUP BY PatientID 
HAVING COUNT(DISTINCT DoctorID) > 1
);

-- 18. Get the recent appointment date for each patient.
SELECT PatientID, MAX(AppointmentDate) AS MostRecentAppointment
FROM Appointments
GROUP BY PatientID;

-- 19.Get the count of appointments for each patient.
SELECT PatientID, COUNT(AppointmentID) AS NumberOfAppointments
FROM Appointments
GROUP BY PatientID;

-- 20. Get the count of patients seen by each doctor.
SELECT DoctorID, COUNT(DISTINCT PatientID) AS NumberOfPatients
FROM Appointments
GROUP BY DoctorID;

-- 21. Get the average number of appointments per doctor.
SELECT AVG(AppointmentCount) AS AverageAppointments
FROM (
    SELECT DoctorID, COUNT(AppointmentID) AS AppointmentCount
    FROM Appointments
    GROUP BY DoctorID
) AS DoctorAppointmentCounts;

-- 22. Get all patients who has diagnosed with "Hypertension".
SELECT * FROM Patients
WHERE PatientID IN (
    SELECT PatientID
    FROM Appointments
    WHERE ReasonForVisit = 'Hypertension'
);

-- (Join Queries)
-- 23.Get all appointments along with patient and doctor details.
SELECT a.AppointmentID, a.AppointmentDate, a.ReasonForVisit, a.Status,
       p.FirstName AS PatientFirstName, p.LastName AS PatientLastName,
       d.FirstName AS DrFirstName, d.LastName AS DrLastName
FROM Appointments a
INNER JOIN Patients p ON a.PatientID = p.PatientID
INNER JOIN Doctors d ON a.DoctorID = d.DoctorID;


-- 24.Find the total number of appointments for each patient.
SELECT p.PatientID, p.FirstName, p.LastName, COUNT(a.AppointmentID) AS total_appointments
FROM Patients p
LEFT JOIN Appointments a ON p.PatientID = a.PatientID
GROUP BY p.PatientID;

-- 25.Get a list of all patients along with their appointments if they have any.
-- Include patients who do not have any appointments
SELECT p.PatientID, p.FirstName, p.LastName, a.AppointmentDate, a.ReasonForVisit
FROM Patients p
LEFT JOIN Appointments a ON p.PatientID = a.PatientID;

-- 26.Get all appointments and their associated doctors. 
-- Include doctors who do not have any appointments.
SELECT a.AppointmentID, a.AppointmentDate, a.ReasonForVisit, 
d.FirstName AS Dr_First_Name, d.LastName AS Dr_Last_Name
FROM Appointments a
RIGHT JOIN Doctors d ON a.DoctorID = d.DoctorID;

-- 27. Get all records from Doctors Table and Appointment Table
-- Include doctors who do not have any appointments and patients who do not have any appointment.
SELECT p.PatientID, p.FirstName, p.LastName, a.AppointmentDate, a.ReasonForVisit
FROM Patients p
LEFT JOIN Appointments a ON p.PatientID = a.PatientID
UNION
SELECT a.AppointmentID, a.AppointmentDate, a.ReasonForVisit, 
d.FirstName AS Dr_First_Name, d.LastName AS Dr_Last_Name
FROM Appointments a
RIGHT JOIN Doctors d ON a.DoctorID = d.DoctorID;

-- (Views)
-- 28.Create a view that shows each doctor and the total number of appointments they have.
CREATE VIEW DoctorAppointmentCounts AS
SELECT d.DoctorID, d.FirstName AS Doctor_First_Name, d.LastName AS Doctor_Last_Name, 
       COUNT(a.AppointmentID) AS Total_Appointments
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID;

SELECT * FROM DoctorAppointmentCounts;

-- 29. Create a view to show patient billing details including their total amount billed.
CREATE VIEW PatientBilling AS
SELECT p.PatientID, p.FirstName AS Patient_First_Name, p.LastName AS Patient_Last_Name,
       SUM(b.Amount) AS Total_Bill
FROM Patients p
LEFT JOIN Billing b ON p.PatientID = b.PatientID
GROUP BY p.PatientID;

SELECT * FROM PatientBilling;

-- (Store Procedure)
-- 30. This procedure will insert a new billing record into the Billing table.
CALL AddNewBill(2, 14, 2000,'2024-08-12','Paid');


