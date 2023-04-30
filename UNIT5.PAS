unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,unit4,unit6,
  Controls, Forms, Dialogs, jpeg, ExtCtrls,
  StdCtrls,Buttons, Spin, ComCtrls, GIFImg;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    DateTimePicker1: TDateTimePicker;
    SpinEdit1: TSpinEdit;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    BitBtn2: TBitBtn;
    Button2: TButton;
    procedure Image2MouseEnter(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Image3MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image4MouseEnter(Sender: TObject);
    procedure Image4MouseLeave(Sender: TObject);
    procedure Image5MouseLeave(Sender: TObject);
    procedure Image5MouseEnter(Sender: TObject);
    procedure Image7MouseEnter(Sender: TObject);
    procedure Image7MouseLeave(Sender: TObject);
    procedure Image8MouseEnter(Sender: TObject);
    procedure Image8MouseLeave(Sender: TObject);
    procedure Image6MouseEnter(Sender: TObject);
    procedure Image6MouseLeave(Sender: TObject);
    procedure Image9MouseEnter(Sender: TObject);
    procedure Image9MouseLeave(Sender: TObject);
    procedure Image10MouseEnter(Sender: TObject);
    procedure Image10MouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Image1MouseEnter(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image11MouseEnter(Sender: TObject);
    procedure Image11MouseLeave(Sender: TObject);
    procedure Image12MouseEnter(Sender: TObject);
    procedure Image12MouseLeave(Sender: TObject);
    procedure Image13MouseEnter(Sender: TObject);
    procedure Image13MouseLeave(Sender: TObject);
    procedure Image14MouseEnter(Sender: TObject);
    procedure Image14MouseLeave(Sender: TObject);
    procedure Image15MouseEnter(Sender: TObject);
    procedure Image15MouseLeave(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure Selected(bClicked:boolean);
    var
    bselected:boolean;

  end;

var
  Form5: TForm5;
  sArtist,sartist1,sdos:string;
  cost:string;
  rnumtickets,rcost:real;
  cArtist:Char;

implementation
uses
unit3,unit2,unit1;
{$R *.dfm}

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
ShowMessage('Click image of artist you wish to book a concert for');
ShowMessage('Then Select date of show and number of tickets');
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
bselected:=false;
Selected(bselected);

end;

procedure TForm5.Button1Click(Sender: TObject);
begin
rnumtickets:=StrTofloat(SpinEdit1.Text);
if usertype='Existing' then
 begin
with unit4.DataModule4 do
begin
ADOTable1.Filtered:=false;
ADOTable1.Locate('Username',susername,[]);
  ADOTable1.Edit;
  ADOTable1['Artist']:=(sArtist1);
  ADOTable1['DateOfShow']:=DateTimePicker1.Date;
  ADOTable1['NoOfTickets']:=strtoint(SpinEdit1.Text);
  ADOTable1.Post;
end;
 end;
 if usertype='New' then
 begin
   with unit4.DataModule4 do
   begin
     ADOTable1.Last;
     ADOTable1.Insert;
     ADOTable1['Username']:=username;
     ADOTable1['First Name']:=sname;
     adotable1['email']:=email;
     ADOTable1['NoOfTickets']:=strtoint(SpinEdit1.Text);
     ADOTable1['Password']:=password1;
     ADOTable1['DateOfShow']:=DateTimePicker1.Date;
     ADOTable1['Artist']:=(sArtist1);
     adotable1.Post;
   end;
 end;
sdos:=datetostr(DateTimePicker1.Date);
form6.Show;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm5.FormActivate(Sender: TObject);
begin
(Image16.Picture.Graphic As TGIFImage).Animate:=true;
(Image16.Picture.Graphic As TGIFImage).AnimationSpeed:=100;
DateTimePicker1.MinDate:=Date;
bselected:=false;
end;

procedure TForm5.Image10Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Sabrina Carpenter';
cArtist:='L';
Selected(bselected);
end;

procedure TForm5.Image10MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Sabrina Carpenter ';
end;

procedure TForm5.Image10MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image11Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Shawn Mendes';
cArtist:='M';
Selected(bselected);
end;

procedure TForm5.Image11MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Shawn Mendes';
end;

procedure TForm5.Image11MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image12Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Marshmello';
cArtist:='K';
Selected(bselected);
end;

procedure TForm5.Image12MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Marshmello';
end;

procedure TForm5.Image12MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image13Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Bebe Rexha';
cArtist:='D';
Selected(bselected);
end;

procedure TForm5.Image13MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Bebe Rexha';
end;

procedure TForm5.Image13MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image14Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Ariana Grande';
cArtist:='B';
Selected(bselected);
end;

procedure TForm5.Image14MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Ariana Grande';
end;

procedure TForm5.Image14MouseLeave(Sender: TObject);
begin
Panel1.Caption:=''
end;

procedure TForm5.Image15Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Bille Eilish';
cArtist:='E';
Selected(bselected);
end;

procedure TForm5.Image15MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Billie Eilish';
end;

procedure TForm5.Image15MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image1Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Avril Lavigne';
cArtist:='C';
Selected(bselected);
end;

procedure TForm5.Image1MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Avril Lavigne';
end;

procedure TForm5.Image1MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image2Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Ed Sheeran';
cArtist:='H';
Selected(bselected);
end;

procedure TForm5.Image2MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Ed Sheeran';
end;

procedure TForm5.Image2MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image3Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Justin Beiber';
cArtist:='I';
Selected(bselected);
end;

procedure TForm5.Image3MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Justin Beiber';
end;

procedure TForm5.Image3MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image4Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Chelsea Collins';
cArtist:='G';
Selected(bselected);
end;

procedure TForm5.Image4MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Chelsea Collins';
end;

procedure TForm5.Image4MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image5Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Alexander 23';
cArtist:='A';
Selected(bselected);
end;

procedure TForm5.Image5MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Alexander 23';
end;

procedure TForm5.Image5MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image6Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Madison Beer';
cArtist:='J';
Selected(bselected);
end;

procedure TForm5.Image6MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Madison Beer';
end;

procedure TForm5.Image6MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image7Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Camila Cabello';
cArtist:='F';
Selected(bselected);
end;

procedure TForm5.Image7MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Camila Cabello';
end;

procedure TForm5.Image7MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image8Click(Sender: TObject);
begin
bselected:=true;
sArtist:='The Weeknd';                //set artist
cArtist:='N';                         //set as char value to be used in case satetment in form 10
Selected(bselected);
end;

procedure TForm5.Image8MouseEnter(Sender: TObject);
begin
Panel1.Caption:='The Weeknd';           //show name of artist on panel
end;

procedure TForm5.Image8MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Image9Click(Sender: TObject);
begin
bselected:=true;
sArtist:='Why Don`t We';
cArtist:='O';
Selected(bselected);
end;

procedure TForm5.Image9MouseEnter(Sender: TObject);
begin
Panel1.Caption:='Why Don`t We';
end;

procedure TForm5.Image9MouseLeave(Sender: TObject);
begin
Panel1.Caption:='';
end;

procedure TForm5.Selected(bClicked: boolean);    //procedure to determine where artist was selcted or not
begin
if bClicked=true then
begin
  Image1.Visible:=false;
  image2.Visible:=false;
  Image3.Visible:=false;
  image4.Visible:=false;
  image5.Visible:=false;
   Image6.Visible:=false;
  image7.Visible:=false;
  Image8.Visible:=false;
  image9.Visible:=false;
  image10.Visible:=false;
   Image11.Visible:=false;
  image12.Visible:=false;
  Image13.Visible:=false;
  image14.Visible:=false;
  image15.Visible:=false;
  Panel2.Visible:=true;
  Panel2.Caption:=sArtist;
  with unit4.DataModule4 do
  begin
    ADOTable3.Locate('Artist',sArtist,[]);
    sartist1:=ADOTable3['Artist'];
    cost:=inttostr(ADOTable3['CostOfTicket']);
    rcost:=StrToFloat(cost);
  end;
  DateTimePicker1.Visible:=true;
SpinEdit1.Visible:=true;
Label1.Visible:=true;
Label2.Visible:=true;
Button1.Visible:=true;
BitBtn2.Enabled:=true;
end else
if bClicked=false then
begin
  Image1.Visible:=true;
  image2.Visible:=true;
  Image3.Visible:=true;
  image4.Visible:=true;
  image5.Visible:=true;
   Image6.Visible:=true;
  image7.Visible:=true;
  Image8.Visible:=true;
  image9.Visible:=true;
  image10.Visible:=true;
   Image11.Visible:=true;
  image12.Visible:=true;
  Image13.Visible:=true;
  image14.Visible:=true;
  image15.Visible:=true;
  Panel2.Visible:=false;
    DateTimePicker1.Visible:=false;
SpinEdit1.Visible:=false;
Label1.Visible:=false;
Label2.Visible:=false;
Button1.Visible:=false;
BitBtn2.Enabled:=false;
end;

end;

procedure TForm5.SpinEdit1Change(Sender: TObject);
begin
Button1.Enabled:=TRUE;
end;

end.
