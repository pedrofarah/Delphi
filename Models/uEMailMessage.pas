unit uEMailMessage;

interface

uses System.Generics.Collections, uIEmailMessage;

Type

  TEmailMessage = class(TInterfacedObject, IEmailMessage)
  private
    FSender: String;
    FSubject: String;
    FBody: String;
    FRecipient: String;
    FAttachment: String;
  public

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

{ TEmailMessage }

function TEmailMessage.GetAttachment: String;
begin
  result := FAttachment;
end;

function TEmailMessage.GetBody: String;
begin
  result := FBody;
end;

function TEmailMessage.GetRecipient: String;
begin
  result := FRecipient;
end;

function TEmailMessage.GetSender: String;
begin
  result := FSender;
end;

function TEmailMessage.GetSubject: String;
begin
  result := FSubject;
end;

procedure TEmailMessage.SetAttachment(const Value: String);
begin
  FAttachment := Value;
end;

procedure TEmailMessage.SetBody(const Value: string);
begin
  FBody := Value;
end;

procedure TEmailMessage.SetRecipient(const Value: string);
begin
  FRecipient := Value;
end;

procedure TEmailMessage.SetSender(const Value: string);
begin
  FSender := Value;
end;

procedure TEmailMessage.SetSubject(const Value: string);
begin
  FSubject := Value;
end;

end.
