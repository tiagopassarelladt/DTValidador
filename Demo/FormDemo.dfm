object FormValidador: TFormValidador
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Validador de Documentos'
  ClientHeight = 250
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 250
    Align = alClient
    TabOrder = 0
    object LabelTitulo: TLabel
      Left = 88
      Top = 24
      Width = 323
      Height = 25
      Caption = 'Validador de Documentos Brasileiros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelResultado: TLabel
      Left = 88
      Top = 176
      Width = 323
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EditDocumento: TEdit
      Left = 88
      Top = 112
      Width = 233
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = EditDocumentoChange
    end
    object ComboBoxTipo: TComboBox
      Left = 88
      Top = 72
      Width = 323
      Height = 25
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = ComboBoxTipoChange
    end
    object ButtonValidar: TButton
      Left = 336
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Validar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonValidarClick
    end
  end
  object DTValidador1: TDTValidador
    OnValidate = DTValidador1Validate
    Left = 24
    Top = 16
  end
end
