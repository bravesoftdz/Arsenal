unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, PngSpeedButton,
  Vcl.StdCtrls, PngBitBtn, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, uClasses, uDmPrincipal, uAEdit, uAEditInteiro,
  uAEditCPF, uAEditData, uAEditTelefone, uAEditEmail, Vcl.DBCtrls,
  Vcl.ImgList, Vcl.Menus, uAEditReal;

type
  EAcao = (stCadastrar, stAlterar);
  TfrmPrincipal = class(TForm)
    pnlMenuLateral: TPanel;
    btnSair: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    PngBitBtn3: TPngBitBtn;
    btnFichaAtleta: TPngBitBtn;
    btnAtletas: TPngBitBtn;
    btnInicio: TPngBitBtn;
    pnlPrincipal: TPanel;
    pnlExpansor: TPanel;
    btnExpansor: TPngSpeedButton;
    pcPrincipal: TPageControl;
    tbInicio: TTabSheet;
    imgInicio: TImage;
    tbAtleta: TTabSheet;
    pnlAtleta: TPanel;
    pcAtleta: TPageControl;
    pnlMenuAtleta: TPanel;
    tbListaAtletas: TTabSheet;
    tbDadosAtleta: TTabSheet;
    btnSairAtleta: TPngBitBtn;
    dbgrdListaAtletas: TDBGrid;
    btnNovoAtleta: TPngBitBtn;
    btnGravarAtleta: TPngBitBtn;
    btnAlterarAtleta: TPngBitBtn;
    btnCancelarAtleta: TPngBitBtn;
    btnExcluirAtleta: TPngBitBtn;
    pnlDadosPessoaisAtletas: TPanel;
    gbDadosPessoaisAtletas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtNome: TAEdit;
    edtEmail: TAEditEmail;
    pnlDadosAtletas: TPanel;
    gbPosicoesAtleta: TGroupBox;
    tvPosicoes: TTreeView;
    imgTreeViewPosicoes: TImageList;
    pnlIncluirPosicao: TPanel;
    lblPosicao: TLabel;
    dblkpPosicao: TDBLookupComboBox;
    ckbPosicaoPrincipal: TCheckBox;
    btnIncluirPosicao: TPngSpeedButton;
    pnlLegendaPosicao: TPanel;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label8: TLabel;
    Image2: TImage;
    Label9: TLabel;
    ppmTreeView: TPopupMenu;
    Excluirposio1: TMenuItem;
    imgListPopup: TImageList;
    pnlTelefoneAtleta: TPanel;
    edtTelefone: TAEditTelefone;
    Label3: TLabel;
    pnlDocumentoAtleta: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtRG: TAEditInteiro;
    edtOrgaoExpeditor: TAEdit;
    pnlCPFAtleta: TPanel;
    edtCPF: TAEditCPF;
    pnlNascimentoAtleta: TPanel;
    dtDataNascimento: TDateTimePicker;
    pnlStatusAtleta: TPanel;
    rgStatus: TRadioGroup;
    tbFichaAtleta: TTabSheet;
    pnlFichaAtlelas: TPanel;
    pcFichasAtleta: TPageControl;
    tbListaFichasAtleta: TTabSheet;
    dbGridListaFichas: TDBGrid;
    tbDetalhesFichaAtleta: TTabSheet;
    pnlMenuFichas: TPanel;
    btnSairFichas: TPngBitBtn;
    btnAbaListaFicha: TPngBitBtn;
    btnAbaDetalhesFicha: TPngBitBtn;
    pnlUltimaMedicao: TPanel;
    Panel3: TPanel;
    pnlMelhorMedicao: TPanel;
    Panel4: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label10: TLabel;
    edtNomeFicha: TAEdit;
    Label18: TLabel;
    dtDataFicha: TDateTimePicker;
    Image3: TImage;
    lblAtletaFicha: TLabel;
    Image4: TImage;
    Label33: TLabel;
    Image5: TImage;
    Label34: TLabel;
    Image6: TImage;
    Label35: TLabel;
    edtMelhorAltura: TAEditReal;
    edtMelhorPeso: TAEditReal;
    edtMelhorSaltoVertical: TAEditReal;
    edtMelhor40Jardas: TAEditReal;
    edtMelhorSaltoHorizontal: TAEditReal;
    edtMelhorShuttle: TAEditReal;
    edtMelhor3Cones: TAEditReal;
    Label11: TLabel;
    edtUltimaAltura: TAEditReal;
    Label12: TLabel;
    edtUltimoPeso: TAEditReal;
    Label13: TLabel;
    edtUltimoSaltoVertical: TAEditReal;
    Label14: TLabel;
    edtUltimo40Jardas: TAEditReal;
    Label15: TLabel;
    edtUltimoSaltoHorizontal: TAEditReal;
    Label16: TLabel;
    edtUltimoShuttle: TAEditReal;
    edtUltimo3Cones: TAEditReal;
    Label17: TLabel;
    Label26: TLabel;
    edtAltura: TAEditReal;
    Label27: TLabel;
    edtPeso: TAEditReal;
    Label28: TLabel;
    edtSaltoVertical: TAEditReal;
    Label29: TLabel;
    edt40Jardas: TAEditReal;
    Label30: TLabel;
    edtSaltoHorizontal: TAEditReal;
    Label31: TLabel;
    edtShuttle: TAEditReal;
    edt3Cones: TAEditReal;
    Label32: TLabel;
    btnLimparFicha: TPngSpeedButton;
    btnAdicionarFicha: TPngSpeedButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label36: TLabel;
    edtUltimoIMC: TAEditReal;
    Label37: TLabel;
    edtMelhorIMC: TAEditReal;
    procedure btnExpansorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInicioClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAtletasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairAtletaClick(Sender: TObject);
    procedure btnNovoAtletaClick(Sender: TObject);
    procedure btnAlterarAtletaClick(Sender: TObject);
    procedure btnGravarAtletaClick(Sender: TObject);
    procedure btnCancelarAtletaClick(Sender: TObject);
    procedure dbgrdListaAtletasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnExcluirAtletaClick(Sender: TObject);
    procedure btnIncluirPosicaoClick(Sender: TObject);
    procedure ckbPosicaoPrincipalClick(Sender: TObject);
    procedure Excluirposio1Click(Sender: TObject);
    procedure btnSairFichaAtletaClick(Sender: TObject);
    procedure btnSairFichasClick(Sender: TObject);
    procedure btnFichaAtletaClick(Sender: TObject);
    procedure btnAbaListaFichaClick(Sender: TObject);
    procedure btnAbaDetalhesFichaClick(Sender: TObject);
  private
    FMensagens: TMensagens;
    FDadosAtleta: TAtleta;
    FAcao: EAcao;
    procedure Expansor();
    procedure OcultarSheets();
    procedure EncerrarAplicacao();
    procedure HabilitarCrudAtleta(AHabilitar: Boolean);
    procedure CarregarInformacoes();
    procedure GravarDadosAtleta();
    procedure AbrirQueryAtletas();
    procedure AbrirQueryPosicoesAtleta();
    procedure LimparCampos();
    procedure MontarTreeViewPosicoes;

    function ValidarDadosAtletaObrigatorio: Boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

