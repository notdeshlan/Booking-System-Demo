unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,Graphics,
  Controls, Forms, Dialogs, StdCtrls, ComCtrls,unit7,math,unit4,DB,jpeg,
  ExtCtrls,GifImg,shellApi;

type
  TForm10 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    RichEdit1: TRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
    objCalcCost:Tcalccosts;
    var
code:string;
link:string;
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation
uses
unit5,unit8,unit3,unit2;

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);

begin
RichEdit1.Lines.Clear;
code:=(Copy(susername,1,2))+(IntToStr(RandomRange(100,1000)))+(Copy(susername,length(susername)-1,2)); //generate unique code using random number and username
objCalcCost:=Tcalccosts.Create(susername,rnumtickets,rcost,rcostperroom); //instantiate object
RichEdit1.Lines.Add(objCalcCost.getname ) ;   //show username
 //folowing code shows calculated costs from object
RichEdit1.Lines.Add('Number Of Tickets : '+ FloatToStr(objCalcCost.getnumtickets));
RichEdit1.Lines.Add('Cost Per Ticket : '+ FloatToStrF(objCalcCost.getcostofticket,ffCurrency,5,2));
RichEdit1.Lines.Add('Cost Of tickets : '+ FloatToStrF(objCalcCost.calccostoftickets,ffCurrency,6,2));
RichEdit1.Lines.Add('Cost of room : ' +FloatToStrF(objCalcCost.getCostOfroom,ffCurrency,5,2));
RichEdit1.Lines.Add('Total Cost : ' + FloatToStrF(objCalcCost.Calctotalcost,ffCurrency,6,2));
RichEdit1.Lines.Add('Reference Code : '+ code);
Button2.Enabled:=true;
Button1.Enabled:=false;
case cArtist of
'A': link:='http://www.alexander23.com/';    //to generate link to artists website
'B': link:='https://www.arianagrande.com/';
'C': link:='https://avrillavigne.com/';
'D':link:='https://www.forbes.com/profile/bebe-rexha/';
'E':link:='https://www.billieeilish.com/music';
'F':Link:='https://www.camilacabello.com/';
'G':link:='https://www.youtube.com/watch?v=JnxBSPBlzyE';
'H':link:='https://www.edsheeran.com/';
'I':link:='https://www.justinbiebermusic.com/';
'J':link:='https://www.youtube.com/watch?v=rQZJsOSw1pU';
'K':link:='https://marshmellomusic.com/';
'L':link:='https://www.sabrinacarpenter.com/';
'M':link:='http://www.shawnmendesofficial.com/';
'N':link:='https://www.theweeknd.com/';
'O':link:='https://whydontwemusic.com/';
end;
 Label1.Caption:=link;
end;

procedure TForm10.Button2Click(Sender: TObject); //save information to text file
begin
RichEdit1.PlainText:=true;
 RichEdit1.Lines.SaveToFile(code+'.txt');
 RichEdit1.PlainText:=false;
 Application.Terminate;
end;

procedure TForm10.FormActivate(Sender: TObject);
begin
begin
case cArtist of
'A': Image1.Picture.LoadFromFile('Artists\alexander23.jpg');    //following code loads artist picture according to which artist user booked
'B': Image1.Picture.LoadFromFile('Artists\ArianaGrande.jpg');
'C': Image1.Picture.LoadFromFile('Artists\AvrilLavigne.png');
'D':Image1.Picture.LoadFromFile('Artists\BebeRexha.jpg');
'E':Image1.Picture.LoadFromFile('Artists\BillieEilish.jpg');
'F':Image1.Picture.LoadFromFile('Artists\CamilaCabello.jpg');
'G':Image1.Picture.LoadFromFile('Artists\ChelseaCollins.jpg');
'H':Image1.Picture.LoadFromFile('Artists\EdSheeran.jpg');
'I':Image1.Picture.LoadFromFile('Artists\JustinBieber.jpg');
'J':Image1.Picture.LoadFromFile('Artists\MadisonBeer.jpg');
'K':Image1.Picture.LoadFromFile('Artists\Marshmello.jpg');
'L':Image1.Picture.LoadFromFile('Artists\SabrinaCarpenter.jpg');
'M':Image1.Picture.LoadFromFile('Artists\ShawnMendes.jpg');
'N':Image1.Picture.LoadFromFile('Artists\TheWeeknd.jpg');
'O':Image1.Picture.LoadFromFile('Artists\WhyDontWe.png');
end;
(Image2.Picture.Graphic As TGIFImage).Animate:=true;
(Image2.Picture.Graphic As TGIFImage).AnimationSpeed:=250;
end;

end;

procedure TForm10.Label1Click(Sender: TObject);
begin
 ShellExecute(Application.Handle, PChar('open'), PChar(link),
   nil, nil, SW_SHOW);
end;

procedure TForm10.Panel1Click(Sender: TObject);
var
code1:string;
myfile:textfile;
sline:string;
begin
RichEdit1.Lines.Clear;
code1:=InputBox('Enter Reference Code','',''); //get reference code
//read in previous ''receipt''
AssignFile(myfile,code1+'.txt');
try
reset(myfile);
except
ShowMessage('File Not found...Make sure reference code is correct');
exit
end;
while not eof(myfile) do
begin
  Readln(myfile,sline);
  RichEdit1.Lines.Add(sline);
end;
end;

end.
