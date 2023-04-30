unit unit7;

interface
type
Tcalccosts= class(TObject)
  private
  fusername,fdateofshow,fdateofentry,fdateofexit:string;
  fnumtickets,fcostperticket,fcostperroom:real;
  public
  constructor  Create(Sname:string; rnumtickets1,rcostperticket1,rcostperroom1:real);
  function getcostofticket:real;
  function getnumtickets:real;
  function getCostOfroom:real;
  function calccostoftickets:real;
  function Calctotalcost:real;
  function getname:string;
end;

implementation

{ Tcalccosts }

function Tcalccosts.calccostoftickets: real;
begin
Result:=fnumtickets*fcostperticket;
end;

function Tcalccosts.Calctotalcost: real;
begin
Result:=(fnumtickets*fcostperticket)+fcostperroom
end;

constructor Tcalccosts.Create(Sname: string; rnumtickets1, rcostperticket1,  //calculate total cost of tickets and room
  rcostperroom1: real);
begin
 fusername:=sname;
 fnumtickets:=rnumtickets1;
 fcostperticket:=rcostperticket1;
 fcostperroom:=rcostperroom1;
end;

function Tcalccosts.getCostOfroom: real;
begin
 Result:=fcostperroom;
end;

function Tcalccosts.getcostofticket: real;
begin
 Result:=fcostperticket;
end;

function Tcalccosts.getname: string;
begin
result:=fusername;
end;

function Tcalccosts.getnumtickets: real;
begin
Result:=fnumtickets;
end;





end.
