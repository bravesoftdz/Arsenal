unit uClasses;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, PngSpeedButton,
  Vcl.StdCtrls, PngBitBtn, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, uADStanExprFuncs, uADGUIxIntf,
  uADGUIxFormsWait, uADStanIntf, uADStanOption, uADStanError, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, uADStanParam,
  uADDatSManager, uADDAptIntf, uADDAptManager, Data.DB, uADCompDataSet,
  uADCompClient, uADCompGUIx, uADPhysSQLite, uDmPrincipal;

type
  TMensagens = class
    procedure MensagemInformacao(AMensagem: String);
    procedure MensagemErro(AMensagem: string);
    function MensagemConfirmacao(AMensagem: String): Boolean;
    
  end;

  TQuery = class
    private
      FConnection: TADConnection;

      function GetQry: TADQuery;

    public
      constructor Create;

      function getSequenceAtleta: TADQuery;
      function InserirAtleta: TADQuery;
      function ExcluirAtleta: TADQuery;

  end;

  TAtleta = class
    private
    FOrgaoExpeditor: String;
    FRG: String;
    FDataNascimento: TDate;
    FEmail: String;
    FCodigoClube: Integer;
    FCodigo: Integer;
    FCPF: String;
    FStatus: Integer;
    FNome: String;
    FTelefone: String;

    FQueryAtleta: TQuery;
    
    public
      constructor Create;
      procedure CadastrarAtleta;
      function setSequenceAtleta: Integer;
      procedure ExcluirAtleta;

    published
      property Codigo         : Integer read FCodigo         write FCodigo         ;
      property CodigoClube    : Integer read FCodigoClube    write FCodigoClube    ;
      property Nome           : String  read FNome           write FNome           ;
      property Email          : String  read FEmail          write FEmail          ;
      property Telefone       : String read FTelefone       write FTelefone       ;
      property DataNascimento : TDate   read FDataNascimento write FDataNascimento ;
      property RG             : String  read FRG             write FRG             ;
      property OrgaoExpeditor : String  read FOrgaoExpeditor write FOrgaoExpeditor ;
      property CPF            : String  read FCPF            write FCPF            ;
      property Status         : Integer read FStatus         write FStatus         ;

  end;

implementation

{ TQuery }

constructor TQuery.Create;
begin
  FConnection := dmPrincipal.Conexao;
end;

function TQuery.ExcluirAtleta: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' update Atleta ');
    SQL.Add(' set status = 3 ');
    SQL.Add(' where id = :id ');
  
  end;

end;

function TQuery.GetQry: TADQuery;
begin
  Result := TADQuery.Create(nil);
  Result.Connection := FConnection;
end;

function TQuery.getSequenceAtleta: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select * from sqlite_sequence where name = ''Atleta'' ');

  end;

end;

function TQuery.InserirAtleta: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' insert into Atleta ');
    SQL.Add('   (id ');
    SQL.Add('   ,id_clube ');
    SQL.Add('   ,nome ');
    SQL.Add('   ,email ');
    SQL.Add('   ,telefone ');
    SQL.Add('   ,data_nascimento ');
    SQL.Add('   ,rg ');
    SQL.Add('   ,orgao_expeditor ');
    SQL.Add('   ,cpf ');
    SQL.Add('   ,status) ');
    SQL.Add(' values   (:id ');
    SQL.Add(' 		 ,:id_clube ');
    SQL.Add(' 		 ,:nome ');
    SQL.Add(' 		 ,:email ');
    SQL.Add(' 		 ,:telefone ');
    SQL.Add(' 		 ,:data_nascimento ');
    SQL.Add(' 		 ,:rg ');
    SQL.Add(' 		 ,:orgao_expeditor ');
    SQL.Add(' 		 ,:cpf ');
    SQL.Add(' 		 ,:status) ');

  end;


end;

{ TMensagens }

function TMensagens.MensagemConfirmacao(AMensagem: String): Boolean;
begin
  Result := Application.MessageBox(pChar(AMensagem), 'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes;
end;

procedure TMensagens.MensagemErro(AMensagem: string);
begin
  Application.MessageBox(pChar(AMensagem), 'Erro', MB_ICONERROR + MB_OK);
end;

procedure TMensagens.MensagemInformacao(AMensagem: String);
begin
  Application.MessageBox(pChar(AMensagem), 'Informação', MB_ICONINFORMATION + MB_OK);
end;

{ TAtleta }

procedure TAtleta.CadastrarAtleta;
var
  qryCadastrarAtleta: TADQuery;
begin

  qryCadastrarAtleta := FQueryAtleta.InserirAtleta;

  try
  
    try
    
      qryCadastrarAtleta.ParamByName('ID').AsInteger := Codigo;
      qryCadastrarAtleta.ParamByName('ID_CLUBE').AsInteger := CodigoClube;
      qryCadastrarAtleta.ParamByName('NOME').AsString := Nome;
      qryCadastrarAtleta.ParamByName('EMAIL').AsString := Email;
      qryCadastrarAtleta.ParamByName('TELEFONE').AsString := Telefone;
      qryCadastrarAtleta.ParamByName('DATA_NASCIMENTO').AsDateTime := DataNascimento;
      qryCadastrarAtleta.ParamByName('RG').AsString := RG;
      qryCadastrarAtleta.ParamByName('ORGAO_EXPEDITOR').AsString := OrgaoExpeditor;
      qryCadastrarAtleta.ParamByName('CPF').AsString := CPF;
      qryCadastrarAtleta.ParamByName('STATUS').AsInteger := Status;

      qryCadastrarAtleta.ExecSQL;

    except
      on e: Exception do
        raise Exception.Create('Erro ao cadastrar atleta.' + sLineBreak + 'Motivo: ' + sLineBreak + e.Message);                
    
    end;

    
  finally

    FreeAndNil(qryCadastrarAtleta);
  
  end;

end;

constructor TAtleta.Create;
begin

  if not Assigned(FQueryAtleta) then
    FQueryAtleta := TQuery.Create;

end;

procedure TAtleta.ExcluirAtleta;
var
  qryExcluirAtleta: TADQuery;
begin

  qryExcluirAtleta := FQueryAtleta.ExcluirAtleta;

  try
  
    try
    
      qryExcluirAtleta.ParamByName('ID').AsInteger := Codigo;

      qryExcluirAtleta.ExecSQL;    
  
    except
      on E: Exception do
        raise Exception.Create('Erro ao excluir Atleta.' + sLineBreak + 'Motivo: ' + sLineBreak + e.Message);
  
    end;
    
  finally    
  
    FreeAndNil(qryExcluirAtleta);
  
  end;



end;

function TAtleta.setSequenceAtleta: Integer;
var
  qrySequenciaAtleta: TADQuery;
begin

  qrySequenciaAtleta := FQueryAtleta.getSequenceAtleta;

  try
  
    qrySequenciaAtleta.Open;

    if qrySequenciaAtleta.RecordCount > 0 then
      Result := qrySequenciaAtleta.FieldByName('SEQ').AsInteger + 1
    else
      Result := 1;  
  
  finally

    FreeAndNil(qrySequenciaAtleta);
  
  end;

end;

end.

