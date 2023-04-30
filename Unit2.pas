unit Unit2;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, jpeg, ExtCtrls,unit4,db,unit3,
  StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label3: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form2: TForm2;
  username:string;
  password1,password2,email,surname,sname:string;
implementation
uses unit1;

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
ShowMessage('Enter all fields and press proceed button to create and account');
end;

procedure TForm2.Button1Click(Sender: TObject);
var
exists:boolean;

begin
sname:=Edit1.Text;              //stores user information to be entered in a new record in user table
email:=Edit3.Text;
username:=Edit4.Text;
password1:=Edit5.Text;
password2:=Edit6.Text;
exists:=false;
if (Edit1.Text='') or (Edit3.Text='') or (Edit4.Text='') then
begin
  showmessage('Please Fill All Fields');
end else
begin
with unit4.DataModule4 do
begin
  ADOTable1.Last;
  if ADOTable1.Locate('Username',username,[locaseinsensitive]) then      //checks if user already exist by locating if this username is already in database
  begin
    ShowMessage('User Already Exists, Please Login');
    exists:=true;
    usertype:='Existing';
    Form3.Show;
  end else
  if password1=password2 then
  begin
    Form3.Show;
  end else
  ShowMessage('Passwords Do Not Match');
end;
end;



end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;



procedure TForm2.Button3Click(Sender: TObject);
begin
 Form1.Show;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
if Checkbox1.Checked=true then
begin
  Edit5.PasswordChar=#0;
end else
Edit5.PasswordChar=*;

end;

end.
