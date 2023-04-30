unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,DB, unit4,ExtCtrls, StdCtrls,unit7,math,
  ComCtrls;

type
  TForm9 = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    RichEdit1: TRichEdit;
    Button3: TButton;
    Button4: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    Button5: TButton;
    Label1: TLabel;
    Panel5: TPanel;
    Button6: TButton;
    Button7: TButton;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Panel1Click(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure Panel2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  var
    artist1, roomnum: string;
    arrartist: array [1 .. 15] of string;
    arrprice: array [1 .. 15] of integer;
    inumtick,icostroom,icosttick: string;
    i:integer;
    sname,sroom:string;
    objuserinfo:tcalccosts;
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
  with unit4.DataModule4 do
  begin
    ADOTable3.Sort := 'Artist ASC';                   //sort artist in alphabetic order
  end;
end;

procedure TForm9.Button2Click(Sender: TObject);            //find a specific user  with username
begin
  with unit4.DataModule4 do
  begin
    ADOTable1.Filtered := false;
    if ADOTable1.Locate('Username', Edit1.Text, [loCaseInsensitive]) then
    begin
      ADOTable1.Filtered := false;
      ADOTable1.Filter := 'Username =' + QuotedStr(Edit1.Text);
      ADOTable1.Filtered := true;
    end;

  end;
end;

procedure TForm9.Button3Click(Sender: TObject);      //update cost per ticket of artist using parallel array and text file
var
  x: integer;
  mytf: TextFile;
  oneline: string;
  ipos: integer;
begin
RichEdit1.Lines.Clear;
  AssignFile(mytf, 'artist.txt');
  Reset(mytf);
  i := 0;
  while not eof(mytf) do
  begin
    Readln(mytf, oneline);
    ipos := Pos('#', oneline);
    Inc(i);
    arrartist[i] := Copy(oneline, 1, ipos - 1);
    Delete(oneline, 1, ipos);
    arrprice[i] := strtoint(Copy(oneline, 1, length(oneline)));
  end;
  CloseFile(mytf);
  for x := 1 to i do
  begin
    RichEdit1.Lines.Add(arrartist[x] + #9 + inttostr(arrprice[x]));
  end;
 Button4.Enabled:=true;
end;

procedure TForm9.Button4Click(Sender: TObject);        //read in text file first
var
  y: integer;
begin
  with unit4.DataModule4 do
  begin
    for y := 1 to i do
    begin
      ADOTable3.Filtered := false;
      ADOTable3.Filter := 'Artist = ' + QuotedStr(arrartist[y]);
      ADOTable3.Filtered := true;
      ADOTable3.Edit;
      ADOTable3['CostOfTicket'] := arrprice[y];
    end;
    ADOTable3.Filtered:=false;
  end;

end;

procedure TForm9.Button5Click(Sender: TObject);         //delete a specific user
begin
with unit4.DataModule4 do
begin
  DataSource1.DataSet:=ADOTable1;
  if ADOTable1.Locate('Username',Edit1.Text,[loCaseInsensitive]) then
  begin
    ADOTable1.Delete;

  end else
  showmessage('User Not Found');
end;
end;

procedure TForm9.Button6Click(Sender: TObject);
var
ihigh:string;
fhigh:real;
begin
with unit4.DataModule4 do
begin
DataSource3.DataSet:=ADOQuery1;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT MAX(CostOfTicket) AS [High]');
  ADOQuery1.SQL.Add('FROM tblArtists');
  ADOQuery1.Open;
  ihigh:=IntToStr(ADOQuery1['High']);
  fhigh:=StrToFloat(ihigh);
  ShowMessage('Most Expensive Ticket Costs ' + FloatToStrF(fhigh,ffCurrency,5,2) );
  DataSource3.DataSet:=ADOTable3;
end;
end;

procedure TForm9.Button7Click(Sender: TObject);
var
ihigh:string;
fhigh:real;
 begin
with unit4.DataModule4 do
begin
DataSource2.DataSet:=ADOQuery1;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT MAX(CostOfRoom) AS [High]');
  ADOQuery1.SQL.Add('FROM tblRoomBooking');
  ADOQuery1.Open;
  ihigh:=IntToStr(ADOQuery1['High']);
  fhigh:=StrToFloat(ihigh);
  ShowMessage('Most Expensive Room Costs ' + FloatToStrF(fhigh,ffCurrency,5,2) );
  DataSource2.DataSet:=ADOTable2;
end;
end;

procedure TForm9.DBGrid1CellClick(Column: TColumn);   //filter user table according to selected artist

begin
  with unit4.DataModule4 do
  begin
    DataSource1.DataSet := ADOQuery1;
    artist1 := ADOTable3['Artist'];
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM tblUser WHERE ');
    ADOQuery1.SQL.Add('Artist = ' + QuotedStr(artist1));
    ADOQuery1.Open;
  end;
end;

procedure TForm9.DBGrid2CellClick(Column: TColumn);
var
fcostperroom,fcostpertick,fnumtick:real;
sartist:string;
begin
RichEdit1.Lines.Clear;
with unit4.DataModule4 do
begin
DataSource1.DataSet:=ADOTable1;
  sname:=ADOTable1['Username'];
  inumtick:=inttostr(ADOTable1['NoOfTickets']);
  sartist:=ADOTable1['Artist'];
  sroom:=ADOTable1['RoomNo'];
  ADOTable3.Filtered:=false;
  ADOTable3.Filter:='Artist = '+ QuotedStr(sartist);
  ADOTable3.Filtered:=true;
  icosttick:=inttostr(ADOTable3['CostOfTicket']);
  ADOTable3.Filtered:=false;
   ADOTable2.Filtered:=false;
  ADOTable2.Filter:='RoomNo = '+ QuotedStr(sroom);
  ADOTable2.Filtered:=true;
  icostroom:=IntToStr(ADOTable2['CostOfRoom']);
  ADOTable2.Filtered:=false;
end;
fcostperroom:=StrToFloat(icostroom);
fcostpertick:=StrToFloat(icosttick);
fnumtick:=StrToFloat(inumtick);
objuserinfo:=Tcalccosts.Create(sname,fnumtick,fcostpertick,fcostperroom);
RichEdit1.Lines.Add(objuserinfo.getname ) ;
RichEdit1.Lines.Add('Number Of Tickets : '+ FloatToStr(objuserinfo.getnumtickets));
RichEdit1.Lines.Add('Cost Per Ticket : '+ FloatToStrF(objuserinfo.getcostofticket,ffCurrency,5,2));
RichEdit1.Lines.Add('Cost Of tickets : '+ FloatToStrF(objuserinfo.calccostoftickets,ffCurrency,6,2));
RichEdit1.Lines.Add('Cost of room : ' +FloatToStrF(objuserinfo.getCostOfroom,ffCurrency,5,2));
RichEdit1.Lines.Add('Total Cost : ' + FloatToStrF(objuserinfo.Calctotalcost,ffCurrency,6,2));
end;

procedure TForm9.DBGrid3CellClick(Column: TColumn);         //filter user table according to room number and artist
begin
  with unit4.DataModule4 do
  begin
    DataSource1.DataSet := ADOQuery1;
    roomnum := ADOTable2['RoomNo'];
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM tblUser WHERE ');
    ADOQuery1.SQL.Add('Artist = ' + QuotedStr(artist1));
    ADOQuery1.SQL.Add('AND RoomNo = ' + QuotedStr(roomnum));
    ADOQuery1.Open;
  end;
end;

procedure TForm9.FormActivate(Sender: TObject);
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
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TForm9.Panel1Click(Sender: TObject);        //to show all users, no filters
begin
  with unit4.DataModule4 do
  begin
    DataSource1.DataSet := ADOTable1;
    ADOTable1.Filtered := false;

  end;
end;

procedure TForm9.Panel2Click(Sender: TObject);      // show total number of tickets sold for a specifi artist
begin
  with unit4.DataModule4 do
  begin
    DataSource1.DataSet := ADOTable1;
    artist1 := ADOTable3['Artist'];
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT SUM(NoOfTickets) AS [Total]');
    ADOQuery1.SQL.Add('FROM tblUser WHERE Artist = ' + QuotedStr(artist1));
    ADOQuery1.Open;
    ShowMessage('Number Of tickets sold for ' + artist1 + ' is ' +
      inttostr(ADOQuery1['Total']));
  end;
end;

procedure TForm9.Panel5Click(Sender: TObject);     //filter user table according to room number only
var
sroomNo:string;
begin
with unit4.DataModule4 do
begin
DataSource1.DataSet:=ADOTable1;
sroomNo:=ADOTable2['RoomNo'];
ADOTable1.Filtered:=false;
ADOTable1.Filter:='RoomNo = ' +QuotedStr(sroomNo);
ADOTable1.Filtered:=true;
end;
end;

end.
