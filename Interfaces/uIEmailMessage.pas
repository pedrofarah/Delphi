unit uIEmailMessage;

interface

Type

  IEmailMessage = Interface
  ['{9DB638AF-C3E8-442E-86AA-F0D7B6C5EA13}']

    procedure SetSender(const Value: string);
    procedure SetSubject(const Value: string);
    procedure SetBody(const Value: string);
    procedure SetRecipient(const Value: string);
    procedure SetAttachment(const Value: String);

    function GetSender: String;
    function GetSubject: String;
    function GetBody: String;
    function GetRecipient: String;
    function GetAttachment: String;

    property Sender: String read GetSender write SetSender;
    property Subject: String read GetSubject write SetSubject;
    property Body: String read GetBody write SetBody;
    property Recipient: String read GetRecipient write SetRecipient;
    property Attachment: String read GetAttachment write SetAttachment;
  end;

implementation

end.
