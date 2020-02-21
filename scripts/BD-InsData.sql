-------------------------------------------------------------------------------
-- USE DBProject: Changes the database context to the DBProject database.
--
USE  BDProjeto
--
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
------------  INSERT SOME DATA INTO TABLES  -----------------------------------
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
------------- Transaction mode: autocommit
-------------------------------------------------------------------------------

INSERT INTO AreaFuncional(AreaId,Nome,ChefeId) 
Values (1, 'SalaPequena', 1);

INSERT INTO AreaFuncional(AreaId,Nome,ChefeId) 
Values (2, 'SalaGrande', 2);

INSERT INTO AreaFuncional(AreaId,Nome,ChefeId) 
Values (3, 'Cozinha', 3);

INSERT INTO AreaFuncional(AreaId,Nome,ChefeId) 
Values (4, 'Bar', 4);

INSERT INTO AreaFuncional(AreaId,Nome,ChefeId) 
Values (5, 'Esplanada', 5);

-------------------------------------------------------------------------------
------------- Transaction mode: Implicit transactions
-------------------------------------------------------------------------------

SET IMPLICIT_TRANSACTIONS ON

INSERT INTO Colaborador (ColaboradorId,Nome,AreaId)
VALUES (1,'Jose',1);

INSERT INTO Colaborador (ColaboradorId,Nome,AreaId)
VALUES (2, 'Artur',1);

INSERT INTO Colaborador (ColaboradorId,Nome,AreaId)
VALUES (3, 'Carlos',2);

INSERT INTO Colaborador (ColaboradorId,Nome,AreaId)
VALUES (4, 'Zezinho',2);                                         

INSERT INTO Colaborador (ColaboradorId,Nome,AreaId)
VALUES (5, 'Abílio',2);

INSERT INTO Colaborador (ColaboradorId,Nome,AreaId)
VALUES (6, 'António',3);

INSERT INTO Colaborador (ColaboradorId,Nome,AreaId)
VALUES (7, 'Daniela',3);

INSERT INTO Colaborador (ColaboradorId,Nome,AreaId)
VALUES (8, 'Margarida',3);

INSERT INTO Colaborador (ColaboradorId,Nome,AreaId)
VALUES (9, 'Maria',3);

INSERT INTO Colaborador (ColaboradorId,Nome,AreaId)
VALUES (10, 'Paulo',4);

-- In this transaction mode we need explicit end the transaction!


COMMIT;


SET IMPLICIT_TRANSACTIONS OFF

-------------------------------------------------------------------------------
SET IMPLICIT_TRANSACTIONS ON

INSERT INTO Categoria (CategoriaId,Nome)
VALUES (1,'Comida');

INSERT INTO Categoria (CategoriaId,Nome)
VALUES (2, 'Bebida');




COMMIT;


SET IMPLICIT_TRANSACTIONS OFF
-------------------------------------------------------------------------------
------------- Transaction mode: Implicit transactions
-------------------------------------------------------------------------------

SET IMPLICIT_TRANSACTIONS ON

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (1,'Bife a Casa',10.00,50,1);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (2, 'Bitoque',7.50,60,1);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (3, 'Francesinha',8.00,30,1);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (4, 'Bifinhos c/ Cogumelos',7.50,30,1);                                         

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (5, 'Bacalhau a Casa',10.00,45,1);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (6, 'Bacalhau c/ Natas',8.00,30,1);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (7, 'Arroz de Polvo',12.00,20,1);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (8, 'Arroz de Marisco',12.00,20,1);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (9, 'Refrigerante',1.50,100,2);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (10, 'Agua',1.00,100,2);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (11, 'Vinho da Casa',3.00,100,2);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (12, 'Cafe',0.50,100,2);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (13, 'Bebida Branca',3.50,100,2);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (14, 'Cerveja',1.00,100,2);

INSERT INTO Produto (ProdutoId,Nome,Preco,Stock,CategoriaId)
VALUES (15, 'Digestivo',2.50,100,2);

-- In this transaction mode we need explicit end the transaction!



COMMIT;


SET IMPLICIT_TRANSACTIONS OFF
--...................................................

-------------------------------------------------------------------------------
------------- Transaction mode: Implicit transactions
-------------------------------------------------------------------------------

SET IMPLICIT_TRANSACTIONS ON

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (1,1,4,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (2,1,4,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (3,1,2,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (1,2,10,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (2,2,10,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (3,2,6,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (4,2,6,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (5,2,4,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (6,2,4,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (1,4,4,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (2,4,2,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (1,5,4,0,0);

INSERT INTO Mesa (MesaId,AreaId,N_lugares,Estado,Pago)
VALUES (2,5,2,0,0);


-- In this transaction mode we need explicit end the transaction!



COMMIT;


SET IMPLICIT_TRANSACTIONS OFF
--...................................................