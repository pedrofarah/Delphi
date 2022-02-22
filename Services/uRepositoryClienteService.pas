unit uRepositoryClienteService;

interface

uses DB, DBClient, System.Generics.Collections, uICliente,
     uIRepositoryClienteService, uIClienteRepository;

Type

  TRepositoryClienteService = class(TInterfacedObject, IRepositoryClienteService)
  private
    FClienteRepository: IClienteRepository;
    function CreateClientDataSet: TClientDataSet;
  public
    constructor Create(ClienteRepository: IClienteRepository);
    //Funcao para converter a Lista de Clientes em um TClientDataSet
    function ListToDataSet: TClientDataSet;
  end;

implementation

{ TRepositoryClienteService }

constructor TRepositoryClienteService.Create(
  ClienteRepository: IClienteRepository);
begin
  FClienteRepository := ClienteRepository;
end;

function TRepositoryClienteService.CreateClientDataSet: TClientDataSet;
var cds: TClientDataSet;
begin

  cds := TClientDataSet.Create(nil);
  cds.FieldDefs.Add('CPF', ftString, 20);
  cds.FieldDefs.Add('Nome', ftString, 100);
  cds.FieldDefs.Add('Cidade', ftString, 100);
  cds.FieldDefs.Add('Estado', ftString, 2);

  cds.CreateDataSet;

  result := cds;

end;

function TRepositoryClienteService.ListToDataSet: TClientDataSet;
var cds: TClientDataSet;
    _item: ICliente;
begin

  cds := CreateClientDataSet;

  for _item in FClienteRepository.ListarClientes do
  begin
    cds.Append;
    cds.FieldByName('CPF').AsString := _item.CPF;
    cds.FieldByName('Nome').AsString := _item.Nome;
    cds.FieldByName('Cidade').AsString := _item.Endereco.Cidade;
    cds.FieldByName('Estado').AsString := _item.Endereco.Estado;
    cds.Post;
  end;

  cds.First;

  result := cds;

end;

end.