var
  Dados: TQuery;

{$R *.dfm}

procedure TfrmPrincipal.AbrirQueryAtletas;
begin

  dmPrincipal.qryListaAtletas.Close;
  dmPrincipal.qryListaAtletas.Open;

end;

procedure TfrmPrincipal.AbrirQueryPosicoesAtleta;
begin

  dmPrincipal.qryPosicoes.Close;
  dmPrincipal.qryPosicoes.ParamByName('atleta').AsInteger := FDadosAtleta.Codigo;
  dmPrincipal.qryPosicoes.Open;

end;

procedure TfrmPrincipal.btnAlterarAtletaClick(Sender: TObject);
begin

  HabilitarCrudAtleta(True);
  pcAtleta.ActivePage := tbDadosAtleta;
  AbrirQueryPosicoesAtleta();
  MontarTreeViewPosicoes();
  FAcao := stAlterar;

end;

procedure TfrmPrincipal.btnAtletasClick(Sender: TObject);
begin
  pcPrincipal.ActivePage := tbAtleta;
  pcAtleta.ActivePage := tbListaAtletas;
  AbrirQueryAtletas();
  HabilitarCrudAtleta(False);
end;

procedure TfrmPrincipal.btnCancelarAtletaClick(Sender: TObject);
begin
  HabilitarCrudAtleta(False);
  pcAtleta.ActivePage := tbListaAtletas;
end;

procedure TfrmPrincipal.btnExcluirAtletaClick(Sender: TObject);
begin

  if not FMensagens.MensagemConfirmacao('Confirma excluir atleta?') then
    Exit;

  try

    FDadosAtleta.ExcluirAtleta;
    AbrirQueryAtletas;
    HabilitarCrudAtleta(False);

  except
    on e:Exception do
      FMensagens.MensagemErro(e.Message);

  end;

