unit uSendEmailService;

interface

uses System.SysUtils, IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
  IdExplicitTLSClientServerBase, uISendEmailService, uIEMailConfiguration,
  uIEmailMessage;

Type

  TSendEmailService = class(TInterfacedObject, ISendEmailService)
  private
    IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP: TIdSMTP;
    FEMailConfiguration: IEMailConfiguration;
  public
    constructor Create(EMailConfiguration: IEMailConfiguration);
    destructor Destroy; Override;
    procedure Send(EMailMessage: IEmailMessage);
  end;

implementation

{ TSendEmailService }

constructor TSendEmailService.Create(EMailConfiguration: IEMailConfiguration);
begin
  //Recebe a instancia da configuracao do servidor SMTP
  FEMailConfiguration := EMailConfiguration;

  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
  IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

  IdSMTP := TIdSMTP.Create(nil);
  IdSMTP.IOHandler := IdSSLIOHandlerSocket;
  IdSMTP.UseTLS := utUseImplicitTLS;
  IdSMTP.AuthType := satDefault;
  IdSMTP.Port := EMailConfiguration.Port;
  IdSMTP.Host := EMailConfiguration.Host;
  IdSMTP.Username := EMailConfiguration.Username;
  IdSMTP.Password := EMailConfiguration.Password;

end;

destructor TSendEmailService.Destroy;
begin
  FreeAndNil(IdSSLIOHandlerSocket);
  FreeAndNil(IdSMTP);
  inherited;
end;

procedure TSendEmailService.Send(EMailMessage: IEmailMessage);
var
  IdMessage: TIdMessage;
  IdText: TIdText;
begin

  IdMessage := TIdMessage.Create(nil);

  try

    //Objeto de geracao da mensagem do email
    IdMessage.From.Address := EMailMessage.Sender;
    IdMessage.From.Name := EMailMessage.Sender;
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text := EMailMessage.Recipient;
    IdMessage.Subject := EMailMessage.Subject;
    IdMessage.Encoding := meMIME;


    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add(EMailMessage.Body);
    IdText.ContentType := 'text/plain; charset=iso-8859-1';

    //Se existir o arquivo, anexa o mesmo na mensagem de email
    if FileExists(EMailMessage.Attachment) then
    begin
      TIdAttachmentFile.Create(IdMessage.MessageParts,
        Trim(EMailMessage.Attachment));
    end;

    // Conecta e autentica no servidor SMTP
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      raise;
    end;

    // Envia a mensagem
    try
      IdSMTP.Send(IdMessage);
    except
      raise;
    end;

  finally

    IdSMTP.Disconnect;

    UnLoadOpenSSLLibrary;

    FreeAndNil(IdText);

    FreeAndNil(IdMessage);

  end;

end;

end.
