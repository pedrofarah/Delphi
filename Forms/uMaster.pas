unit uMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,   Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Vcl.Grids, Vcl.DBGrids, System.Rtti, Vcl.StdCtrls, Vcl.Buttons,
  System.Generics.Collections,

  uICliente, uCliente, uIEndereco, uEndereco, uRestService, uCEPService,
  uIREstService, uICEPService, uIEMailConfiguration,
  uISendEmailService, uEMailConfiguaration, uSendEmailService, uIEmailService,
  uEmailService, uIClienteService, uClienteService, uIXMLClienteService,
  uXMLClienteService, uIEmailMessage, uEMailMessage, uIClienteRepository,
  uClienteRepository, Vcl.Mask, uIRepositoryClienteService,
  uRepositoryClienteService, Datasnap.DBClient;

type
  TfrmMaster = class(TForm)
    BtnConsultarCEP: TBitBtn;
    BtnAdicionarCliente: TBitBtn;
    gridClientes: TDBGrid;
    dts: TDataSource;
    EdtIdentidade: TEdit;
    EdtNome: TEdit;
    EdtEMail: TEdit;
    LblCPF: TLabel;
    LblNome: TLabel;
    LblTelefone: TLabel;
    LblEMail: TLabel;
    LblIdentidade: TLabel;
    LblCEP: TLabel;
    LblLogradouro: TLabel;
    EdtLogradouro: TEdit;
    LblNumero: TLabel;
    EdtNumero: TEdit;
    LblComplemento: TLabel;
    EdtComplemento: TEdit;
    LblBairro: TLabel;
    EdtBairro: TEdit;
    LblCidade: TLabel;
    EdtCidade: TEdit;
    LblEstado: TLabel;
    CmbEstado: TComboBox;
    LblPais: TLabel;
    EdtPais: TEdit;
    EdtCEP: TMaskEdit;
    EdtCPF: TMaskEdit;
    EdtTelefone: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnConsultarCEPClick(Sender: TObject);
    procedure BtnAdicionarClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtCEPExit(Sender: TObject);
  private
    FREstService: IREstService;
    FCEPService: ICEPService;

    FClienteRepository: IClienteRepository;
    FEMailConfiguration: IEMailConfiguration;
    FSendEmailService: ISendEmailService;
    FEmailService: IEmailService;
    FXMLClienteService: IXMLClienteService;
    FRepositoryClienteService: IRepositoryClienteService;

    FClienteService: IClienteService;

    FClientDataSet: TClientDataSet;

    procedure ConsultarCEP(CEP: String);
    procedure PreencheEndereco(Endereco: IEndereco);
    procedure LimparCamposEndereco;
    procedure LimparCadastro;
    procedure GravarCliente;
    procedure ListarClientes;
  public

  end;

var
  frmMaster: TfrmMaster;

implementation

{$R *.dfm}

procedure TfrmMaster.BtnConsultarCEPClick(Sender: TObject);
begin
  ConsultarCEP(Trim(edtCEP.Text));
end;

procedure TfrmMaster.BtnAdicionarClienteClick(Sender: TObject);
begin

  try
    GravarCliente;
  except
    on E: Exception do
    begin
      Application.MessageBox(PWideChar(E.Message), PWideChar(Application.Title),
        MB_ICONERROR);
    end;
  end;

end;

procedure TfrmMaster.ConsultarCEP(CEP: String);
var endereco: IEndereco;
    strText: String;
begin
  try

    Screen.Cursor := crHourGlass;

    try

      strText := Trim(CEP);
      strText := strText.Replace('-', '');
      strText := strText.Replace('.', '');

      if (Trim(strText) = '') then
        Exit;

      endereco := FCEPService.Consultar(strText);

      if (endereco <> nil) then
      begin
        LimparCamposEndereco;
        PreencheEndereco(endereco);
        EdtNumero.SetFocus();
      end;

    finally
      Screen.Cursor := crDefault;
    end;

  except
    Application.MessageBox('Não foi possível consultar o CEP informado.',
      PWideChar(Application.Title), MB_ICONERROR);
  end;
end;

procedure TfrmMaster.EdtCEPExit(Sender: TObject);
begin
  if (Sender is TCustomEdit) then
    if Trim((Sender as TCustomEdit).Text) <> '' then
      ConsultarCEP(Trim((Sender as TCustomEdit).Text));
end;

