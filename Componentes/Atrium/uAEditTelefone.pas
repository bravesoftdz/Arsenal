unit uAEditTelefone;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics, uAEdit,
  uAEditInteiro, System.RegularExpressions, System.StrUtils;

type
  TAEditTelefone = class(TAEditInteiro)
  private
    FPhone : String;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure ValidatePhone(Phone : String);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner : TComponent); override;
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Atrium', [TAEditTelefone]);
end;

{ TAEditTelefone }

constructor TAEditTelefone.Create(AOwner: TComponent);
begin
  inherited;
  Self.MaxLength := 11;
  Self.InvalidColor := clRed;
end;

procedure TAEditTelefone.DoEnter;
begin
  inherited;
  FPhone := StringReplace(Trim(Self.Text),'(', EmptyStr, [rfReplaceAll]);
  FPhone := StringReplace(FPhone,')', EmptyStr, [rfReplaceAll]);
  Self.Text := StringReplace(FPhone,'-', EmptyStr, [rfReplaceAll]);
end;

procedure TAEditTelefone.DoExit;
begin
  inherited;
  if Trim(Self.Text) <> EmptyStr then
    ValidatePhone(Trim(Self.Text))
  else
    Self.Invalid := False;
end;

procedure TAEditTelefone.ValidatePhone(Phone : String);
var
  Validar: TRegEx;
begin

  Validar.Create('^([0-9]{10,11})$');

  if Validar.IsMatch(Phone) then
  begin
    Self.Invalid := False;
    Self.Text := IfThen(Length(Phone) = 10, '('+ copy(Phone,1,2) + ') ' + copy(Phone,3,4) + '-' + copy(Phone,7,4), '('+ copy(Phone,1,2) + ') ' + copy(Phone,3,5) + '-' + copy(Phone,8,4))
  end
  else
    Self.Invalid := True;

end;

end.
