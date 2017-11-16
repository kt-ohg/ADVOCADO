program P_AdvoCat;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_Haupt in 'U_Haupt.pas' {FrmHaupt};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmHaupt, FrmHaupt);
  Application.Run;
end.
