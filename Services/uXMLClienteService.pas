unit uXMLClienteService;

interface

uses System.SysUtils, XMLDoc, XMLIntf, uIXMLClienteService, uICliente,
     uIArquivoXML, uArquivoXML;

Type

  TXMLClienteService = class(TInterfacedObject, IXMLClienteService)
  private
    FXMLDocument: TXMLDocument;
  public
    function GerarXML(Cliente: ICliente; Diretorio: String): IArquivoXML;
  end;

implementation

{ TXMLClienteService }

function TXMLClienteService.GerarXML(Cliente: ICliente;
  Diretorio: String): IArquivoXML;
var
  NodeRegistro, NodeEndereco: IXMLNode;
  ArquivoXML: IArquivoXML;
begin

  //Intancia a classe repositorio de informacoes do XML
  ArquivoXML := TArquivoXML.Create();

  //Atribui o diretorio padrao de geracao do arquivo
  ArquivoXML.Diretorio := Diretorio;

  //Instancia a classe de criacao do arquivo XML
  FXMLDocument := TXMLDocument.Create(nil);

  try

    FXMLDocument.Active := True;

    //Gera o nodulo pai do cliente
    NodeRegistro := FXMLDocument.AddChild('Cliente');

    //Preenche os dados do cliente
    NodeRegistro.ChildValues['Nome'] := Cliente.Nome;
    NodeRegistro.ChildValues['Identidade'] := Cliente.Identidade;
    NodeRegistro.ChildValues['CPF'] := Cliente.CPF;
    NodeRegistro.ChildValues['Telefone'] := Cliente.Telefone;
    NodeRegistro.ChildValues['Email'] := Cliente.Email;

    //Cria o nodulo filho de informacoes do endereco do cliente
    NodeEndereco := NodeRegistro.AddChild('Endereco');
    NodeEndereco.ChildValues['CEP'] := Cliente.Endereco.CEP;
    NodeEndereco.ChildValues['Logradouro'] := Cliente.Endereco.Logradouro;
    NodeEndereco.ChildValues['Numero'] := Cliente.Endereco.Numero;
    NodeEndereco.ChildValues['Complemento'] := Cliente.Endereco.Complemento;
    NodeEndereco.ChildValues['Bairro'] := Cliente.Endereco.Bairro;
    NodeEndereco.ChildValues['Cidade'] := Cliente.Endereco.Cidade;
    NodeEndereco.ChildValues['Estado'] := Cliente.Endereco.Estado;
    NodeEndereco.ChildValues['Pais'] := Cliente.Endereco.Pais;

    //Recupera as informacoes do XML gerado
    ArquivoXML.Conteudo := FXMLDocument.XML.Text;

    //Cria o arquivo XML no diretorio escificado anteriormente
    FXMLDocument.SaveToFile(ArquivoXML.Diretorio);

    result := ArquivoXML;

  finally
    NodeEndereco := nil;
    NodeRegistro := nil;
    FXMLDocument := nil;
  end;

end;

end.
