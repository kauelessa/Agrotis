CREATE TABLE CLIENTE (
    CodigoCliente INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100),
    CEP VARCHAR(10),
    Logradouro VARCHAR(100),
    Complemento VARCHAR(50),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    UF CHAR(2),
    CodigoIBGE VARCHAR(10)
);

CREATE TABLE PRODUTO (
    CodigoProduto INT PRIMARY KEY IDENTITY,
    Descricao VARCHAR(100)
);

CREATE TABLE PEDIDO (
    Codigo INT PRIMARY KEY IDENTITY,
    Referencia VARCHAR(50),
    NumeroPedido INT,
    DataEmissao DATE,
    CodigoCliente INT,
    TipoOperacao VARCHAR(50),
    TotalPedido DECIMAL(18, 2),
    FOREIGN KEY (CodigoCliente) REFERENCES CLIENTE(CodigoCliente)
);

CREATE TABLE ITENS_PEDIDO (
    CodigoPedido INT,
    CodigoProduto INT,
    Quantidade INT,
    ValorUnitario DECIMAL(18, 2),
    TotalItem DECIMAL(18, 2),
    PRIMARY KEY (CodigoPedido, CodigoProduto),
    FOREIGN KEY (CodigoPedido) REFERENCES PEDIDO(Codigo),
    FOREIGN KEY (CodigoProduto) REFERENCES PRODUTO(CodigoProduto)
);