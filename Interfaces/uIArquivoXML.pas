unit uIArquivoXML;

interface

Type

  IArquivoXML = Interface
  ['{B6EB4A06-71FB-48A1-92E7-8C4B2523B98A}']

    procedure SetConteudo(const Value: string);
    procedure SetDiretorio(const Value: string);

    function GetConteudo: String;
    function GetDiretorio: String;

    property Conteudo: String read GetConteudo write SetConteudo;
    property Diretorio: String read GetDiretorio write SetDiretorio;
  end;

implementation

end.
