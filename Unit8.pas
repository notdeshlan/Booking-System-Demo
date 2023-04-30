unit Unit8;

interface

uses
  Windows, Messages, unit4, SysUtils, Variants,
  Classes,Graphics,
  Controls, Forms, Dialogs, pngimage, ExtCtrls,
  StdCtrls, ComCtrls, unit10;

type
  TForm8 = class(TForm)
    Image4: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel2: TPanel;
    Button1: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button2: TButton;
    procedure Image4Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  sroomnum, icost: string;
  sroombooking: string;
  rcostperroom: real;

implementation

uses unit6, unit3, unit5;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
  Form10.Show;;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm8.FormActivate(Sender: TObject);
begin
  DateTimePicker1.MinDate := Date;
  DateTimePicker2.MinDate := Date;
end;

procedure TForm8.Image10Click(Sender: TObject);
begin
  sroomnum := '10';
  sroombooking := Sfloornum + sroomnum;
  Panel1.Caption := sroombooking;
  Panel5.Visible:=False;
end;

procedure TForm8.Image1Click(Sender: TObject);
begin
  sroomnum := '1';
  sroombooking := Sfloornum + sroomnum;
  Panel1.Caption := sroombooking;
  Panel5.Visible:=False;
end;

procedure TForm8.Image2Click(Sender: TObject);
begin
  sroomnum := '2';
  sroombooking := Sfloornum + sroomnum;
  Panel1.Caption := sroombooking;
  Panel5.Visible:=False;
end;

procedure TForm8.Image3Click(Sender: TObject);
begin
  sroomnum := '3';
  sroombooking := Sfloornum + sroomnum;
  Panel1.Caption := sroombooking;
  Panel5.Visible:=False;
end;

procedure TForm8.Image4Click(Sender: TObject);
begin
  sroomnum := '4';
  sroombooking := Sfloornum + sroomnum;
  Panel1.Caption := sroombooking;
  Panel5.Visible:=False;
end;

procedure TForm8.Image5Click(Sender: TObject);
begin
  sroomnum := '5';
  sroombooking := Sfloornum + sroomnum;
  Panel1.Caption := sroombooking;
  Panel5.Visible:=False;
end;

procedure TForm8.Image6Click(Sender: TObject);
begin
  sroomnum := '6';
  sroombooking := Sfloornum + sroomnum;
  Panel1.Caption := sroombooking;
  Panel5.Visible:=False;
end;

procedure TForm8.Image7Click(Sender: TObject);
begin
  sroomnum := '7';
  sroombooking := Sfloornum + sroomnum;
  Panel1.Caption := sroombooking;
  Panel5.Visible:=False;
end;

procedure TForm8.Image8Click(Sender: TObject);
begin
  sroomnum := '8';
  sroombooking := Sfloornum + sroomnum;
  Panel1.Caption := sroombooking;
  Panel5.Visible:=False;
end;

procedure TForm8.Image9Click(Sender: TObject);
begin
  sroomnum := '9';
  sroombooking := Sfloornum + sroomnum;
  Panel1.Caption := sroombooking;
  Panel5.Visible:=False;
end;

procedure TForm8.Panel2Click(Sender: TObject);
var
  entrydate1, entrydate2, exitdate1, exitdate2: string;
  i: integer;
  booked, valid: boolean;
begin
  booked := false;
  entrydate1 := DateToStr(DateTimePicker1.Date);
  exitdate1 := DateToStr(DateTimePicker2.Date);
  if (strtodate(sdos) > DateTimePicker1.Date) and
    (DateTimePicker2.Date > DateTimePicker1.Date) then
  begin
    valid := true;
  end
  else
    valid := false;
  if valid = true then
  begin
    WITH unit4.DataModule4 do                            //folowing code checks if room isalready booked for these dates
    begin
      ADOTable1.Filtered := false;
      ADOTable1.Filter := 'RoomNo = ' + quotedstr(sroombooking);
      ADOTable1.Filtered := true;
      ADOTable1.First;
      for i := 1 to ADOTable1.RecordCount do
      begin
        entrydate2 := DateToStr(ADOTable1['EntryDate']);
        exitdate2 := DateToStr(ADOTable1['ExitDate']);

        if entrydate1 > exitdate2 then
        begin
          booked := false;
          ADOTable1.Next;
        end
        else
          booked := true;
      end;
      ADOTable1.Filtered := false;
      if booked = true then
      begin
        showmessage('Room Is Booked');
      end
      else
      begin
        ADOTable1.Locate('Username', susername, []);       //if room is available, it will be booked and added to database
        ADOTable1.Edit;
        ADOTable1['RoomNo'] := sroombooking;
        ADOTable1['EntryDate'] := DateTimePicker1.Date;
        ADOTable1['ExitDate'] := DateTimePicker2.Date;
        ADOTable1.Post;
        showmessage('Room Is Available and has been booked');
        ADOTable2.Locate('RoomNo', sroombooking, []);
        icost := inttostr(ADOTable2['CostOfRoom']);
        rcostperroom := StrToFloat(icost);
      end;
     Panel2.Enabled:=false;
     Button1.Enabled :=true;
    end;

  end;
  if valid=false then
  begin
    ShowMessage('Please Enter Valid Dates');
  end;

end;

procedure TForm8.Panel3Click(Sender: TObject);     //check if room has cable tv from database
var
TV:boolean;
begin
with unit4.DataModule4 do
begin
  ADOTable2.Locate('RoomNo',sroombooking,[]);
  tv:=ADOTable2['Cable TV'];
  if tv=true then
  begin
    showmessage('Room Has cable TV');
  end else
  ShowMessage('Room Does Not have Cable TV');
end;
end;

procedure TForm8.Panel4Click(Sender: TObject);    //check if room has wifi available
var
wifi:boolean;
begin
 with unit4.DataModule4 do
begin
  ADOTable2.Locate('RoomNo',sroombooking,[]);
  wifi:=ADOTable2['Wifi'];
  if wifi=true then
  begin
    showmessage('Room Has Wifi');
  end else
  ShowMessage('Room Does Not have Wifi');
end;
end;

end.
