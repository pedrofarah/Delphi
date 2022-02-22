unit uEmailService;

interface

uses System.SysUtils, IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase, uIEmailService, uISendEmailService,
  uIEmailMessage;

Type

  TEmailService = class(TInterfacedObject, IEmailService)
  private
    FSendEmailService: ISendEmailService;
  public
    constructor Create(SendEmailService: ISendEmailService);
    //Metodo para executar o servico de envio de email
    procedure EnviarEmail(EMailMessage: IEmailMessage);
  end;

implementation

{ TEmailService }

constructor TEmailService.Create(SendEmailService: ISendEmailService);
begin
  //Recebe a instancia do servico de comunicacao SMTP
  FSendEmailService := SendEmailService;
end;

procedure TEmailService.EnviarEmail(EMailMessage: IEmailMessage);
begin
  try
    //Dispara o comando de envio do email
    FSendEmailService.Send(EMailMessage);
  Except
    raise;
  end;
end;

end.
