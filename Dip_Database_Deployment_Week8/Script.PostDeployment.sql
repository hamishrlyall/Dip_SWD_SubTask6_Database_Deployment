﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF '$(LoadTestData)' = 'true'

BEGIN

-- ENSURE TEHERE IS NO DATA IN THE TABLES BEFORE DEPLOYING TEST DATA
DELETE FROM STUDENT;
DELETE FROM AUTHOR;
DELETE FROM BOOK;

-- INSERT THE TEST DATA
INSERT INTO STUDENT (STUDENTID, FIRSTNAME, LASTNAME, EMAIL, MOBILENUMBER) VALUES
('s12345678', 'Michael', 'Hutchence', 'hanginginthere@email.com', '0400555123'),
('s2345679', 'Kurt', 'Cobain', 'leadjawline@email.com', '0411555321'),
('s34567890', 'Amy', 'Winehouse', 'missadventure@email.com', '0422555432'),
('s98765432', 'Janis', 'Joplin', 'chasethedragon@email.com', '0433555543');

INSERT INTO AUTHOR (AUTHORID, FIRSTNAME, LASTNAME, AUTHORTAXFILENUMBER) VALUES
('32567', 'Edgar', 'Codd', 150111222),
('76543', 'Vinton', 'Cerf', 150222333),
('12345', 'Alan', 'Turing', 150333444);

INSERT INTO BOOK (ISBN, TITLE, PUBLICATIONYEAR, AUTHORID, FIRSTNAME, LASTNAME, AUTHORTAXFILENUMBER) VALUES
(9783161484100, 'Relationships with Databases, the ins and outs', 1970, '32567', 'Edgar', 'Codd', 150111222),
(9783161484101, 'Normalisation, how to make a database geek fit in', 1973, '32567', 'Edgar', 'Codd', 150111222),
(9783161484102, 'TCP/IP, the protocol for the masses', 1983, '76543', 'Vinton', 'Cerf', 150222333),
(9783161484103, 'The Man, the Bombe, and the Enigma', 1940, '12345', 'Alan', 'Turing', 150333444);

END;