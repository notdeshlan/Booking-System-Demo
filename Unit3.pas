unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
 Controls, Forms, Dialogs, jpeg, pngimage,unit4,unit5,
  ExtCtrls, GIFImg,StdCtrls,Buttons;

type
  TForm3 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Image4: TImage;
    BitBtn1: TBitBtn;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  susername:string;

implementation
uses unit1,unit2;

{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
ShowMessage('Enter Login Details To proceed');
end;

procedure TForm3.Button1Click(Sender: TObject);
var
username1,passwordx,sname:string;
begin
 Susername:=Edit1.Text;
 passwordx:=Edit2.Text;
if usertype='Existing' then
 begin
 with unit4.DataModule4 do
 begin
 ADOTable1.Filtered:=false;
   if ADOTable1.Locate('Username',susername,[]) then           //following code finds username and password for that user
   begin
     ADOTable1.Filter:='Username = '+ QuotedStr(edit1.Text);   // then checks if password matches to login user
     ADOTable1.Filtered:=true;
     sname:=ADOTable1['First Name'];
     if ADOTable1['Password']=passwordx then
     begin
       showmessage('Welcome '+sname);
       form5.Show;
     end else
     showmessage('Incorrect Password');
   end else
   showmessage('User Does Not Exist');
 end;
 unit4.DataModule4.ADOTable1.Filtered:=false;
 end else
 if usertype='New' then
 begin
   if (susername=username) and (password1=passwordx) then
   begin
   ShowMessage('Welcome '+sname);
   form5.Show;
   end else
   showmessage('Incorrect Username or password');
 end;


end;

procedure TForm3.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
(Image4.Picture.Graphic AS TGIFImage).Animate:=true;
(Image4.Picture.Graphic AS Tgifimage).AnimationSpeed:=200;
end;

end.