end;

procedure TfrmPrincipal.btnExpansorClick(Sender: TObject);
begin
  Expansor();
end;

procedure TfrmPrincipal.btnFichaAtletaClick(Sender: TObject);
begin
  pcPrincipal.ActivePage := tbFichaAtleta;

  AbrirQueryAtletas();

  pcFichasAtleta.ActivePage := tbListaFichasAtleta;

end;

procedure TfrmPrincipal.btnGravarAtletaClick(Sender: TObject);
begin

  if ValidarDadosAtletaObrigatorio then
    Exit;

  try

    GravarDadosAtleta();

    AbrirQueryAtletas();
    HabilitarCrudAtleta(False);
    pcAtleta.ActivePage := tbListaAtletas;

  except
    on e:Exception do
      FMensagens.MensagemErro(e.Message);

  end;

end;

procedure TfrmPrincipal.btnIncluirPosicaoClick(Sender: TObject);
begin

  try

    if dblkpPosicao.Text = EmptyStr then
    begin
      FMensagens.MensagemInformacao('Informe a "Posi��o para adicionar.');
      dblkpPosicao.SetFocus;
      Exit;
    end;

    FDadosAtleta.CodigoPosicao := dblkpPosicao.KeyValue;

    if ckbPosicaoPrincipal.Checked then
      FDadosAtleta.PosicaoPrincipal := 'S'
    else
      FDadosAtleta.PosicaoPrincipal := 'N';

    FDadosAtleta.AdicionarPosicaoJogador;

    AbrirQueryPosicoesAtleta;
    MontarTreeViewPosicoes;

  except
    on e: Exception do
    begin

      if pos('foreign key', e.Message) > 0 then
        FMensagens.MensagemInformacao('Para adicionar as posi��es � necess�rio "Gravar" o cadastro do atleta!')
      else
        FMensagens.MensagemErro(e.Message);

    end;


  end;

end;

procedure TfrmPrincipal.btnInicioClick(Sender: TObject);
begin

  pcPrincipal.ActivePage := tbInicio;

end;

procedure TfrmPrincipal.btnNovoAtletaClick(Sender: TObject);
begin
  HabilitarCrudAtleta(True);
  pcAtleta.ActivePage := tbDadosAtleta;
  LimparCampos();

  FAcao := stCadastrar;

  if Assigned(FDadosAtleta) then
  begin
    FreeAndNil(FDadosAtleta);

    FDadosAtleta := TAtleta.Create;

  end;

  FDadosAtleta.Codigo := FDadosAtleta.setSequenceAtleta();
  AbrirQueryPosicoesAtleta();

end;

procedure TfrmPrincipal.btnSairAtletaClick(Sender: TObject);
begin

  pcPrincipal.ActivePage := tbInicio;
  pcAtleta.ActivePage := tbListaAtletas;

end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin

  EncerrarAplicacao();

end;

procedure TfrmPrincipal.btnSairFichaAtletaClick(Sender: TObject);
begin
  pcPrincipal.ActivePage := tbInicio;

end;

procedure TfrmPrincipal.btnSairFichasClick(Sender: TObject);
begin
  pcPrincipal.ActivePage := tbInicio;
  pcFichasAtleta.ActivePage := tbListaFichasAtleta;
end;

procedure TfrmPrincipal.CarregarInformacoes;
begin
  //Carregar Classe Atleta;
  FDadosAtleta.Codigo := dmPrincipal.qryListaAtletasid.AsInteger;
  FDadosAtleta.CodigoClube := dmPrincipal.qryListaAtletasid_clube.AsInteger;
  FDadosAtleta.Nome := dmPrincipal.qryListaAtletasnome.AsString;
  FDadosAtleta.Email := dmPrincipal.qryListaAtletasemail.AsString;
  FDadosAtleta.Telefone := dmPrincipal.qryListaAtletastelefone.AsString;
  FDadosAtleta.DataNascimento := dmPrincipal.qryListaAtletasdata_nascimento.AsDateTime;
  FDadosAtleta.RG := dmPrincipal.qryListaAtletasrg.AsString;
  FDadosAtleta.OrgaoExpeditor := dmPrincipal.qryListaAtletasorgao_expeditor.AsString;
  FDadosAtleta.CPF := dmPrincipal.qryListaAtletascpf.AsString;
  FDadosAtleta.Status := dmPrincipal.qryListaAtletasstatus.AsInteger;

  //Atribuir Valores aos campos
  edtNome.Text := FDadosAtleta.Nome;
  edtEmail.Text := FDadosAtleta.Email;
  edtTelefone.Text:= FDadosAtleta.Telefone;
  edtRG.Text := FDadosAtleta.RG;
  edtOrgaoExpeditor.Text := FDadosAtleta.OrgaoExpeditor;
  edtCPF.Text := FDadosAtleta.CPF;
  dtDataNascimento.Date := FDadosAtleta.DataNascimento;


