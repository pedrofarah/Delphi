program PedroFarah;

uses
  Vcl.Forms,
  uMaster in 'forms\uMaster.pas' {frmMaster},
  uICliente in 'interfaces\uICliente.pas',
  uCliente in 'models\uCliente.pas',
  uIEndereco in 'Interfaces\uIEndereco.pas',
  uEndereco in 'Models\uEndereco.pas',
  uIClienteService in 'Interfaces\uIClienteService.pas',
  uICEPService in 'Interfaces\uICEPService.pas',
  uCEPService in 'Services\uCEPService.pas',
  uIRestService in 'Interfaces\uIRestService.pas',
  uRestService in 'Services\uRestService.pas',
  uIEmailService in 'Interfaces\uIEmailService.pas',
  uEmailService in 'Services\uEmailService.pas',
  uIEmailMessage in 'Interfaces\uIEmailMessage.pas',
  uEMailMessage in 'Models\uEMailMessage.pas',
  uIEmailConfiguration in 'Interfaces\uIEmailConfiguration.pas',
  uEMailConfiguaration in 'Models\uEMailConfiguaration.pas',
  uSendEmailService in 'Services\uSendEmailService.pas',
  uISendEmailService in 'Interfaces\uISendEmailService.pas',
  uClienteService in 'Services\uClienteService.pas',
  uIArquivoXML in 'Interfaces\uIArquivoXML.pas',
  uArquivoXML in 'Models\uArquivoXML.pas',
  uXMLClienteService in 'Services\uXMLClienteService.pas',
  uIXMLClienteService in 'Interfaces\uIXMLClienteService.pas',
  uClienteRepository in 'Repository\uClienteRepository.pas',
  uIClienteRepository in 'Interfaces\uIClienteRepository.pas',
  uCEP in 'Models\uCEP.pas',
  uRepositoryClienteService in 'Services\uRepositoryClienteService.pas',
  uIRepositoryClienteService in 'Interfaces\uIRepositoryClienteService.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Projeto Teste - Pedro Farah (14) 99103.0770';
  Application.CreateForm(TfrmMaster, frmMaster);
  Application.Run;
end.
