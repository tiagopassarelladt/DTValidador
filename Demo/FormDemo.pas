unit FormDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, 
  DTValidador;

type
  TFormValidador = class(TForm)
    Panel1: TPanel;
    LabelTitulo: TLabel;
    EditDocumento: TEdit;
    ComboBoxTipo: TComboBox;
    ButtonValidar: TButton;
    LabelResultado: TLabel;
    DTValidador1: TDTValidador;
    procedure FormCreate(Sender: TObject);
    procedure ButtonValidarClick(Sender: TObject);
    procedure ComboBoxTipoChange(Sender: TObject);
    procedure EditDocumentoChange(Sender: TObject);
    procedure DTValidador1Validate(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarPlaceholder;
  public
    { Public declarations }
  end;

var
  FormValidador: TFormValidador;

implementation

{$R *.dfm}

procedure TFormValidador.FormCreate(Sender: TObject);
begin
  ComboBoxTipo.Items.Add('CPF');
  ComboBoxTipo.Items.Add('CNPJ');
  ComboBoxTipo.Items.Add('CNPJ Alfanumérico');
  ComboBoxTipo.ItemIndex := 0;
  
  AtualizarPlaceholder;
  LabelResultado.Caption := '';
end;

procedure TFormValidador.AtualizarPlaceholder;
begin
  case ComboBoxTipo.ItemIndex of
    0: EditDocumento.TextHint := 'Digite o CPF (Ex: 123.456.789-00)';
    1: EditDocumento.TextHint := 'Digite o CNPJ (Ex: 12.345.678/0001-95)';
    2: EditDocumento.TextHint := 'Digite o CNPJ Alfanumérico (Ex: A1.B2C.3D4/1A2B-99)';
  end;
end;

procedure TFormValidador.ComboBoxTipoChange(Sender: TObject);
begin
  AtualizarPlaceholder;
  EditDocumento.Text := '';
  LabelResultado.Caption := '';
end;

procedure TFormValidador.EditDocumentoChange(Sender: TObject);
begin
  LabelResultado.Caption := '';
end;

procedure TFormValidador.ButtonValidarClick(Sender: TObject);
begin
  if Trim(EditDocumento.Text) = '' then
  begin
    ShowMessage('Por favor, digite um documento para validar.');
    Exit;
  end;
  
  DTValidador1.Document := EditDocumento.Text;
  
  case ComboBoxTipo.ItemIndex of
    0: DTValidador1.DocumentType := dtCPF;
    1: DTValidador1.DocumentType := dtCNPJ;
    2: DTValidador1.DocumentType := dtCNPJAlfanumerico;
  end;
  
  DTValidador1.Validate;
end;

procedure TFormValidador.DTValidador1Validate(Sender: TObject);
begin
  if DTValidador1.IsValid then
  begin
    LabelResultado.Caption := 'Documento válido!';
    LabelResultado.Font.Color := clGreen;
  end
  else
  begin
    LabelResultado.Caption := 'Documento inválido: ' + DTValidador1.LastError;
    LabelResultado.Font.Color := clRed;
  end;
end;

end.
