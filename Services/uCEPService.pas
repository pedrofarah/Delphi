unit uCEPService;

interface

uses System.SysUtils, System.JSON, REST.Json, uICEPService, uIRestService,
uIEndereco, uEndereco, uCEP;

Type

  TCEPService = class(TInterfacedObject, ICEPService)
  private
    FRestService: IRestService;
    FBaseUrl: String;
  public
    //Metodo para realizar a consulta de CEP
    function Consultar(CEP: String): IEndereco;
    constructor Create(RestService: IRestService);
  end;

implementation

{ TCEPService }

function TCEPService.Consultar(CEP: String): IEndereco;
var LValue: TJSONValue;
    resultCEP: TCEP;
begin
  try
    try

      //Substitui a tag #CEP da url base pelo CEP a ser consultado
      FRestService.URL := StringReplace(FBaseUrl, '#CEP', CEP, []);

      //Executa a comunicacao com o servidor de consulta de CEP e trata o JSON de resposta
      LValue := TJSONObject.ParseJSONValue(FRestService.Processar, true, true);

      //Converte o objeto padrao JSON para o objeto TEndereco
      resultCEP := TJson.JsonToObject<TCEP>(TJSONObject(LValue));

      resultCEP.CEP := resultCEP.CEP.Replace('-','');
      resultCEP.CEP := resultCEP.CEP.Replace('.','');

      result := TEndereco.Create;
      result.CEP := resultCEP.CEP;
      result.Logradouro := resultCEP.Logradouro;
      result.Complemento := resultCEP.Complemento;
      result.Bairro := resultCEP.Bairro;
      result.Cidade := resultCEP.Localidade;
      result.Estado := resultCEP.UF;

    except
      result := nil;
    end;
  finally
    FreeAndNil(LValue);
    FreeAndNil(resultCEP);
  end;
end;

constructor TCEPService.Create(RestService: IRestService);
begin
  //Recebe a instancia do servico de comunicacao REST
  FRestService := RestService;

  //Defini a url base de consulta de CEP
  FBaseUrl := 'https://viacep.com.br/ws/#CEP/json/';
end;

end.
