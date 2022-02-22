unit uIClienteRepository;

interface

uses System.Generics.Collections, uICliente;

Type

  IClienteRepository = Interface
  ['{40001D4E-CD0A-4ECE-AA1C-E9181A2732E1}']
    procedure AdicionarCliente(Cliente: ICliente);
    function ListarClientes: TList<ICliente>;
  end;

implementation

end.
