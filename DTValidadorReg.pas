unit DTValidadorReg;

interface

procedure Register;

implementation

uses
  System.Classes, DTValidador, Vcl.Dialogs;

procedure Register;
begin
  RegisterComponents('DT Inovacao', [TDTValidador]);
end;

end.
