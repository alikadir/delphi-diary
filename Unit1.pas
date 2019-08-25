unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Mask, DBCtrls, ComCtrls,
  ExtCtrls, XPMan, SUIDlg, jpeg, Buttons, dcMinTray, Menus, SUIPopupMenu;

type
  Tform1 = class(TForm)
    ADOConnection1: TADOConnection;
    pass: TADODataSet;
    passadmin: TWideStringField;
    passpass: TWideStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DSpass: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    XPManifest1: TXPManifest;
    ProgressBar1: TProgressBar;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    suiPopupMenu1: TsuiPopupMenu;
    AileYakalanmaFalse1: TMenuItem;
    ProgramKaydetveKapat1: TMenuItem;
    Kapat1: TMenuItem;
    A1: TMenuItem;
    DCMinTray1: TDCMinTray;
    procedure FormActivate(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form1: Tform1;
 aliadmin,alipass:string;
 denemepas:integer;
 dur1:integer;
 implementation

uses Unit2 , unit3 , Unit4, Unit6, Unit7, Unit5;

{$R *.dfm}
procedure gecikme (ms : longint);
var t: longint;
begin
t:=gettickcount;
 while(gettickcount - t) < ms do
 application.ProcessMessages;
 if dur1>1 then
 exit;
end;

procedure Tform1.FormActivate(Sender: TObject);
 var
 x:integer;
 zaman:word;

 label deli,ali;

 begin

 aliadmin:=dbedit1.text;
 alipass:=dbedit1.Text;
 label6.Caption:='Hoþgeldin '+(aliadmin);
 x:=21;
ali:

 if x>=0 then
 begin
 gecikme(1000);
 x:=x-1;
 if x<10 then
 label5.caption:= '                   00:0'+inttostr(x)
 else
 label5.caption:= '                   00:'+inttostr(x);
 goto ali;
 end
 else
 if form2.Visible=false then
 begin
label5.Caption:='zaman doldu ! program kapatýlýyor..';
 gecikme(1000);

 zaman:=messagedlg('zaman doldu ! bu günlük senin mi  ?? ',mtwarning,[mbyes,mbno],0);
 if zaman=mrno then
form1.close
else
label5.Caption:='  busefer zamaný iyi kullan ! ..';

  
 end;
 end;





procedure Tform1.FormCreate(Sender: TObject);
var
ali: thandle;
begin
dur1:=0;
form1.Brush.Style:=bsclear;
form1.BorderStyle:=bsnone;
{form3.visible:=false;
form4.visible:=false;
form5.visible:=false;
form6.visible:=false;
form7.visible:=false;}
denemepas:=0;
AnimateWindow(form1.Handle, 1000, AW_VER_POSITIVE or AW_HIde);
edit2.PasswordChar:='*';
bitbtn1.Default:=true;
edit1.Text:='';
edit2.text:='';
label7.caption:='AKB software - design / Coded By alikadir®';
progressbar1.Visible:=false;
label10.caption:='';
label11.Visible:=false;
label9.Visible:=false;
label8.Visible:=false;
label7.visible:=false;
label6.Visible:=false;
label5.Caption:='                   00:00';
ali:=createroundrectrgn(5,12,374,198,200,100);
setwindowrgn(handle,ali,true);
end;

procedure Tform1.Button2Click(Sender: TObject);
begin
form1.Close;
end;



procedure Tform1.BitBtn1Click(Sender: TObject);
var
hata:word;
 ali: thandle;
begin
denemepas:=denemepas+1;
label10.Caption:='1. Deneme Baþarýsýz !';
edit2.PasswordChar:=#0;
if (edit1.text = aliadmin ) and (edit2.Text = alipass ) then
begin
 label10.visible:=false;
 label7.Visible:=true;
label6.Visible:=true;
progressbar1.Visible:=true;
edit1.Visible:=false;
edit2.Visible:=false;
bitbtn1.Visible:=false;
label3.Visible:=false;
label4.Visible:=false ;
label5.Visible:=false;



gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(50);
form1.ProgressBar1.stepby(5);
gecikme(200);
form1.ProgressBar1.stepby(5);
gecikme(200);
form1.ProgressBar1.stepby(5);
gecikme(200);
form1.ProgressBar1.stepby(5);
gecikme(200);
form1.ProgressBar1.stepby(5);
gecikme(200);
form1.ProgressBar1.stepby(5);
gecikme(200);
form1.ProgressBar1.stepby(5);
gecikme(200);
form1.ProgressBar1.stepby(5);
dur1:=dur1+2;
gecikme(200);
form1.ProgressBar1.stepby(5);


form2.show;
ali:=createroundrectrgn(1000,1000,2000,2000,1000,1000);
  setwindowrgn(handle,ali,true);
  end
 else

 hata:=messagedlg('yanlýþ þifre ! yetkili kullanýcýmýsýnýz ?? ',mterror,[mbyes,mbno],0);
 if hata=mrno then
 begin
 edit1.Visible:=false;
 edit2.Visible:=false;
 bitbtn1.Visible:=false;
 label3.Visible:=false;
 label4.Visible:=false;
 label8.Visible:=true;
 label8.Caption:='Baþkalarýnýn özelini '#13+'      karýþtýrmak '+#13+'   iyi bi huy deðil !';
 form1.close
 end
 else
 edit2.PasswordChar:='*';
 if denemepas=2 then
 begin
 label11.caption:=' 2  yalnýþ giriþ sonucu kapatýlýyor..';
 label11.Visible:=true;

 label10.Visible:=false;
 edit1.Visible:=false;
 edit2.Visible:=false;
 bitbtn1.Visible:=false;
 label3.Visible:=false;
 label4.Visible:=false;
 label8.Visible:=true;
 label8.Caption:='Baþkalarýnýn özelini '#13+'      karýþtýrmak '+#13+'   iyi bi huy deðil !';
 form1.close
 end;
 end;

end.
