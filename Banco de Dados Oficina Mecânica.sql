CREATE DATABASE OficinadeAutomoveis;

USE OficinaAutomoveis;

CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Morada VARCHAR(100),
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    DataNascimento DATE,
    Genero VARCHAR(10),
    CPF VARCHAR(20),
    EstadoCivil VARCHAR(20),
    Observacao VARCHAR(MAX),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (idFeedback) REFERENCES FeedbackClinte(idFeedbackCliente,
    FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (idContatos) REFERENCES Contatos(idContatos),
    FOREIGN KEY (idReparacao) REFERENCES Reparação(idReparacao)
);

CREATE TABLE Veiculo (
    VeiculoID INT PRIMARY KEY,
    ClienteID INT,
    Modelo VARCHAR(100),
    AnoFabricacao DATE,
    Chassi VARCHAR(100),
    Quilometragem INT,
    Placa VARCHAR(20),
    DataAquisicao DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (idAgendamento) REFERENCES Agendamento(idAgendamento),   
);

CREATE TABLE Funcionario (
    FuncionarioID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Morada VARCHAR(100),
    Telefone VARCHAR(20),
    Categoria VARCHAR(50),
    DataContratacao DATE,
    Salario DECIMAL(10,2),
    ContatoEmergencia VARCHAR(100),
    Qualificacoes VARCHAR(MAX),
    FOREIGN KEY (idContatos) REFERENCES Contatos(idContatos),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria),
    FOREIGN KEY (idContatos) REFERENCES Contatos(idContatos),
    FOREIGN KEY (idTempoMaoDeObra) REFERENCES TempoMaoDeObra(idTempoMaoDeObra),
    FOREIGN KEY (idContatos) REFERENCES Contatos(idContatos),
    FOREIGN KEY (idControleDePermissao) REFERENCES ControleDePermissao(idControleDePermissao)
);

CREATE TABLE Categoria (
    idCliente INT,
    idFuncionario INT,
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Morada VARCHAR(100),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)
);

CREATE TABLE CustoMaoDeObra (
    idPagamento DECIMAL(10,2),
    DataPagamento DATE,
    Descricao VARCHAR(100),
    TipoDePagamento VARCHAR(50),
    Valor INT,
    MetodoDePagamento VARCHAR(50),
    NumeroDaFatura VARCHAR(100),
    Fornecedor VARCHAR(100),
    Funcionario INT,
    Despesa VARCHAR(100),
    Observacoes VARCHAR(MAX),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE Categoria (
    idCategoria VARCHAR(50),
    CustoHora DECIMAL(10,2),
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idPCategoria)
);

CREATE TABLE Reparacao (
    ReparacaoID INT PRIMARY KEY,
    VeiculoID INT,
    ClienteID INT,
    DataReparacao DATE,
    CustoTotal DECIMAL(10,2),
    Descricao VARCHAR(MAX),
    Status VARCHAR(20),
    Observacoes VARCHAR(MAX),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculo(VeiculoID),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

CREATE TABLE PecaUtilizada (
    PecaID INT PRIMARY KEY,
    ReparacaoID INT,
    CodigoPeca VARCHAR(50),
    Designacao VARCHAR(100),
    PrecoUnitario DECIMAL(10,2),
    Quantidade INT,
    FOREIGN KEY (ReparacaoID) REFERENCES Reparacao(ReparacaoID)
);

CREATE TABLE TempoMaoDeObra (
    TempoMaoDeObraID INT PRIMARY KEY,
    ReparacaoID INT,
    FuncionarioID INT,
    TempoGasto INT,
    FOREIGN KEY (ReparacaoID) REFERENCES Reparacao(ReparacaoID),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionario(FuncionarioID)
);

CREATE TABLE PecaEmArmazem (
    PecaEmArmazemID INT PRIMARY KEY,
    CodigoPeca VARCHAR(50),
    Descricao VARCHAR(100),
    CustoUnitario DECIMAL(10,2),
    QuantidadeAtual INT,
    FOREIGN KEY (idPecaUtilizada) REFERENCES PecaUtilizada(idPecaUtilizada)
);

CREATE TABLE Agendamento (
    IDAgendamento INT PRIMARY KEY,
    IDVeiculo INT,
    DataHoraAgendada DATE,
    Status VARCHAR(20),
    FOREIGN KEY (IDVeiculo) REFERENCES Veiculo(VeiculoID)
);

CREATE TABLE Pagamentos (
    IDPagamento DECIMAL(10,2) PRIMARY KEY,
    IDVeiculo INT,
    DataHoraAgendada DATE,
    Status VARCHAR(20),
    FOREIGN KEY (IDVeiculo) REFERENCES Veiculo(VeiculoID)
);

CREATE TABLE FeedbackCliente (
    IDFeedback VARCHAR(255) PRIMARY KEY,
    IDCliente INT,
    DataEHora DATETIME,
    Avaliacoes VARCHAR(100),
    Comentario VARCHAR(50),
    ServicoAvaliado VARCHAR(50),
    RespostaDaOficina VARCHAR(50),
    StatusDoFeedback VARCHAR(20),
    CanalDoFeedback VARCHAR(50),
    AcaoTomada VARCHAR(100),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(ClienteID)
);

CREATE TABLE CustoMaoDeObra (
    IDPagamento DECIMAL(10,2) PRIMARY KEY,
    DataPagamento DATE,
    Descricao VARCHAR(100),
    TipoDePagamento VARCHAR(50),
    Valor INT,
    MetodoDePagamento VARCHAR(50),
    NumeroDaFatura VARCHAR(100),
    Fornecedor VARCHAR(100),
    Funcionario INT,
    Despesa VARCHAR(100),
    Observacoes VARCHAR(MAX),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE ControleDePermissao (
    IDFuncionario INT PRIMARY KEY,
    NomeDoUsuario VARCHAR(100),
    Cargo VARCHAR(50),
    NomeDeUsuario VARCHAR(100),
    Senha VARCHAR(255),
    NivelDeAcesso VARCHAR(100),
    Departamento VARCHAR(100),
    DataEHoraDeAcesso DATETIME,
    OperacoesRealizadas VARCHAR(100),
    ResultadoDaOperacao VARCHAR(50),
    IPDeAcesso VARCHAR(255),
    AcaoDeBloqueio VARCHAR(255),
    Observacoes VARCHAR(MAX),
    FOREIGN KEY (idFuncionario) REFERENCES Funcionario(idFuncionario)
);

CREATE TABLE DocumentoImagem (
    IDDocumentoImagem INT PRIMARY KEY,
    IDVeiculo INT,
    NomeArquivo VARCHAR(255),
    TipoDocumentoImagem VARCHAR(100),
    DataEnvioCriacao DATE,
    Descricao VARCHAR(255),
    Arquivo VARCHAR(MAX),
    Status VARCHAR (20),
    FOREIGN KEY (IDVeiculo) REFERENCES Veiculo(VeiculoID)
);

CREATE TABLE RelatorioEstatistica (
    IDRegistro INT PRIMARY KEY,
    IDRelatorio INT,
    IDPagamento INT,
    TipoRegistro VARCHAR(20),
    DataRegistro DATETIME,
    Responsavel VARCHAR(100),
    Departamento VARCHAR(100),
    DadosRegistro VARCHAR(MAX),
    ResultadosAnalises VARCHAR(MAX),
    Observacoes VARCHAR(MAX),
    ArquivoAnexado VARCHAR(255),
    StatusRegistro VARCHAR(20),
    Destinatario VARCHAR(100),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);
