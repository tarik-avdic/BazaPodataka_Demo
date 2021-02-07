CREATE DATABASE BolnicaDemo
USE BolnicaDemo
GO
CREATE TABLE Pacijent(
Br_Zdravstvenog_Kartona nvarchar(50) PRIMARY KEY,
Ime_pacijenta varchar(100) NOT NULL,
Prezime_pacijenta varchar(100) NOT NULL,
Godiste_pacijenta datetime NULL,
)
CREATE TABLE Adresa_pacijenta(
ID_adresa int PRIMARY KEY identity(1,1),
Br_Zdravstvenog_Kartona nvarchar(50) FOREIGN KEY REFERENCES Pacijent(Br_Zdravstvenog_Kartona),
Postanski_broj int NOT NULL  ,
Grad varchar(100) NOT NULL,
Ulica varchar(100) NOT NULL,
Br_ulice int NOT NULL,
)
CREATE TABLE Dijagnoza(
Id_Bolest int  NOT NULL PRIMARY KEY identity(1,1),
Br_Zdravstvenog_Kartona nvarchar(50) NOT NULL FOREIGN KEY REFERENCES Pacijent(Br_Zdravstvenog_Kartona),
Naziv_bolesti varchar(100) NOT NULL,
)
CREATE TABLE Terapija(
Id_Terapija int NOT NULL PRIMARY KEY ,
Br_Zdravstvenog_Kartona nvarchar(50) NOT NULL FOREIGN KEY REFERENCES Pacijent(Br_Zdravstvenog_Kartona),
Id_bolest int NOT NULL FOREIGN KEY REFERENCES Dijagnoza(Id_bolest),
Vrsta_terapije varchar(100) NOT NULL,
)
CREATE TABLE Doktor(
Id_doktor int NOT NULL PRIMARY KEY Identity(1,1),
Ime_Doktora varchar(100) NOT NULL,
Prezime_Doktora varchar(100) NOT NULL,
)
CREATE TABLE Specijalizacija(
Id_specijalizacija int PRIMARY KEY Identity(1,1),
Id_doktor  int NOT NULL FOREIGN KEY  REFERENCES Doktor(Id_doktor),
Specijalnost varchar(100),
)
CREATE TABLE Med_Osoblje(
Id_Med_osoblja int PRIMARY KEY identity(1,1),
Ime_Osoblja varchar(100) NOT NULL,
Prezime_Osoblja varchar(100) NOT NULL,
)
CREATE TABLE Odjeljenje (
Id_odjeljenja int PRIMARY KEY identity(1,1),
Id_doktor int NOT NULL FOREIGN KEY REFERENCES Doktor(Id_doktor),
Id_Med_osoblja int NOT NULL FOREIGN KEY REFERENCES Med_Osoblje(Id_Med_osoblja),
Ime_odjeljenja varchar(100) NOT NULL,
)
CREATE TABLE Br_telefona (
Id_Broj_tel int PRIMARY KEY identity(1,1),
Id_odjeljenja int FOREIGN KEY REFERENCES Odjeljenje(Id_odjeljenja),
Br_telefona nvarchar(50) NULL,
)
INSERT INTO Pacijent(Br_Zdravstvenog_Kartona,Ime_Pacijenta,Prezime_Pacijenta,Godiste_pacijenta)
VALUES 
('123','Husein','Huseinovic','1968-2-1'),
('234','Mujo','Mujic','1958-4-3'),
('345','Fikret','Hodzic','1978-6-5'),
('456','Fazla','Fazlic','1965-8-7'),
('567','Rusmir','Rule','1987-10-9')

INSERT INTO Pacijent(Br_Zdravstvenog_Kartona,Ime_Pacijenta,Prezime_Pacijenta)
VALUES('678','Avdo','Semiragic')


SELECT*FROM Pacijent

INSERT INTO Adresa_Pacijenta(Br_Zdravstvenog_Kartona,Postanski_broj,Grad,Ulica,Br_ulice)
VALUES
('123',71000,'Sarajevo','Grbavicka',6),
('234',72000,'Zenica','Zenicka',9),
('345',73000,'Gorazde','Omladinska',15),
('456',74000,'Doboj','Dobojska',56),
('567',88000,'Mostar','Spanski trg',45)

SELECT*FROM Adresa_Pacijenta


INSERT INTO Dijagnoza(Br_Zdravstvenog_Kartona,Naziv_bolesti)
VALUES
('123','Karcinom'),
('234','COVID19'),
('345','Tuberkuloza'),
('456','Depresija'),
('567','Dijabetes'),
('678','COVID20')

SELECT*FROM Dijagnoza



INSERT INTO Terapija(Id_Terapija,Br_Zdravstvenog_Kartona,Id_bolest,Vrsta_terapije)
VALUES
(1,'123',1,'Kemoterapija'),
(2,'234',2,'Vakcinisanje'),
(3,'345',3,'Antituberkuolitici'),
(4,'456',4,'Tablete'),
(5,'567',5,'Inzulin'),
(6,'678',6,'Vakcinisanje')


SELECT*FROM Terapija


INSERT INTO Doktor(Ime_Doktora,Prezime_Doktora)
VALUES
('Amel','Krasic'),
('Tarik','Avdic'),
('Aid','Obradovic'),
('Nedim','Avdovic'),
('Nedim','Krasic')

SELECT*FROM Doktor


INSERT INTO Specijalizacija(Id_doktor,Specijalnost)
VALUES
(1,'Kiroprakticar'),
(2,'Anesteziolog'),
(3,'Kardiolog'),
(4,'Oftamolog'),
(5,'Opsta praksa')

SELECT*FROM Specijalizacija


INSERT INTO Med_Osoblje(Ime_Osoblja,Prezime_Osoblja)
VALUES
('Haso','Hasic'),
('Munib','Munibovic'),
('Semir','Semirovic')

SELECT*FROM Med_Osoblje

INSERT INTO Odjeljenje(Id_doktor,Id_Med_osoblja,Ime_odjeljenja)
VALUES
(1,1,'Kiropraktika'),
(2,2,'Anesteziologija'),
(3,3,'Kardiologija'),
(4,3,'Oftamologija'),
(5,3,'Ambulanta')

SELECT*FROM Odjeljenje


INSERT INTO Br_telefona(Id_odjeljenja,Br_telefona)
VALUES
(9,'033-111-222'),
(6,'033-333-444'),
(7,'033-555-666'),
(8,'033-777-888'),
(7,'033-444-222'),
(10,'033-666-111')

SELECT*FROM Br_telefona

CREATE VIEW vwTerapije
AS
SELECT Vrsta_Terapije
FROM Terapija WHERE Br_Zdravstvenog_Kartona<300

SELECT*FROM vwTerapije

CREATE VIEW Pacijenti2
AS
SELECT Br_Zdravstvenog_Kartona, Postanski_broj, Grad
FROM Adresa_Pacijenta WHERE  Br_Zdravstvenog_Kartona BETWEEN 100 AND 300

SELECT*FROM Pacijenti2

CREATE VIEW Pacijenti3
AS
SELECT Br_Zdravstvenog_Kartona, Postanski_broj, Grad
FROM Adresa_Pacijenta WHERE Br_Zdravstvenog_Kartona BETWEEN 100 AND 200

SELECT*FROM Pacijenti3
