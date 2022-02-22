unit uIEndereco;

interface

Type

  IEndereco = Interface
  ['{7C77533E-2908-4ACF-99F3-B60615DE6720}']

    procedure SetCEP(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetNumero(const Value: String);
    procedure SetComplemento(const Value: string);
    procedure SetBairro(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetEstado(const Value: string);
    procedure SetPais(const Value: string);

    function GetCEP: String;
    function GetLogradouro: String;
    function GetNumero: String;
    function GetComplemento: String;
    function GetBairro: String;
    function GetCidade: String;
    function GetEstado: String;
    function GetPais: String;

    property CEP: String read GetCEP write SetCEP;
    property Logradouro: String read GetLogradouro write SetLogradouro;
    property Numero: String read GetNumero write SetNumero;
    property Complemento: String read GetComplemento write SetComplemento;
    property Bairro: String read GetBairro write SetBairro;
    property Cidade: String read GetCidade write SetCidade;
    property Estado: String read GetEstado write SetEstado;
    property Pais: String read GetPais write SetPais;
  end;

implementation

end.
