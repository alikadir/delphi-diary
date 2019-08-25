unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Mask, DBCtrls, ADODB, Grids, DBGrids, Buttons;

type
  TForm3 = class(TForm)
    ADOTable1: TADOTable;
    ADOConnection1: TADOConnection;
    ADOTable1admin: TWideStringField;
    ADOTable1pass: TWideStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource2: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
   
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  w,q:string;
implementation

uses Unit2, Unit1;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
x:byte;
begin
x:=255;
form2.AlphaBlendValue:=(x);
form3.close;
end;

procedure TForm3.FormCreate(Sender: TObject);
var
x,y:string;
begin
dbgrid1.Visible:=false;
  setwindowlong(handle,GWL_STYLE,getwindowlong(handle,GWL_STYLE) AND NOT WS_CAPTION);
height:=height+1;



x:=form1.DBEdit1.Text;
 label3.caption:='þuanki kullanýcý: '+(x);

 y:=form1.DBEdit2.Text;
 label4.caption:='þifre: '+(y);
end;




procedure TForm3.BitBtn1Click(Sender: TObject);
var a:byte;
begin
 a:=255;
form2.AlphaBlendValue:=(a);
 form3.close;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
 a:byte;
 x,y:string;
 hata:word;
 begin
 w:=dbedit1.text;
 q:=dbedit2.Text;
 x:=form1.DBEdit1.Text;
 label3.caption:='þuanki kullanýcý: '+(x);

 y:=form1.DBEdit2.Text;
 label4.caption:='þifre: '+(y);


hata:=messagedlg('programýn bidahaki açýlýþýnda aktif olacak ;'+#13+'kullanýcý adý : '+(w)+#13+'password : '+(q)+#13+'yeni kullanýcý adý ve þifreyi onaylýyomusun ?',mtconfirmation,[mbyes,mbno],0);
 if hata=mryes then
 begin
 adotable1.Insert;
 a:=255;
form2.AlphaBlendValue:=(a);
 form3.close;
 end;
 end;

end.
