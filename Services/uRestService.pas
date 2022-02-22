unit uRestService;

interface

uses System.SysUtils, uIRestService, uIEndereco, JSON, REST.Json, REST.Client;

Type

  TREstService = class(TInterfacedObject, IRestService)
  private
    FRestClient: TRESTClient;
    FRestRequest: TRESTRequest;
    FRestResponse: TRESTResponse;
    FURL: String;
  public
    procedure SetURL(const Value: String);
    constructor Create;
    destructor Destroy; Override;
    property URL: String write SetURL;
    //Metodo para executar a chamada ao servidor REST
    function Processar: String;
  end;

implementation

{ TREstService }

constructor TREstService.Create;
begin
  //Instancia os objetos de comunicacao REST

  FRestClient := TRESTClient.Create(nil);
  FRestRequest := TRESTRequest.Create(nil);
  FRestResponse := TRESTResponse.Create(nil);

  FRestClient.AutoCreateParams := false;

  FRestRequest.AutoCreateParams := false;
  FRestRequest.HandleRedirects := True;
  FRestRequest.Client := FRestClient;
  FRestRequest.Response := FRestResponse;
end;

destructor TREstService.Destroy;
begin

  FreeAndNil(FRestClient);
  FreeAndNil(FRestResponse);
  FreeAndNil(FRestRequest);

  inherited;
end;

function TREstService.Processar: String;
begin

  //Executa a chamada do servico REST e aguarda o retorno no formato JSON
  try
    FRestRequest.Execute;
    Result := FRestResponse.JSONText;
  Except
    Result := String.Empty;
  end;
end;

procedure TREstService.SetURL(const Value: String);
begin
  FURL := Value;
  FRestClient.BaseURL := Self.FURL;
end;

end.
