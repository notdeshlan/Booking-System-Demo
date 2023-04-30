unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes,Graphics,
  Controls, Forms, Dialogs, ExtCtrls,StdCtrls,unit8,
 pngimage, jpeg;

type
  TForm6 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button1: TButton;

    procedure RadioButton1MouseEnter(Sender: TObject);
    procedure RadioButton1MouseLeave(Sender: TObject);
    procedure RadioButton2MouseEnter(Sender: TObject);
    procedure RadioButton2MouseLeave(Sender: TObject);
    procedure RadioButton3MouseEnter(Sender: TObject);
    procedure RadioButton3MouseLeave(Sender: TObject);
    procedure RadioButton4MouseEnter(Sender: TObject);
    procedure RadioButton4MouseLeave(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  Sfloornum:string;

implementation

{$R *.dfm}





procedure TForm6.Button1Click(Sender: TObject);
begin
form8.Show;
end;

procedure TForm6.RadioButton1Click(Sender: TObject);
begin
Sfloornum:='A';
end;

procedure TForm6.RadioButton1MouseEnter(Sender: TObject);
begin
Panel5.Visible:=true;
end;

procedure TForm6.RadioButton1MouseLeave(Sender: TObject);
begin
Panel5.Visible:=false;
end;

procedure TForm6.RadioButton2Click(Sender: TObject);
begin
Sfloornum:='B';
end;

procedure TForm6.RadioButton2MouseEnter(Sender: TObject);
begin
Panel4.Visible:=true;
end;

procedure TForm6.RadioButton2MouseLeave(Sender: TObject);
begin
Panel4.Visible:=false;
end;

procedure TForm6.RadioButton3Click(Sender: TObject);
begin
Sfloornum:='C';                                     //select floor level
end;

procedure TForm6.RadioButton3MouseEnter(Sender: TObject);
begin
Panel3.Visible:=true;                                    //display floor level on image
end;

procedure TForm6.RadioButton3MouseLeave(Sender: TObject);
begin
Panel3.Visible:=false;
end;

procedure TForm6.RadioButton4Click(Sender: TObject);
begin
Sfloornum:='D';
end;

procedure TForm6.RadioButton4MouseEnter(Sender: TObject);
begin
Panel1.Visible:=true;
end;

procedure TForm6.RadioButton4MouseLeave(Sender: TObject);
begin
Panel1.Visible:=false;
end;

end.
