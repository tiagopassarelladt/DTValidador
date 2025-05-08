program ValidadorTest;

uses
  Vcl.Forms,
  UnitTeste in 'UnitTeste.pas' {FormTeste},
  DTValidador in 'DTValidador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormTeste, FormTeste);
  Application.Run;
end.
