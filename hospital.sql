-- //creating and inserting data and constraints in table using  sql for Hospital Management System
-- //All employees in hospital.
CREATE TABLE EMPLOYEES (
id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50),
  middle_name VARCHAR2(50),
  last_name VARCHAR2(50),
  dateofbirth DATE,
  joining_date DATE,
  salary NUMBER,
  experience NUMBER,
  age NUMBER,
  qualification VARCHAR2(50)
);
INSERT INTO EMPLOYEES (id, first_name, middle_name, last_name, dateofbirth, joining_date, salary, experience, age, qualification)
VALUES (1, 'vishal', 'sundar', 'kaira', TO_DATE('1985-02-12', 'YYYY-MM-DD'), TO_DATE('2010-05-10', 'YYYY-MM-DD'), 90000, 12, 38, 'Doctor of Medicine');
INSERT INTO EMPLOYEES (id, first_name, middle_name, last_name, dateofbirth, joining_date, salary, experience, age, qualification)
VALUES (2, 'nidhi', 'sandeep', 'kadam', TO_DATE('1985-02-12', 'YYYY-MM-DD'), TO_DATE('2010-05-10', 'YYYY-MM-DD'), 90000, 12, 38, 'mbbs');
INSERT INTO EMPLOYEES (id, first_name, middle_name, last_name, dateofbirth, joining_date, salary, experience, age, qualification)
VALUES (3, 'nikshita', 'jaya', 'karkera', TO_DATE('1985-02-12', 'YYYY-MM-DD'), TO_DATE('2010-05-10', 'YYYY-MM-DD'), 90000, 12, 38, 'dentist');
INSERT INTO EMPLOYEES (id, first_name, middle_name, last_name, dateofbirth, joining_date, salary, experience, age, qualification)
VALUES(4, 'rishi', 'narendra', 'kewalya', TO_DATE('1985-02-12', 'YYYY-MM-DD'), TO_DATE('2010-05-10', 'YYYY-MM-DD'), 90000, 12, 38, 'surgeon');
INSERT INTO EMPLOYEES (id, first_name, middle_name, last_name, dateofbirth, joining_date, salary, experience, age, qualification)
VALUES (5, 'amolak', 'singh', 'kalsi', TO_DATE('1985-02-12', 'YYYY-MM-DD'), TO_DATE('2010-05-10', 'YYYY-MM-DD'), 90000, 12, 38, 'heartexpert');
SELECT * FROM EMPLOYEES;
-- //Different departments in hospital
CREATE TABLE DEPARTMENT (
  department_id NUMBER(10)  PRIMARY KEY,
  department_name VARCHAR2(100) NOT NULL
);
INSERT INTO DEPARTMENT (department_id, department_name)
VALUES (1, 'Cardiology');

INSERT INTO DEPARTMENT (department_id, department_name)
VALUES (2, 'Neurology');

INSERT INTO DEPARTMENT (department_id, department_name)
VALUES (3, 'Orthopedics');

INSERT INTO DEPARTMENT (department_id, department_name)
VALUES (4, 'Oncology');

INSERT INTO DEPARTMENT (department_id, department_name)
VALUES (5, 'Pediatrics');
select * from DEPARTMENT
-- //Doctors role and id in hospital.
CREATE TABLE DOCTOR (
  doctor_id VARCHAR2(50) PRIMARY KEY,
  department_id NUMBER(10) NOT NULL,
  id NUMBER(10) NOT NULL,
  qualification VARCHAR2(100) NOT NULL,
  CONSTRAINT fk_dept_id FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id),
  CONSTRAINT fk_emp_id FOREIGN KEY (id) REFERENCES EMPLOYEES(id)
);
INSERT INTO DOCTOR (doctor_id, department_id, id, qualification)
VALUES ('D001', 1, 1, 'Doctor of Medicine');

INSERT INTO DOCTOR (doctor_id, department_id, id, qualification)
VALUES ('D002', 2, 2, 'Doctor of Osteopathic Medicine');

INSERT INTO DOCTOR (doctor_id, department_id, id, qualification)
VALUES ('D003', 3, 3, 'Doctor of Medicine');

INSERT INTO DOCTOR (doctor_id, department_id, id, qualification)
VALUES ('D004', 1, 4, 'Doctor of Medicine');

INSERT INTO DOCTOR (doctor_id, department_id, id, qualification)
VALUES ('D005', 2, 5, 'Doctor of Osteopathic Medicine');
select * from DOCTOR

-- //Patients in hospital
CREATE TABLE PATIENT (
  patient_id NUMBER(10) NOT NULL PRIMARY KEY,
  first_name VARCHAR2(50) NOT NULL,
  middle_name VARCHAR2(50),
  last_name VARCHAR2(50) NOT NULL,
  roomno VARCHAR2(10),
  dateofbirth DATE,
  doctor_id VARCHAR2(50) NOT NULL,
  CONSTRAINT fk_doc_id FOREIGN KEY (doctor_id) REFERENCES DOCTOR(doctor_id)
);
INSERT INTO PATIENT (patient_id, first_name, middle_name, last_name, roomno, dateofbirth, doctor_id)
VALUES (1, 'John', 'A', 'Doe', '101', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'D001');

INSERT INTO PATIENT (patient_id, first_name, middle_name, last_name, roomno, dateofbirth, doctor_id)
VALUES (2, 'Alice', 'B', 'Smith', '201', TO_DATE('1985-08-20', 'YYYY-MM-DD'), 'D002');

INSERT INTO PATIENT (patient_id, first_name, middle_name, last_name, roomno, dateofbirth, doctor_id)
VALUES (3, 'Michael', 'C', 'Johnson', '301', TO_DATE('1995-03-10', 'YYYY-MM-DD'), 'D003');

