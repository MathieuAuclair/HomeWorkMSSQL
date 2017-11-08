USE LAB6
GO
DBCC CHECKIDENT ('MACHINE', RESEED, 1);
GO
INSERT INTO MACHINE
VALUES ('860', 'Core i5', 8, 300, 15),
  ('890', 'Core i5', 8, 300, 15),
  ('960', 'Core i5', 16, 500, 17),
  ('980', 'Core i7', 16, 500, 17),
  ('990', 'Core i7', 16, 1000, 20)
GO
DBCC CHECKIDENT ('COURS', RESEED, 1);
GO
INSERT INTO COURS
VALUES ('T221-10775', 'Administration de bases de données SQL Server', 5, NULL),
  ('T120-10967', 'Les fondamentaux d’une infrastructure Windows', 5, NULL),
  ('T115-020', 'Linux/Unix : utilisation en mode commande', 4, NULL),
  ('T120-10970', 'Mise en réseau avec Windows Server', 5, NULL),
  ('T127-VS501', 'VMware vSphere 5.1', 4, NULL),
  ('T325-20341', 'Principales solutions de Microsoft Exchange Server', 5, NULL),
  ('T420-020', 'Modélisation et conception UML', 4, NULL),
  ('T461-20483', 'Programmer en C#', 5, NULL),
  ('T461-20486', 'Développer des applications Web ASP.NET MVC 4', 5, NULL)
GO
DBCC CHECKIDENT ('SALLE', RESEED, 1);
GO
INSERT INTO SALLE
VALUES ('Loire', 1, 10),
  ('Seine', 4, 10),
  ('Rhône', 2, 12),
  ('Garonne', 4, 12),
  ('Gironde', 1, 8),
  ('Tarn', 3, 20),
  ('Rhin', 5, 10),
  ('Meuse', 3, 12),
  ('Saône', 4, 15),
  ('Ardèche', 5, 8)
GO
DBCC CHECKIDENT ('COURS_MACHINE', RESEED, 1);
GO
INSERT INTO COURS_MACHINE
VALUES (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (1, 5),
  (2, 1),
  (2, 2),
  (2, 3),
  (2, 4),
  (2, 5),
  (3, 3),
  (3, 4),
  (3, 5),
  (4, 1),
  (4, 2),
  (4, 3),
  (4, 4),
  (4, 5),
  (5, 3),
  (5, 4),
  (5, 5),
  (6, 4),
  (6, 5),
  (7, 4),
  (7, 5),
  (8, 1),
  (8, 2),
  (8, 3),
  (8, 4),
  (8, 5),
  (9, 5),
  (9, 5)
GO
DBCC CHECKIDENT ('FORMATION', RESEED, 1);
GO
INSERT INTO FORMATION
VALUES
  (null, 3, 7, '2016-06-16', '2016-06-05'),
  (null, 3, 7, '2016-06-16', '2016-06-05'),
  (NULL, 4, 1, '2016-04-28', '2016-05-02'),
  (NULL, 2, 2, '2016-06-02', '2016-06-06'),
  (NULL, 8, 1, '2016-06-02', '2016-06-05'),
  (NULL, 3, 7, '2016-06-16', '2016-06-20'),
  (NULL, 8, 2, '2016-07-15', '2016-07-18'),
  (NULL, 7, 4, '2016-07-07', '2016-07-11'),
  (NULL, 5, 8, '2016-08-25', '2016-08-29'),
  (NULL, 1, 5, '2016-06-02', '2016-06-04'),
  (NULL, 6, 7, '2016-09-01', '2016-09-04'),
  (NULL, 9, 10, '2016-09-01', '2016-09-05')
GO


