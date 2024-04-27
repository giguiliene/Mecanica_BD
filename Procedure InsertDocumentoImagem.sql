CREATE PROCEDURE InserirDocumentoImagem (
    @DocumentoImagemID INT,
    @NomeArquivo VARCHAR(255),
    @TipoDocumentoImagem VARCHAR(100),
    @DataEnvioCriacao DATE,
    @Descricao VARCHAR(255),
    @VeiculoID INT,
    @Responsavel VARCHAR(100),
    @Departamento VARCHAR(100),
    @Arquivo VARBINARY(MAX),
    @Status VARCHAR(50)
)
AS
BEGIN
    INSERT INTO DocumentoImagem (
        DocumentoImagemID,
        NomeArquivo,
        TipoDocumentoImagem,
        DataEnvioCriacao,
        Descricao,
        VeiculoID,
        Responsavel,
        Departamento,
        Arquivo,
        Status
    )
    VALUES (
        @DocumentoImagemID,
        @NomeArquivo,
        @TipoDocumentoImagem,
        @DataEnvioCriacao,
        @Descricao,
        @VeiculoID,
        @Responsavel,
        @Departamento,
        @Arquivo,
        @Status
    );
END;
