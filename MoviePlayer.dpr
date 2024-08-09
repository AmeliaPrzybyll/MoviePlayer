program MoviePlayer;

uses
  Vcl.Forms,
  Movie_player in 'Movie_player.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
