unit uClienteRepository;

interface

uses System.SysUtils, System.Generics.Collections, uIClienteRepository, uICliente;

Type

  TClienteRepository = class(TInterfacedObject, IClienteRepository)
  private
    FListaCliente: TList<ICliente>;
  public
    constructor Create();
    destructor Destroy; Override;
    procedure AdicionarCliente(Cliente: ICliente);
    function ListarClientes: TList<ICliente>;
  end;

implementation

{ TClienteRepository }

procedure TClienteRepository.AdicionarCliente(Cliente: ICliente);
begin
  FListaCliente.Add(Cliente);
end;

constructor TClienteRepository.Create;
begin
  FListaCliente := TList<ICliente>.Create;
end;

destructor TClienteRepository.Destroy;
begin
  FreeAndNil(FListaCliente);
  inherited;
end;

function TClienteRepository.ListarClientes: TList<ICliente>;
begin
  result := FListaCliente;
end;

end.
