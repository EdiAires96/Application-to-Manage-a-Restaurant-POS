
-------------------------------------------------------------------------------
-- USE DBProject: Changes the database context to the DBProject database.
--
USE BDProjeto
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Criar as tabelas
-- (create the database tables)
-------------------------------------------------------------------------------

if not exists (select * from dbo.sysobjects 
               where id = object_id(N'[dbo].[AreaFuncional]') )
begin
  CREATE TABLE AreaFuncional (
	AreaId int NOT NULL 
	     CHECK (AreaId >= 1),                    -- constraint type: check
    Nome nvarchar(30) NOT NULL, 
    ChefeId int NOT NULL                      -- Default definition
    
    CONSTRAINT [PK_Area] PRIMARY KEY (AreaId), -- constraint type: primary key
    CONSTRAINT U_Nome UNIQUE (Nome)                  -- constraint type: unique        
  
  ); 
    
end

-- ............................................................................

if not exists (select * from dbo.sysobjects 
               where id = object_id(N'[dbo].[Colaborador]') )
begin
  CREATE TABLE Colaborador (
	  ColaboradorId int NOT NULL 
	     CONSTRAINT [PK_Colaborador] PRIMARY KEY (ColaboradorId)
	     CHECK (ColaboradorId >= 1),
	  Nome nvarchar (50) NOT NULL ,
	  AreaId int Not  NULL ,            
	  
	  CONSTRAINT FK_AreaColaborador FOREIGN KEY (AreaId) 
	     REFERENCES AreaFuncional(AreaId)
	     ON UPDATE CASCADE 
	     ON DELETE NO ACTION
  ); 
end

-- ............................................................................
if not exists (select * from dbo.sysobjects 
               where id = object_id(N'[dbo].[Mesa]') )
begin
  CREATE TABLE Mesa (
	  MesaId int Not Null
	  CHECK (MesaId >= 1),
	  AreaId int Not Null,
	  N_lugares int Not Null
	  CHECK (N_lugares >= 1),
	  Estado int 
		CHECK(Estado=0 or Estado=1), 
      Pago int 
		CHECK(Pago=0 or Pago=1) 
	 
      CONSTRAINT [PK_Mesa] PRIMARY KEY (MesaId,AreaId),
  
      CONSTRAINT FK_AreaMesa FOREIGN KEY (AreaId) 
	     REFERENCES AreaFuncional(AreaId)
		  ON UPDATE CASCADE
		  
		
		  );
	 

  
  
 -- ALTER TABLE Projecto DROP CONSTRAINT C_ProjNum;
  --ALTER TABLE Projecto ADD  CONSTRAINT C_ProjNum CHECK (ProjNum >= 0);
  
  --ALTER TABLE Projecto Add  CONSTRAINT PK_ProjNum  PRIMARY KEY (ProjNum);
  --ALTER TABLE Projecto Add  CONSTRAINT U_Designacao  UNIQUE (Designacao);
end
-- ............................................................................
if not exists (select * from dbo.sysobjects 
               where id = object_id(N'[dbo].[Categoria]') )
begin
  CREATE TABLE Categoria (
	  CategoriaId int Not Null
	  CHECK (CategoriaId>=1),
	  Nome nvarchar(50) Not Null,

      CONSTRAINT [PK_Categoria] PRIMARY KEY (CategoriaId),
	  CONSTRAINT U_NomeCategoria UNIQUE (Nome),		 		  
	  
		  );

end


-- ............................................................................
if not exists (select * from dbo.sysobjects 
               where id = object_id(N'[dbo].[Produto]') )
begin
  CREATE TABLE Produto (
	   ProdutoId int Not Null
	   CHECK (ProdutoId >=1),
	   Nome nvarchar (50) NOT NULL,
	   Preco float Not Null
	   CHECK (Preco >=0.0),
	   Stock int Not Null,
	   CHECK (Stock >=0),
	   CategoriaId int Not Null

	   
	 
      CONSTRAINT [PK_Produto] PRIMARY KEY (ProdutoId),
	  CONSTRAINT U_NomeProduto UNIQUE (Nome),
	  CONSTRAINT FK_Categoria FOREIGN KEY (CategoriaId)
	  REFERENCES Categoria(CategoriaId)
	  ON UPDATE CASCADE
	  
     
		  );
	 
end


-- ............................................................................

if not exists (select * from dbo.sysobjects 
               where id = object_id(N'[dbo].[Pedido]') )