end;

procedure TfrmPrincipal.ckbPosicaoPrincipalClick(Sender: TObject);
begin

  if ckbPosicaoPrincipal.Checked then
    if FDadosAtleta.ExistePosicaoPrincipal then
    begin
      FMensagens.MensagemInformacao('O atleta s� pode ter uma posi��o principal!');
      ckbPosicaoPrincipal.Checked := False;
      Exit;
    end;

end;

procedure TfrmPrincipal.dbgrdListaAtletasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  CarregarInformacoes;
end;

procedure TfrmPrincipal.EncerrarAplicacao;
begin

  if FMensagens.MensagemConfirmacao('Encerrar aplica��o?') then
    Application.Terminate
  else
    DefocusControl(TBitBtn(ActiveControl), True);

end;

procedure TfrmPrincipal.Excluirposio1Click(Sender: TObject);
begin

  try

    FDadosAtleta.CodigoPosicao := TPosicoesAtleta(tvPosicoes.Selected.Data).CodigoPosicao;
    FDadosAtleta.ExcluirPosicaoJogador;

    tvPosicoes.Items.Delete(tvPosicoes.Selected);

    AbrirQueryPosicoesAtleta;

  except
    on e: Exception do
      FMensagens.MensagemErro(e.Message);

  end;
end;

procedure TfrmPrincipal.Expansor;
begin
  if pnlMenuLateral.Width = pnlMenuLateral.Constraints.MaxWidth then
    pnlMenuLateral.Width := pnlMenuLateral.Constraints.MinWidth
  else
    pnlMenuLateral.Width := pnlMenuLateral.Constraints.MaxWidth;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  if not Assigned(Dados) then
    Dados := TQuery.Create;

  FDadosAtleta := TAtleta.Create;

end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin

  if Assigned(Dados) then
    FreeAndNil(Dados);


  if Assigned(FDadosAtleta) then
    FreeAndNil(FDadosAtleta);

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  OcultarSheets();

  pcPrincipal.ActivePage := tbInicio;

  AbrirQueryAtletas();

end;

procedure TfrmPrincipal.GravarDadosAtleta;
begin

  case FAcao of
    stCadastrar:
    begin

      FDadosAtleta.CodigoClube := 1;
      FDadosAtleta.Nome := Trim(edtNome.Text);
      FDadosAtleta.Email := Trim(edtEmail.Text);
      FDadosAtleta.Telefone := Trim(edtTelefone.Text);
      FDadosAtleta.RG := Trim(edtRG.Text);
      FDadosAtleta.OrgaoExpeditor := Trim(edtOrgaoExpeditor.Text);
      FDadosAtleta.CPF := Trim(edtCPF.Text);
      FDadosAtleta.DataNascimento := dtDataNascimento.Date;
      FDadosAtleta.Status := rgStatus.ItemIndex;

      FDadosAtleta.CadastrarAtleta;

    end;
    stAlterar:
    begin

    end;
  end;



end;

procedure TfrmPrincipal.HabilitarCrudAtleta(AHabilitar: Boolean);
begin

  btnNovoAtleta.Enabled := not (AHabilitar);
  btnAlterarAtleta.Enabled := (not (AHabilitar)) and (dbgrdListaAtletas.DataSource.DataSet.RecordCount > 0);
  btnGravarAtleta.Enabled := AHabilitar;
  btnCancelarAtleta.Enabled := AHabilitar;
  btnExcluirAtleta.Enabled := (not (AHabilitar)) and (dbgrdListaAtletas.DataSource.DataSet.RecordCount > 0);
  btnSairAtleta.Enabled := not (AHabilitar);

end;

procedure TfrmPrincipal.LimparCampos;
begin
  edtNome.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtRG.Clear;
  edtOrgaoExpeditor.Clear;
  edtCPF.Clear;
end;

procedure TfrmPrincipal.MontarTreeViewPosicoes;
var
  Node: TTreeNode;
  FPosicoesAtleta: TPosicoesAtleta;
