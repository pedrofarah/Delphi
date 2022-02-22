unit uIEmailService;

interface

uses uIEmailMessage;

Type
  IEmailService = Interface
  ['{01226E05-F494-4E37-879C-6B031195864F}']
    procedure EnviarEmail(EMailMessage: IEmailMessage);
  end;

implementation

end.