begin
  CREATE TABLE Pedido (
	  PedidoId int Not Null
	  CHECK (PedidoId>=1),
	  MesaId int Not Null,
	  AreaId int Not Null,
	  ColaboradorId int Not Null,
	  Notas nvarchar(50) Not Null,
	  Conta int 
		CHECK(Conta=0 or Conta=1) 

      CONSTRAINT [PK_Pedido] PRIMARY KEY (PedidoId),
		

	  CONSTRAINT FK_ColaboradorPedido FOREIGN KEY (ColaboradorId) 
	     REFERENCES Colaborador(ColaboradorId),
		 
      CONSTRAINT FK_MesaPedido FOREIGN KEY (MesaId,AreaId) 
	     REFERENCES Mesa(MesaId,AreaId)
		 		 		  
			 ON UPDATE CASCADE
		
		  );

end

-- ............................................................................

/*if not exists (select * from dbo.sysobjects 
               where id = object_id(N'[dbo].[Talao]') )
begin
  CREATE TABLE Talao (
	  TalaoId int Not Null
	  CHECK (TalaoId >= 1),
	  PedidoId int Not Null,
	  ProdutoId int Not Null,
	  MesaId int Not Null,
	  ColaboradorId int Not Null,
	  AreaId int Not Null,

      CONSTRAINT [PK_Talao] PRIMARY KEY (TalaoId),
		

	  CONSTRAINT FK_ColaboradorTalao FOREIGN KEY (ColaboradorId) 
	     REFERENCES Colaborador(ColaboradorId),
		 
      CONSTRAINT FK_MesaTalao FOREIGN KEY (MesaId,AreaId) 
	     REFERENCES Mesa(MesaId,AreaId),
		 
	  CONSTRAINT FK_ProdutoTalao FOREIGN KEY (ProdutoId) 
	     REFERENCES Produto(ProdutoId),

	  CONSTRAINT FK_PedidoTalao FOREIGN KEY (PedidoId) 
	     REFERENCES Pedido(PedidoId) 	 		 		  
	  
		  
		  ON UPDATE CASCADE

		
		  );

end*/

-- ............................................................................
if not exists (select * from dbo.sysobjects 
               where id = object_id(N'[dbo].[Fatura]') )
begin
  CREATE TABLE Fatura (
	  FaturaId int Not Null
	  CHECK (FaturaId >= 1),
      PrecoTotal float Not Null
	  Check (PrecoTotal >=0.0),

	  

      CONSTRAINT [PK_Fatura] PRIMARY KEY (FaturaId)

		
		  );

end


-- ............................................................................

if not exists (select * from dbo.sysobjects 
               where id = object_id(N'[dbo].[PedidoFatura]') )
begin
  CREATE TABLE PedidoFatura (
	  FaturaId int  
	    CONSTRAINT nn_FaturaId NOT NULL,
	  PedidoId int 
	    CONSTRAINT nn_PedidoId NOT NULL,

	  CONSTRAINT PK_PedidoFatura 
	    PRIMARY KEY (FaturaId, PedidoId),           -- constraint type: primary key
	  
	  CONSTRAINT FK_PedidoPF FOREIGN KEY (PedidoId) 
	    REFERENCES Pedido(PedidoId), 
		    
	  CONSTRAINT FK_FaturaPF FOREIGN KEY (FaturaId) 
	    REFERENCES Fatura(FaturaId)
	    ON UPDATE CASCADE 
	  
  );    
end
-- .............................................................................

if not exists (select * from dbo.sysobjects 
               where id = object_id(N'[dbo].[LinhasPedido]') )
begin
  CREATE TABLE LinhasPedido (
	  PedidoId int  
	    CONSTRAINT nn_PedidoId NOT NULL,
	  ProdutoId int 
	    CONSTRAINT nn_ProdutoId NOT NULL,
      Quantidade int
		CHECK(Quantidade>=1),
	  Observacao nvarchar(50) 
	    CONSTRAINT nn_Observacao NOT NULL,
	  Estado int 
		CHECK(Estado=0 or Estado=1) 

	  CONSTRAINT PK_LinhasPedido
	    PRIMARY KEY (PedidoId,ProdutoId),           -- constraint type: primary key
	  
	  CONSTRAINT FK_PedidoLP FOREIGN KEY (PedidoId) 
	    REFERENCES Pedido(PedidoId),
		    
	  CONSTRAINT FK_ProdutoLP FOREIGN KEY (ProdutoId) 
	    REFERENCES Produto(ProdutoId)
	    ON UPDATE CASCADE 
	  
  );    
end
