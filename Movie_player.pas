unit Movie_player;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.MPlayer;

type
  TForm1 = class(TForm)
    MediaPlayer1: TMediaPlayer;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    TrackBar1: TTrackBar;
    OpenDialog1: TOpenDialog;
    Timer1: TTimer;
    procedure SpeedButton7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Panel1Resize(Sender: TObject);
begin
   MediaPlayer1.DisplayRect := Panel1.ClientRect;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  try
    MediaPlayer1.Play;
  except
    ShowMessage('Error playing media.');
  end;
  Timer1.Enabled := true;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  try
    MediaPlayer1.Pause;
  except
    ShowMessage('Error pausing media.');
  end;
  Timer1.Enabled := false;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  try
    MediaPlayer1.Stop;
    MediaPlayer1.Rewind;
  except
    ShowMessage('Error stopping media.');
  end;
  Timer1.Enabled := false;
  TrackBar1.Position := 0;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  try
    MediaPlayer1.Back;
    MediaPlayer1.Resume;
  except
      Timer1.Enabled := true;
  end;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
      try
    MediaPlayer1.Step;
    MediaPlayer1.Resume;
  except
      Timer1.Enabled := true;
  end;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    MediaPlayer1.FileName := OpenDialog1.FileName;
    try
      MediaPlayer1.Open;
      MediaPlayer1.Display := Panel1;
      MediaPlayer1.DisplayRect := Panel1.ClientRect;
      MediaPlayer1.Play;
      TrackBar1.Max := MediaPlayer1.Length;  // Set TrackBar max after media starts playing
      TrackBar1.Position := 0;
      Timer1.Enabled := true;
    except
      ShowMessage('Cannot open the selected file.');
    end;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Trackbar1.OnChange :=nil;
  TrackBar1.Position := MediaPlayer1.Position;
  Trackbar1.OnChange :=TrackBar1Change;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
var
 Tymcz: Boolean;
begin
Tymcz:=Timer1.Enabled;
  Timer1.Enabled:=false;
  try
    MediaPlayer1.Position:=trackbar1.Position;
     Mediaplayer1.Resume;
  except
   trackbar1.Position:=0;

  end;
   Timer1.Enabled:=false;
end;

end.