INSERT INTO PATIENT (patient_id, first_name, middle_name, last_name, roomno, dateofbirth, doctor_id)
VALUES (4, 'Emma', NULL, 'Davis', '102', TO_DATE('2000-01-01', 'YYYY-MM-DD'), 'D004');

INSERT INTO PATIENT (patient_id, first_name, middle_name, last_name, roomno, dateofbirth, doctor_id)
VALUES (5, 'William', 'E', 'Brown', '202', TO_DATE('1978-11-30', 'YYYY-MM-DD'), 'D005');
-- medical records of patients
CREATE TABLE MEDICALRECORDS (
  record_id NUMBER(10) PRIMARY KEY,
  mediclaim VARCHAR2(100),
  medicine VARCHAR2(100),
  patient_id NUMBER(10),
  CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id)
);
INSERT INTO MEDICALRECORDS (record_id, mediclaim, medicine, patient_id) VALUES (1, 'Yes', 'Paracetamol', 1);

INSERT INTO MEDICALRECORDS (record_id, mediclaim, medicine, patient_id) VALUES (2, 'No', 'Aspirin', 2);

INSERT INTO MEDICALRECORDS (record_id, mediclaim, medicine, patient_id) VALUES (3, 'Yes', 'Amoxicillin', 3);

INSERT INTO MEDICALRECORDS (record_id, mediclaim, medicine, patient_id) VALUES (4, 'No', 'Ibuprofen', 4);

INSERT INTO MEDICALRECORDS (record_id, mediclaim, medicine, patient_id) VALUES (5, 'Yes', 'Penicillin', 5);
select * from MEDICALRECORDS
-- Nurse in hospital.
CREATE TABLE NURSE (
  id NUMBER(10) NOT NULL,
  qualification VARCHAR2(100) NOT NULL,
  CONSTRAINT fk_emp2_id FOREIGN KEY (id) REFERENCES EMPLOYEESS(id)
);
INSERT INTO NURSE (id, qualification) VALUES (3, 'Registered Nurse');
INSERT INTO NURSE (id, qualification) VALUES (2, 'Licensed Practical Nurse');
INSERT INTO NURSE (id, qualification) VALUES (1, 'Certified Nursing Assistant');
INSERT INTO NURSE (id, qualification) VALUES (5, 'Advanced Practice Registered Nurse');
INSERT INTO NURSE (id, qualification) VALUES (4, 'Clinical Nurse Specialist');

desc NURSE
-- //Patients in Critical Condition in hospital.
CREATE TABLE CRITICAL (
  name VARCHAR2(100) NOT NULL,
  phoneno VARCHAR2(20) PRIMARY KEY,
  address VARCHAR2(200) NOT NULL,
  dateofadmit DATE NOT NULL,
  patient_id NUMBER(10) NOT NULL,
  CONSTRAINT fk_patient2_id FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id)
);
INSERT INTO CRITICAL (name, phoneno, address, dateofadmit, patient_id)
VALUES ('John Smith', '1234567890', '123 Main St', '2022-01-01', 1);

INSERT INTO CRITICAL (name, phoneno, address, dateofadmit, patient_id)
VALUES ('Jane Doe', '0987654321', '456 Elm St', '2022-02-01', 2);

INSERT INTO CRITICAL (name, phoneno, address, dateofadmit, patient_id)
VALUES ('Bob Johnson', '5551234567', '789 Oak St', '2022-03-01', 3);

INSERT INTO CRITICAL (name, phoneno, address, dateofadmit, patient_id)
VALUES ('Sarah Williams', '4449876543', '321 Pine St', '2022-04-01', 4);

INSERT INTO CRITICAL (name, phoneno, address, dateofadmit, patient_id)
VALUES ('Tom Brown', '7771112222', '654 Maple St', '2022-05-01', 5);

desc CRITICAL
-- //patients in normal condition in hospital
CREATE TABLE NORMAL (
  name VARCHAR2(100) NOT NULL,
  phoneno VARCHAR2(20) PRIMARY KEY,
  address VARCHAR2(200) NOT NULL,
  dateofadmit DATE NOT NULL,
  patient_id NUMBER(10) NOT NULL,
  CONSTRAINT fk_patient3_id FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id)
);
INSERT INTO NORMAL (name, phoneno, address, dateofadmit, patient_id) 
VALUES ('John Smith', '555-1234', '123 Main St, Anytown, USA', TO_DATE('2022-02-15', 'YYYY-MM-DD'), 1234567890);

INSERT INTO NORMAL (name, phoneno, address, dateofadmit, patient_id) 
VALUES ('Jane Doe', '555-5678', '456 Elm St, Anytown, USA', TO_DATE('2022-03-01', 'YYYY-MM-DD'), 2345678901);

INSERT INTO NORMAL (name, phoneno, address, dateofadmit, patient_id) 
VALUES ('Bob Johnson', '555-9876', '789 Oak St, Anytown, USA', TO_DATE('2022-02-28', 'YYYY-MM-DD'), 3456789012);

INSERT INTO NORMAL (name, phoneno, address, dateofadmit, patient_id) 
VALUES ('Mary Brown', '555-4321', '321 Pine St, Anytown, USA', TO_DATE('2022-02-20', 'YYYY-MM-DD'), 4567890123);

INSERT INTO NORMAL (name, phoneno, address, dateofadmit, patient_id) 
VALUES ('Tom Wilson', '555-8765', '654 Maple St, Anytown, USA', TO_DATE('2022-03-10', 'YYYY-MM-DD'), 5678901234);

desc NORMAL