procedure TfrmMaster.FormCreate(Sender: TObject);
begin

  KeyPreview := true;
  WindowState := wsNormal;
  Position := poScreenCenter;
  BorderStyle := bsSingle;
  BorderIcons := [biSystemMenu, biMinimize];
  Caption := Application.Title;

  //Instancia o servico de comunicacao REST
  FREstService := TREstService.Create();

  //Instancia o service de consulta de CEP
  FCEPService := TCEPService.Create(FREstService);

  //Instancia a classe de configuracao do servidor SMTP
  FEMailConfiguration := TEmailConfiguration.Create();
  FEMailConfiguration.Host := 'smtp.gmail.com';
  FEMailConfiguration.Port := 465;
  FEMailConfiguration.UserName := 'codert380@gmail.com';
  FEMailConfiguration.Password := 'teL@@!!741852';

  //Instancia o servico de comunicacao SMTP
  FSendEmailService := TSendEmailService.Create(FEMailConfiguration);

  //Instancia o servico de controle de envio de emails
  FEmailService := TEmailService.Create(FSendEmailService);

  //Instancia o servico de geracao de arquivos XML
  FXMLClienteService := TXMLClienteService.Create();

  //Instancia a classe repository de clientes
  FClienteRepository := TClienteRepository.Create();

  //Instancia o servico de cadastro de clientes
  FClienteService := TClienteService.Create(FClienteRepository, FEmailService,
    FXMLClienteService);

  //Instancia o servico de Binding da lista de clientes
  FRepositoryClienteService :=
    TRepositoryClienteService.Create(FClienteRepository);

end;

procedure TfrmMaster.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FClientDataSet);
  //Limpeza da memória fica a cargo do ARC
  FCEPService := nil;
  FREstService := nil;
  FSendEmailService := nil;
  FEMailConfiguration := nil;
  FEmailService := nil;
  FXMLClienteService := nil;
  FClienteRepository := nil;
  FClienteService := nil;
  FRepositoryClienteService := nil;
end;

procedure TfrmMaster.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmMaster.FormShow(Sender: TObject);
begin
  ListarClientes;
end;

procedure TfrmMaster.GravarCliente;
var cliente: ICliente;
    EMailMessage: IEMailMessage;
begin
  try

    Screen.Cursor := crHourGlass;

    try

      cliente := TCliente.Create();
      cliente.Nome := EdtNome.Text;
      cliente.CPF := EdtCPF.Text;
      cliente.Identidade := EdtIdentidade.Text;
      cliente.Telefone := EdtTelefone.Text;
      cliente.Email := EdtEMail.Text;
      cliente.Endereco := TEndereco.Create();
      cliente.Endereco.CEP := EdtCEP.Text;
      cliente.Endereco.Logradouro := EdtLogradouro.Text;
      cliente.Endereco.Numero := EdtNumero.Text;
      cliente.Endereco.Complemento := EdtComplemento.Text;
      cliente.Endereco.Bairro := EdtBairro.Text;
      cliente.Endereco.Cidade := EdtCidade.Text;
      cliente.Endereco.Estado := CmbEstado.Text;
      cliente.Endereco.Pais := EdtPais.Text;

      EMailMessage := TEMailMessage.Create();
      EMailMessage.Sender := FEMailConfiguration.UserName;

      FClienteService.AdicionarCliente(cliente, EMailMessage);

      Application.MessageBox('Cliente cadastrado com sucesso.',
        PWideChar(Application.Title), MB_ICONINFORMATION + MB_OK);

      LimparCadastro;

      ListarClientes;

      EdtCPF.SetFocus();

    finally
      Screen.Cursor := crDefault;
    end;

  except
    raise;
  end;

end;

procedure TfrmMaster.LimparCadastro;
begin
  EdtCPF.Clear;
  EdtIdentidade.Clear;
  EdtNome.Clear;
  EdtTelefone.Clear;
  EdtEMail.Clear;
  LimparCamposEndereco;
end;

procedure TfrmMaster.LimparCamposEndereco;
begin
  EdtCEP.Clear;
  EdtLogradouro.Clear;
  EdtNumero.Clear;
  EdtComplemento.Clear;
  EdtBairro.Clear;
  EdtCidade.Clear;
  CmbEstado.ItemIndex := -1;
  EdtPais.Clear;
end;

procedure TfrmMaster.ListarClientes;
begin
  FreeAndNil(FClientDataSet);
  FClientDataSet := FRepositoryClienteService.ListToDataSet;
  dts.DataSet := FClientDataSet;
end;

procedure TfrmMaster.PreencheEndereco(Endereco: IEndereco);
begin
  EdtCEP.Text := Endereco.CEP;
  EdtLogradouro.Text := Endereco.Logradouro;
  EdtBairro.Text := Endereco.Bairro;
  EdtCidade.Text := Endereco.Cidade;
  CmbEstado.ItemIndex := CmbEstado.Items.IndexOf(UpperCase(Endereco.Estado));
end;

end.
