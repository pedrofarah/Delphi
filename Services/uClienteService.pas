unit uClienteService;

interface

uses System.Classes, System.SysUtils, VCL.Forms, uIClienteRepository,
     uIClienteService, uICliente, uIEmailService, uIEMailMessage,
     uEMailMessage, uIXMLClienteService, uXMLClienteService, uIArquivoXML;

Type

  TClienteService = class(TInterfacedObject, IClienteService)
  private
    FClienteRepository: IClienteRepository;
    FEmailService: IEmailService;
    FXMLClienteService: IXMLClienteService;
  public
    constructor Create(ClienteRepository: IClienteRepository;
      EmailService: IEmailService; XMLClienteService: IXMLClienteService);
    procedure AdicionarCliente(Cliente: ICliente; EMailMessage: IEMailMessage);
  end;

implementation

{ TClienteService }

procedure TClienteService.AdicionarCliente(Cliente: ICliente;
   EMailMessage: IEMailMessage);
var ArquivoXML: IArquivoXML;
begin

  try

    try

      FClienteRepository.AdicionarCliente(Cliente);

      //Gera o arquivo XML com base nos dados do cliente
      ArquivoXML := FXMLClienteService.GerarXML(Cliente,
       ExtractFilePath(Application.ExeName) + Cliente.CPF + '.xml');

      //Gera as informacoes padroes para envio de email
      EMailMessage.Recipient := Cliente.Email;
      EMailMessage.Subject := 'Novo cliente cadastrado.';
      EMailMessage.Body := 'Segue em anexo informações do cliente cadastrado.';
      EMailMessage.Attachment := ArquivoXML.Diretorio;

      //Processa o envio do email
      FEmailService.EnviarEmail(EMailMessage);

      //Exclui o arquivo anexo temporario do email
      DeleteFile(ArquivoXML.Diretorio);

    except
      raise;
    end;

  finally
    EMailMessage := nil;
  end;
end;

constructor TClienteService.Create(ClienteRepository: IClienteRepository;
  EmailService: IEmailService; XMLClienteService: IXMLClienteService);
begin
  FEmailService := EmailService;
  FXMLClienteService := XMLClienteService;
  FClienteRepository := ClienteRepository;
end;

end.
