-- Insert Patients
INSERT INTO Patients
(FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber, Email) 
VALUES
('Jerry', 'Domnick', '1980-05-15', 'Male', 'sec-09,Bandra', '9555123400', 'jerry.dom@example.com'),
('Maria', 'Smith', '1995-01-20', 'Female', 'plot 12, Worli', '7722212340', 'maria.s@example.com'),
('Chandler', 'Bing', '1991-05-16', 'Male', 'Ambika Apartment, Vashi', '9555123412', 'bing.chand@example.com'),
('Rachel', 'Green', '1999-07-20', 'Female', 'Street 4, Dadar', '8142512340', 'green.rachel@example.com'),
('Ross', 'Geller', '1981-01-21', 'Male', 'plot -01, Marine lines', '9222567419', 'ross.g@example.com'),
('Joey', 'Tribbiani', '1999-05-06', 'Male', 'sec-09,Ghansoli', '8451052622', 'joey.t@example.com'),
('Sheldon', 'Copper', '1971-02-21', 'Male', 'Bunglow no 112,malabar hill', '8777123412', 'young.sheldon@example.com'),
('Penny', 'Wolowitz', '1982-11-02', 'Female', 'Bhoomi palace,Lower parel', '7742512331', 'penny.wol@example.com'),
('Harry', 'Potter', '1960-01-21', 'Male', 'under the Stairs, 4, Marine Lines', '8213123400', 'hp@example.com'),
('Ron', 'Weasley', '1960-09-17', 'Male', 'St Catchpolen, Bandra', '8858592320', 'ron.weasley@example.com');


-- Insert Doctors
INSERT INTO Doctors (FirstName, LastName, Specialty, PhoneNumber, Email)
VALUES ('Mrunal', 'Jadhav', 'Gynecologist', '8451052555', 'jadhavmrunal@example.com'),
('Vinay', 'Junghare', 'Cardiology', '9075791222', 'jungharevinay@example.com'),
('Onkar', 'Jadhav', 'General Physician', '9819410036', 'onspj@example.com'),
('Mira', 'Salunke', 'Pediatrician', '9082652166', 'msj@example.com');

-- Insert Appointments
INSERT INTO Appointments 
(PatientID, DoctorID, AppointmentDate, ReasonForVisit,Status)
VALUES 
(4, 1, '2020-10-01', 'Maternal healthcare','Completed'),
(3, 2, '2021-01-09', 'Routine Checkup','Completed'),
(5, 2, '2022-05-21', 'Diabetes','Completed'),
(1, 3, '2023-08-25', 'Fever','Completed'),
(7, 3, '2022-12-06', 'Stomach ache','Completed'),
(8, 4, '2022-06-12', 'Annual physical exams','Not-Completed'),
(8, 1, '2023-03-03', 'Irregular menstruation','Completed'),
(2, 1, '2023-11-09', 'Routine Checkup','Completed'),
(6, 2, '2023-12-11', 'High cholesterol','Completed'),
(10,3, '2024-07-19', 'Cough and Fever','Not-Completed'),
(7, 4, '2024-05-20', 'Nutritional advice','Not-Completed'),
(9, 2, '2024-08-03', 'Hypertension','Not-Completed');


-- Insert Billing
INSERT INTO Billing
(PatientID, AppointmentID, Amount, BillDate, Payment_Status)
VALUES
(4, 1,10000,'2020-10-01','Paid'),
(3, 2,10000,'2021-01-09','Paid'),
(5, 3, 2000,'2022-05-21','Pending'),
(1, 4, 1000,'2023-08-25', 'Paid'),
(7, 5, 500,'2022-12-06', 'Overdue'),
(8, 6,10000,'2022-06-12','Pending'),
(8, 7,2000,'2023-03-03','Paid'),
(2, 8, 5000,'2023-11-09','Paid'),
(6, 9, 3000,'2023-12-11','Overdue'),
(10,10, 1000,'2024-07-19','Paid'),
(7, 11, 6000,'2024-05-20','Pending'),
(9, 12, 7000,'2024-08-03','Pending');

select * from Patients;
select * from Doctors;
select * from Billing;




