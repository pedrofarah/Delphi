unit uCliente;

interface

uses uICliente, uIEndereco;

Type

  TCliente = class(TInterfacedObject, ICliente)
  private
    FNome: String;
    FIdentidade: String;
    FCPF: String;
    FTelefone: String;
    FEmail: String;
    FEndereco: IEndereco;

  public

    procedure SetNome(const Value: String);
    procedure SetIdentidade(const Value: String);
    procedure SetCPF(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetTelefone(const Value: String);
    procedure SetEndereco(const Value: IEndereco);

    function GetNome: String;
    function GetIdentidade: String;
    function GetCPF: String;
    function GetEmail: String;
    function GetTelefone: String;
    function GetEndereco: IEndereco;

    property Nome: String read GetNome write SetNome;
    property Identidade: String read GetIdentidade write SetIdentidade;
    property CPF: String read GetCPF write SetCPF;
    property Telefone: String read GetTelefone write SetTelefone;
    property Email: String read GetEmail write SetEmail;
    property Endereco: IEndereco read GetEndereco write SetEndereco;
  end;

implementation

{ TCliente }

function TCliente.GetCPF: String;
begin
  result := FCPF;
end;

function TCliente.GetEmail: String;
begin
  result := FEmail;
end;

function TCliente.GetEndereco: IEndereco;
begin
  result := FEndereco;
end;

function TCliente.GetIdentidade: String;
begin
  result := FIdentidade;
end;

function TCliente.GetNome: String;
begin
  result := FNome;
end;

function TCliente.GetTelefone: String;
begin
  result := FTelefone;
end;

procedure TCliente.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TCliente.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TCliente.SetEndereco(const Value: IEndereco);
begin
  FEndereco := Value;
end;

procedure TCliente.SetIdentidade(const Value: String);
begin
  FIdentidade := Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TCliente.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
