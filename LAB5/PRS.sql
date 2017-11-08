USE LAB6
GO
IF EXISTS
(SELECT *
 FROM dbo.sysobjects
 WHERE id = object_id(N'dbo.pVerificationSalles')
       AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE dbo.pVerificationSalles
GO
CREATE PROCEDURE dbo.pVerificationSalles(@date DATE)
AS
  BEGIN
    DECLARE @formation INT;
    DECLARE @libelle NVARCHAR(50);
    DECLARE cursorSalle CURSOR FOR
      SELECT id
      FROM SALLE
      WHERE @formation = id
    OPEN cursorSalle
    FETCH cursorSalle
    INTO @formation
    WHILE @@Fetch_Status = 0
      IF (@@Fetch_Status != 0)
        PRINT 'FETCH STATUS IS NOT EQUAL 0'
      ELSE
        BEGIN
          SELECT
            salle.id,
            COUNT(*)
          FROM SALLE salle
            INNER JOIN FORMATION f
              ON f.salle = salle.id
          WHERE @formation = f.id AND @libelle = salle.libelle
          GROUP BY salle.id
          HAVING COUNT(*) > 1

          PRINT 'La salle ' + @libelle + ' contient plus qu une formation à cette date'

          FETCH cursorSalle
          INTO @formation;
        END
    CLOSE cursorSalle
    DEALLOCATE cursorSalle
  END
GO
EXEC pVerificationSalles @date = '2016-06-05';
GO
IF EXISTS
(SELECT *
 FROM dbo.sysobjects
 WHERE id = object_id(N'dbo.pDispoSalles')
       AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
  DROP PROCEDURE dbo.pDispoSalles
GO
CREATE PROCEDURE dbo.pDispoSalles(@date DATE)
AS
  BEGIN
    SELECT SALLE.libelle
    FROM SALLE
      INNER JOIN FORMATION
        ON FORMATION.salle = SALLE.id
    WHERE FORMATION.debut > @date
          OR FORMATION.fin < @date
  END
GO
EXEC pDispoSalles @date = '2016-06-05'
GO
IF OBJECT_ID(N'dbo.fNombrePlaces', N'FN') IS NOT NULL
  DROP FUNCTION dbo.fNombrePlaces
GO
CREATE FUNCTION fNombrePlaces(@idFormation INT)
  RETURNS INT
AS
  BEGIN
    DECLARE
    @capacite INT
    SELECT @capacite = CAPACITE
    FROM SALLE
      INNER JOIN FORMATION
        ON SALLE.id = FORMATION.salle
    WHERE FORMATION.id = @idFormation
    RETURN @capacite
  END
GO
SELECT dbo.fNombrePlaces(3) AS 'Nombre de places'
GO
IF OBJECT_ID(N'dbo.fTera', N'FN') IS NOT NULL
  DROP FUNCTION dbo.fTera
GO
CREATE FUNCTION fTera(@idMachine INT)
  RETURNS INT
AS
  BEGIN
    DECLARE
    @memoire INT
    SELECT @memoire = memoire
    FROM MACHINE
    WHERE id = @idMachine
    RETURN @memoire
  END
GO
SELECT dbo.fTera(2) AS 'Mémoire en TeraOctet'
