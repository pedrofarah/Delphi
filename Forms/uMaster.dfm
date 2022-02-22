object frmMaster: TfrmMaster
  Left = 0
  Top = 0
  Caption = 'frmMaster'
  ClientHeight = 497
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblCPF: TLabel
    Left = 19
    Top = 21
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object LblNome: TLabel
    Left = 19
    Top = 47
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object LblTelefone: TLabel
    Left = 19
    Top = 74
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object LblEMail: TLabel
    Left = 19
    Top = 101
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object LblIdentidade: TLabel
    Left = 226
    Top = 20
    Width = 52
    Height = 13
    Caption = 'Identidade'
  end
  object LblCEP: TLabel
    Left = 19
    Top = 128
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object LblLogradouro: TLabel
    Left = 19
    Top = 155
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object LblNumero: TLabel
    Left = 19
    Top = 182
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object LblComplemento: TLabel
    Left = 163
    Top = 182
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object LblBairro: TLabel
    Left = 19
    Top = 209
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object LblCidade: TLabel
    Left = 19
    Top = 236
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object LblEstado: TLabel
    Left = 300
    Top = 236
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object LblPais: TLabel
    Left = 19
    Top = 264
    Width = 19
    Height = 13
    Caption = 'Pa'#237's'
  end
  object BtnConsultarCEP: TBitBtn
    Left = 205
    Top = 123
    Width = 75
    Height = 23
    Caption = 'Consultar CEP'
    TabOrder = 6
    TabStop = False
    OnClick = BtnConsultarCEPClick
  end
  object BtnAdicionarCliente: TBitBtn
    Left = 19
    Top = 293
    Width = 110
    Height = 25
    Caption = 'Adicionar cliente'
    TabOrder = 14
    OnClick = BtnAdicionarClienteClick
  end
  object gridClientes: TDBGrid
    Left = 0
    Top = 328
    Width = 747
    Height = 169
    Align = alBottom
    DataSource = dts
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CPF'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 279
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estado'
        Width = 62
        Visible = True
      end>
  end
  object EdtIdentidade: TEdit
    Left = 288
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object EdtNome: TEdit
    Left = 78
    Top = 43
    Width = 331
    Height = 21
    TabOrder = 2
  end
  object EdtEMail: TEdit
    Left = 78
    Top = 97
    Width = 331
    Height = 21
    TabOrder = 4
  end
  object EdtLogradouro: TEdit
    Left = 78
    Top = 151
    Width = 331
    Height = 21
    TabOrder = 7
  end
  object EdtNumero: TEdit
    Left = 78
    Top = 178
    Width = 67
    Height = 21
    TabOrder = 8
  end
  object EdtComplemento: TEdit
    Left = 237
    Top = 178
    Width = 172
    Height = 21
    TabOrder = 9
  end
  object EdtBairro: TEdit
    Left = 78
    Top = 205
    Width = 331
    Height = 21
    TabOrder = 10
  end
  object EdtCidade: TEdit
    Left = 78
    Top = 232
    Width = 211
    Height = 21
    TabOrder = 11
  end
  object CmbEstado: TComboBox
    Left = 342
    Top = 232
    Width = 67
    Height = 21
    Style = csDropDownList
    TabOrder = 12
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PR'
      'PB'
      'PA'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SE'
      'SP'
      'TO')
  end
  object EdtPais: TEdit
    Left = 78
    Top = 260
    Width = 211
    Height = 21
    TabOrder = 13
  end
  object EdtCEP: TMaskEdit
    Left = 78
    Top = 124
    Width = 119
    Height = 21
    EditMask = '99.999\-999;0; '
    MaxLength = 10
    TabOrder = 5
    Text = ''
    OnExit = EdtCEPExit
  end
  object EdtCPF: TMaskEdit
    Left = 78
    Top = 16
    Width = 117
    Height = 21
    EditMask = '999.999.999\-99;0; '
    MaxLength = 14
    TabOrder = 0
    Text = ''
  end
  object EdtTelefone: TMaskEdit
    Left = 78
    Top = 70
    Width = 114
    Height = 21
    EditMask = '!\(99\)99999-9999;0; '
    MaxLength = 14
    TabOrder = 3
    Text = ''
  end
  object dts: TDataSource
    AutoEdit = False
    Left = 504
    Top = 352
  end
end
