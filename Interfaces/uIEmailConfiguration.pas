unit uIEmailConfiguration;

interface

Type

  IEmailConfiguration = Interface
  ['{525FB82E-1F20-45F2-BB4F-FD3B01A7D92E}']

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

end.
