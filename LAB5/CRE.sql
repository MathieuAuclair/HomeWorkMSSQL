USE master;
GO
DECLARE @kill VARCHAR(8000);
SET @kill = '';
SELECT @kill = @kill + 'kill ' + CONVERT(VARCHAR(5), spid) + ';'
FROM master..sysprocesses
WHERE dbid = db_id('LAB6')
EXEC (@kill);
GO
IF EXISTS(SELECT *
          FROM sys.databases
          WHERE name = 'LAB6')
  DROP DATABASE LAB6
GO
CREATE DATABASE LAB6
GO
USE LAB6
GO
IF OBJECT_ID('dbo.COURS', 'U') IS NOT NULL
  BEGIN
    DBCC CHECKIDENT ('COURS', RESEED, 1);
    DROP TABLE COURS;
  END
GO
CREATE TABLE COURS (
  id        INT         NOT NULL     IDENTITY (1, 1),
  code      VARCHAR(10) NULL,
  titre     VARCHAR(50) NULL,
  duree     TINYINT     NULL,
  programme XML         NULL,
  PRIMARY KEY (id)
)
GO
IF OBJECT_ID('dbo.MACHINE', 'U') IS NOT NULL
  BEGIN
    DBCC CHECKIDENT ('MACHINE', RESEED, 1);
    DROP TABLE MACHINE;
  END
GO
CREATE TABLE MACHINE (
  id           INT         NOT NULL   IDENTITY (1, 1),
  libelle      VARCHAR(50) NOT NULL,
  processeur   VARCHAR(50) NOT NULL,
  memoire      INT         NOT NULL CHECK (memoire > 0),
  disque       INT         NOT NULL CHECK (disque > 0),
  taille_ecran INT         NOT NULL CHECK (taille_ecran > 0),
  PRIMARY KEY (id),
)
GO
IF OBJECT_ID('dbo.SALLE', 'U') IS NOT NULL
  BEGIN
    DBCC CHECKIDENT ('SALLE', RESEED, 1);
    DROP TABLE SALLE;
  END
GO
CREATE TABLE SALLE (
  id       INT         NOT NULL   IDENTITY (1, 1),
  libelle  VARCHAR(50) NOT NULL,
  machine  INT         NOT NULL,
  capacite INT         NOT NULL,
  PRIMARY KEY (id)
)
GO
IF OBJECT_ID('dbo.COURS_MACHINE', 'U') IS NOT NULL
  BEGIN
    DBCC CHECKIDENT ('COURS_MACHINE', RESEED, 1);
    DROP TABLE COURS_MACHINE;
  END
GO
CREATE TABLE COURS_MACHINE (
  id      INT NOT NULL      IDENTITY (1, 1),
  cours   INT NOT NULL,
  machine INT NOT NULL,
  PRIMARY KEY (id)
)
GO
IF OBJECT_ID('dbo.FORMATION', 'U') IS NOT NULL
  BEGIN
    DBCC CHECKIDENT ('FORMATION', RESEED, 1);
    DROP TABLE FORMATION;
  END
GO
CREATE TABLE FORMATION (
  id      INT         NOT NULL      IDENTITY (1, 1),
  libelle VARCHAR(50) NULL,
  cours   INT         NOT NULL,
  salle   INT         NOT NULL,
  debut   DATE        NOT NULL,
  fin     DATE        NOT NULL,
  PRIMARY KEY (id)
)
GO
/*
  * LOG FILES
  *
*/
USE master
GO
IF EXISTS(SELECT *
          FROM sys.databases
          WHERE name = 'GestSalles')
  DROP DATABASE GestSalles
GO
USE master;
GO
CREATE DATABASE GestSalles
ON
  (NAME = gestsalles_dat,
    --CHANGE THE PATH FOR WINDOW THIS FOLDER IS ON DOCKER WITH PERM 777--
  FILENAME = '/LAB/LAB5/gestsalles_ppal.mdf',
  SIZE = 20,
  MAXSIZE = 50,
  FILEGROWTH = 5)
LOG ON
  (NAME = gestsalles_log,
  FILENAME = '/LAB/LAB5/gestsalles_log.ldf',
  SIZE = 5 MB,
  MAXSIZE = 20 MB,
  FILEGROWTH = 2 MB);
GO
