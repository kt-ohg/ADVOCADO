unit U_Haupt;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, U_FRUpdater,
  FMX.StdCtrls;

type
  TFrmHaupt = class(TForm)
    BtnLeitzins: TButton;
    LblLeitzins: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnLeitzinsClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FrmHaupt: TFrmHaupt;
  FRUpdater: TFRUpdater;
  URL, FileName: string;


implementation

{$R *.fmx}

procedure TFrmHaupt.FormCreate(Sender: TObject);
begin
  URL:= 'http://sdw.ecb.europa.eu/quickviewexport.do?SERIES_KEY=143.FM.B.U2.EUR.4F.KR.MRR_FR.LEV&type=csv';
  FileName:= 'leitzins.dat';
  FRUpdater:= TFRUpdater.Create(URL, FileName);
end;

procedure TFrmHaupt.BtnLeitzinsClick(Sender: TObject);
var
  FR: real;
begin
  if FRUpdater.HasInternet then
    FRUpdater.updateFR;

  if FRUpdater.FileExist then
  begin
    FR:= FRUpdater.readFR;
    LblLeitzins.Text:= 'Leitzins: ' + FloatToStr(FR) + '%';
  end
  else
    LblLeitzins.Text:= 'Keine Verbindung zur API und Leitzins nicht lokal vorhanden';
end;

end.
