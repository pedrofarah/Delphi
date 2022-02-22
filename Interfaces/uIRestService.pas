unit uIRestService;

interface

Type

  IRestService = Interface
  ['{1757F89B-B343-4E6A-942C-5B36B07F57EE}']
    procedure SetURL(const Value: String);
    property URL: String write SetURL;
    function Processar: String;
  end;

implementation

end.
