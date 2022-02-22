unit uICliente;

interface

uses uIEndereco;

Type

  ICliente = Interface
    ['{55F1E477-8B25-4D4E-B1DA-F763BF0675CF}']

    procedure SetNome(const Value: string);
    procedure SetIdentidade(const Value: string);
    procedure SetCPF(const Value: String);
    procedure SetTelefone(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: IEndereco);

    function GetNome: String;
    function GetIdentidade: String;
    function GetCPF: String;
    function GetTelefone: String;
    function GetEmail: String;
    function GetEndereco: IEndereco;

    property Nome: String read GetNome write SetNome;
    property Identidade: String read GetIdentidade write SetIdentidade;
    property CPF: String read GetCPF write SetCPF;
    property Telefone: String read GetTelefone write SetTelefone;
    property Email: String read GetEmail write SetEmail;
    property Endereco: IEndereco read GetEndereco write SetEndereco;
  end;

implementation

end.
