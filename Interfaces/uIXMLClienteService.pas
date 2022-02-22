unit uIXMLClienteService;

interface

uses uICliente, uIArquivoXML;

Type

  IXMLClienteService = Interface
  ['{5427CB2E-6FBA-4FBF-A99A-32E163DAB183}']
    function GerarXML(Cliente: ICliente; Diretorio: String): IArquivoXML;
  end;

implementation

end.
