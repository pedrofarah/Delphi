unit uICEPService;

interface

uses uIEndereco;

Type

  ICEPService = Interface
  ['{B6ABB589-BB82-4B36-B76C-CDB19D34536A}']
    function Consultar(CEP: String): IEndereco;
  end;

implementation

end.
