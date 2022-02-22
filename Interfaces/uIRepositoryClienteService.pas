unit uIRepositoryClienteService;

interface

uses DBClient;

Type

  IRepositoryClienteService = Interface
  ['{259A5AB9-75CB-4C36-9F01-3958FB61414F}']
    function ListToDataSet: TClientDataSet;
  end;

implementation

end.
