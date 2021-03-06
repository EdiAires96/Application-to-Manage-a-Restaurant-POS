--You can use one CREATE DATABASE statement to create a database and the 
-- files that store the database. 
--SQL Server implements the CREATE DATABASE statement in two steps: 
--   1. SQL Server uses a copy of the model database to initialize the 
--                                               database and its meta data.
--   2. SQL Server then fills the rest of the database with empty pages, 
--     except for pages that have internal data recording how the space is 
--     used in the database. 

-- SQL Server creates two operating system files to house the new 
--  database:.MDF && .LDG. Data resides in the first file; transaction log
--  information lives in the second.  A database's transaction log is the 
--  area where the server first carries out changes made to the data.
-- Once those changes succeed, they're applied atomically�in one piece�to 
--   the actual data.  
-- It's advantageous for both recoverability and performance to separate 
--   user data from transaction log data.


-- If you don't specifically indicate a transaction log location,  SQL Server
--  selects one for you (the default location is the data directory that was 
--  selected during installation).

-------------------------------------------------------------------------------
-- USE database: Changes the database context to the specified database.
--
USE master
-------------------------------------------------------------------------------
--
--  DANGER! DANGER! DANGER
--  DROP DATABASE! DROP DATABASE! DROP DATABASE! Are you sure? ...............
--

IF ( EXISTS( SELECT * FROM [dbo].[sysdatabases] Where name = 'BDProjeto') )
Begin
  DROP DATABASE BDProjeto
end

-------------------------------------------------------------------------------
--
-- Se n�o existir a BD ent�o vamos cri�-la...
-- (if not exists the Projecto database then create them)
--
IF (NOT EXISTS( SELECT * FROM [dbo].[sysdatabases] Where name = 'BDProjeto') )
Begin

-------------------------------------------------------------------------------
--  Criar a BDProjeto com um datafile e um logfile
--  (create the BDProjeto database with datafile 'Projdat.mdf' 
--                                              and log file 'Projlog.ldf')
-------------------------------------------------------------------------------
  CREATE DATABASE BDProjeto
  ON 
   ( NAME = 'Projeto_dat',
--      FILENAME = 'd:\BD1314\data\Projetodat.mdf',
      FILENAME = N'd:\Microsoft SQL Server\MSSQL\data\Projetodat.mdf',
      
      SIZE = 10,
      MAXSIZE = 50,
      FILEGROWTH = 5 )
   LOG ON
   ( NAME = 'Projeto_log',
--     FILENAME = 'd:\BD1314\data\Projetolog.ldf',
    FILENAME = N'd:\Microsoft SQL Server\MSSQL\data\Projetolog.ldf',

     SIZE = 5MB,
     MAXSIZE = 25MB,
     FILEGROWTH = 5MB )
end
