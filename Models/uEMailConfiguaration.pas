unit uEMailConfiguaration;

interface

uses uIEmailConfiguration;

Type

  TEmailConfiguration = class(TInterfacedObject, IEmailConfiguration)
  private
    FHost: String;
    FUsername: String;
    FPassword: String;
    FPort: Integer;


  public
    procedure SetHost(const Value: string);
    procedure SetPort(const Value: Integer);
    procedure SetUsername(const Value: string);
    procedure SetPassword(const Value: string);

    function GetHost: String;
    function GetPort: Integer;
    function GetUsername: String;
    function GetPassword: String;

    property Host: String read GetHost write SetHost;
    property Port: Integer read GetPort write SetPort;
    property Username: String read GetUsername write SetUsername;
    property Password: String read GetPassword write SetPassword;
  end;

implementation

{ TEmailConfiguration }

function TEmailConfiguration.GetHost: String;
begin
  result := FHost;
end;

function TEmailConfiguration.GetPassword: String;
begin
  result := FPassword;
end;

function TEmailConfiguration.GetPort: Integer;
begin
  result := FPort;
end;

function TEmailConfiguration.GetUsername: String;
begin
  result := FUserName;
end;

procedure TEmailConfiguration.SetHost(const Value: string);
begin
  FHost := Value;
end;

procedure TEmailConfiguration.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TEmailConfiguration.SetPort(const Value: Integer);
begin
  FPort := Value;
end;

procedure TEmailConfiguration.SetUsername(const Value: string);
begin
  FUserName := Value;
end;

end.