begin

  dmPrincipal.qryTvPosicoes.Close;
  dmPrincipal.qryTvPosicoes.ParamByName('atleta').AsInteger := FDadosAtleta.Codigo;
  dmPrincipal.qryTvPosicoes.Open;

  tvPosicoes.Items.Clear;

  while not dmPrincipal.qryTvPosicoes.Eof do
  begin

    FPosicoesAtleta := TPosicoesAtleta.Create(Self);

    FPosicoesAtleta.CodigoAtleta := dmPrincipal.qryTvPosicoesid_atleta.AsInteger;
    FPosicoesAtleta.CodigoPosicao := dmPrincipal.qryTvPosicoesid.AsInteger;
    FPosicoesAtleta.Principal := dmPrincipal.qryTvPosicoesPrincipal.AsString;

    Node := tvPosicoes.Items.AddObject(nil, dmPrincipal.qryTvPosicoesnome.AsString + ' - ' + dmPrincipal.qryTvPosicoesSigla.AsString, FPosicoesAtleta);

    if dmPrincipal.qryTvPosicoesPrincipal.AsString = 'S' then
    begin

      Node.ImageIndex := 1;
      Node.SelectedIndex := 1;
      Node.StateIndex := 1;
      node.ExpandedImageIndex := 1;

    end
    else
    begin

      Node.ImageIndex := 0;
      Node.SelectedIndex := 0;
      Node.StateIndex := 0;
      node.ExpandedImageIndex := 0;

    end;

    dmPrincipal.qryTvPosicoes.Next;
  end;

end;

procedure TfrmPrincipal.OcultarSheets;
var
  I: Integer;
begin

  for I := 0 to ComponentCount -1 do
    if Components[I].ClassType = TTabSheet then
      TTabSheet(Components[I]).TabVisible := False;


end;

procedure TfrmPrincipal.btnAbaListaFichaClick(Sender: TObject);
begin
  pcFichasAtleta.ActivePage := tbListaFichasAtleta;
end;

procedure TfrmPrincipal.btnAbaDetalhesFichaClick(Sender: TObject);
begin
  pcFichasAtleta.ActivePage := tbDetalhesFichaAtleta;

  dtDataFicha.Date := Now;
end;

function TfrmPrincipal.ValidarDadosAtletaObrigatorio: Boolean;
begin

  Result := False;

  if Trim(edtNome.Text) = EmptyStr then
  begin
    Result := True;
    edtNome.SetFocus;
    FMensagens.MensagemInformacao('O campo "Nome" � obrigat�rio!');
    Exit;
  end;
  if Trim(edtEmail.Text) = EmptyStr then
  begin
    Result := True;
    edtEmail.SetFocus;
    FMensagens.MensagemInformacao('O campo "Email" � obrigat�rio!');
    Exit;
  end
  else
  if edtEmail.Invalid then
  begin
    Result := True;
    edtEmail.SetFocus;
    FMensagens.MensagemInformacao('Informe um "Email" v�lido!');
    Exit;
  end;

  if Trim(edtTelefone.Text) = EmptyStr then
  begin
    Result := True;
    edtTelefone.SetFocus;
    FMensagens.MensagemInformacao('O campo "Telefone" � obrigat�rio!');
    Exit;
  end
  else
  if edtTelefone.Invalid then
  begin
    Result := True;
    edtTelefone.SetFocus;
    FMensagens.MensagemInformacao('Informe um "Telefone" v�lido!');
    Exit;
  end;

  if Trim(edtRG.Text) = EmptyStr then
  begin
    Result := True;
    edtRG.SetFocus;
    FMensagens.MensagemInformacao('O campo "RG" � obrigat�rio!');
    Exit;
  end;

  if Trim(edtOrgaoExpeditor.Text) = EmptyStr then
  begin
    Result := True;
    edtOrgaoExpeditor.SetFocus;
    FMensagens.MensagemInformacao('O campo "Orgao Expeditor" � obrigat�rio!');
    Exit;
  end;

  if Trim(edtCPF.Text) = EmptyStr then
  begin
    Result := True;
    edtCPF.SetFocus;
    FMensagens.MensagemInformacao('O campo "CPF" � obrigat�rio!');
    Exit;
  end
  else
  if edtCPF.Invalid then
  begin
    Result := True;
    edtCPF.SetFocus;
    FMensagens.MensagemInformacao('Informe um "CPF" v�lido!');
    Exit;
  end;

end;

end.

