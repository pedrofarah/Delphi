unit uArquivoXML;

interface

uses uIArquivoXML;

Type

  TArquivoXML = class(TInterfacedObject, IArquivoXML)
  private
    FConteudo: String;
    FDiretorio: String;
  public
    procedure SetConteudo(const Value: string);
    procedure SetDiretorio(const Value: string);

    function GetConteudo: String;
    function GetDiretorio: String;

    property Conteudo: String read GetConteudo write SetConteudo;
    property Diretorio: String read GetDiretorio write SetDiretorio;
  end;

implementation

{ TArquivoXML }

function TArquivoXML.GetConteudo: String;
begin
  result := FConteudo;
end;

function TArquivoXML.GetDiretorio: String;
begin
  result := FDiretorio;
end;

procedure TArquivoXML.SetConteudo(const Value: string);
begin
  FConteudo := Value;
end;

procedure TArquivoXML.SetDiretorio(const Value: string);
begin
  FDiretorio := Value;
end;

end.
