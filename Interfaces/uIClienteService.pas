unit uIClienteService;

interface

uses uICliente, uIEMailMessage;

Type

  IClienteService = Interface
  ['{8940033E-C8E7-46C1-A8C3-26837637BF03}']
    procedure AdicionarCliente(Cliente: ICliente; EMailMessage: IEMailMessage);
  end;

implementation

end.
