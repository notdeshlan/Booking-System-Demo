unit Unit1;

interface

uses
  Windows, Messages, SysUtils,Variants, Classes, Graphics,
  Controls, Forms, Dialogs, MPlayer, jpeg,unit2,unit3,unit4,
ExtCtrls,unit9, GIFImg,StdCtrls, Buttons,math;

type
  TForm1 = class(TForm)
    Image1: TImage;
    MediaPlayer1: TMediaPlayer;
    Timer1: TTimer;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Button3: TButton;
    Button4: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
    i:integer;

  end;

var
  Form1: TForm1;
  usertype:string;
implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
ShowMessage('If you have an account, press login button');
ShowMessage('If you are new, press sign up button');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
usertype:='Existing';
form3.show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form2.Show;
usertype:='New';
end;

procedure TForm1.Button3Click(Sender: TObject);
var
adminpassword:string;
begin
 adminpassword:=InputBox('Password','Enter Admin Password','');
 if adminpassword='JLN08' then
 begin
form9.Show;
 end else
 showmessage('Password Is incorrect');

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
with unit4.DataModule4 do
 begin                                //following code dynamically loads database
 ADOConnection1.Connected:=false;
 ADOTable1.Active:=false;
 adotable2.Active:=false;
 ADOTable3.Active:=false;
   ADOConnection1.ConnectionString:=GetCurrentDir+'\dbSoundKick.mdb';
  ADOConnection1.Connected:=true;
  ADOTable1.Tablename:='tblUser';
  ADOTable2.TableName:='tblRoomBooking';
  ADOTable3.TableName:='tblArtists';
  ADOQuery1.Connection:=ADOConnection1;
  ADOQuery1.EnableBCD:=true;
 ADOTable1.Active:=true;
 adotable2.Active:=true;
 ADOTable3.Active:=true;
 end;
if i=1 then
begin
MediaPlayer1.FileName:=GetCurrentDir+'\Hot.wav';  //this code is to randomize the song that will be played
Timer1.Interval:=192600;
timer1.Enabled:=true;
end else
if i=2 then
begin
MediaPlayer1.FileName:=GetCurrentDir+'\Intentions.wav';
Timer1.Interval:=199200;
timer1.Enabled:=true;
end else
if i=3 then
begin
MediaPlayer1.FileName:=GetCurrentDir+'\High Hopes.wav';
Timer1.Interval:=177700;
timer1.Enabled:=true;
end else
if i=4 then
begin
MediaPlayer1.FileName:=GetCurrentDir+'\Heres to never growing up.wav';
Timer1.Interval:=199200;
timer1.Enabled:=true;
end else
if i=5 then
begin
MediaPlayer1.FileName:=GetCurrentDir+'\Alone.wav';
Timer1.Interval:=199200;
timer1.Enabled:=true;
end else
if i=6 then
begin
MediaPlayer1.FileName:=GetCurrentDir+'\Havana.wav';
Timer1.Interval:=199200;
timer1.Enabled:=true;
end;
MediaPlayer1.Open;
MediaPlayer1.Play;
(Image3.Picture.Graphic As TGIFImage).Animate:=true;
(Image3.Picture.Graphic As TGIFImage).AnimationSpeed:=100;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
i:=RandomRange(1,7);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
MediaPlayer1.Rewind;
MediaPlayer1.Play;

end;

end.
