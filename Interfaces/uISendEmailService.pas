unit uISendEmailService;

interface

uses uIEmailMessage;

Type

  ISendEmailService = Interface
  ['{363EFDF9-07F7-4AA7-8DDA-80EC8217ABB0}']
    procedure Send(EMailMessage: IEmailMessage);
  end;

implementation

end.
