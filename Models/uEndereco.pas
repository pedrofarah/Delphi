unit uEndereco;

interface

uses uIEndereco;

Type

  TEndereco = class(TInterfacedObject, IEndereco)
  private
    FCEP: String;
    FLogradouro: String;
    FNumero: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FEstado: String;
    FPais: String;

  public

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

{ TEndereco }

function TEndereco.GetBairro: String;
begin
  result := FBairro;
end;

function TEndereco.GetCEP: String;
begin
  result := FCEP;
end;

function TEndereco.GetCidade: String;
begin
  result := FCidade;
end;

function TEndereco.GetComplemento: String;
begin
  result := FComplemento;
end;

function TEndereco.GetEstado: String;
begin
  result := FEstado;
end;

function TEndereco.GetLogradouro: String;
begin
  result := FLogradouro;
end;

function TEndereco.GetNumero: String;
begin
  result := FNumero;
end;

function TEndereco.GetPais: String;
begin
  result := FPais;
end;

procedure TEndereco.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TEndereco.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TEndereco.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TEndereco.SetEstado(const Value: string);
begin
  FEstado := Value;
end;

procedure TEndereco.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

procedure TEndereco.SetPais(const Value: string);
begin
  FPais := Value;
end;

end.
