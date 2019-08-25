unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, SUIDBCtrls, Grids, DBGrids, DB, DBCtrls,
  Mask, ADODB, SUIForm, SUIButton, SUIEdit, OleCtrls,
  ShellApi, jpeg, XPMan, Buttons, RzBorder, Menus, SUIPopupMenu, dcMinTray;

type
  TForm2 = class(TForm)
    Label4: TLabel;
    ADOTable1: TADOTable;
    ADOTable1baslk: TWideStringField;
    ADOTable1tarih: TWideStringField;
    ADOTable1gunluk: TMemoField;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    arama: TEdit;
    ADOConnection1: TADOConnection;
    Image1: TImage;
    XPManifest1: TXPManifest;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    RzLEDDisplay1: TRzLEDDisplay;
    RzLEDDisplay2: TRzLEDDisplay;
    Timer1: TTimer;
    DCMinTray1: TDCMinTray;
    suiPopupMenu1: TsuiPopupMenu;
    AileYakalanmaFalse1: TMenuItem;
    ProgramKaydetveKapat1: TMenuItem;
    Kapat1: TMenuItem;
    A1: TMenuItem;
    suiButton1: TsuiButton;

    procedure FormCreate(Sender: TObject);
    procedure suiEdit1Change(Sender: TObject);




   
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ProgramKaydetveKapat1Click(Sender: TObject);
    procedure Kapat1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure suiButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  kay:integer;
  dur2:integer;
implementation

uses Unit1, Unit3, Unit4, Unit5, Unit6, Unit7;

{$R *.dfm}
 procedure gecikme (ms : longint);
var t: longint;
begin
t:=gettickcount;
 while(gettickcount - t) < ms do
 application.ProcessMessages;
 if dur2>0 then
 exit;
end;




procedure TForm2.FormCreate(Sender: TObject);
var
x:string;
begin
dur2:=0;
kay:=1;
x:=form1.DBEdit1.Text;
label1.caption:='merhaba ;: '+(x);
adotable1.Insert;
{ form3.Visible:=false;
form4.Visible:=false;
form5.Visible:=false;
form6.Visible:=false;
form7.visible:=false;  }
//DBGrid1.visible:=false;
    label4.Visible:=false;

    dbmemo1.Text:=' Sevgili Günlük ; ';
    dbedit2.Text:='gün.ay.yýl';
    dbedit1.Text:='Günlük baþlýðý';
    end;

procedure TForm2.suiEdit1Change(Sender: TObject);
begin
{ dbgrid1. //:=[foCaseInsensitive]; //harf duyarliligi yok
Table1.Filter:='baþlýk='+QuotedStr(suiedit1.text+'*'); //Dosya No Arama kriteri
Table1.Filtered:=true; // Aramayi Baslat
table1.Open;
 if suiEdit1.Text='' then
Table1.Filtered:=false;   }
end;






procedure TForm2.BitBtn2Click(Sender: TObject);
var
 x:byte;
 a:word;

  OpStruc: TSHFileOpStruct;
  frombuf, tobuf: Array [0..128] of Char;
 begin

x:=150;
form2.AlphaBlendValue:=(x);
 a:=messagedlg('günlük yedekleme sistemi '+#13+'UpDate i baþlat menüsüne yerleþen yedek programý ile yapacaksýnýz..'+#13+' eski günlük kayýtlarýný yedeklemek istiyomusunuz? ',mtwarning,[mbyes,mbno],0);
 if a=mrno then
 begin
 x:=255;
form2.AlphaBlendValue:=(x);
 end;

 if a=mryes then
begin
createdir('d:\gunluk yedek');
  fillChar( OpStruc, Sizeof(OpStruc), 0 );
  FillChar( frombuf, Sizeof(frombuf), 0 );
  FillChar( tobuf, Sizeof(tobuf), 0 );
  StrPCopy( frombuf, 'C:\Program Files\GUNLUK\mediadbali\db\alidatabase.mdb' );
  StrPCopy( tobuf, 'd:\gunluk yedek' );
  With OpStruc DO Begin
    Wnd:= Handle;
    wFunc:= FO_COPY;
    pFrom:= @frombuf;
    pTo:=@tobuf;
    fFlags:= FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
  end;
  ShFileOperation( OpStruc );


if fileexists('d:\gunluk yedek\alidatabase.mdb') then
begin
showmessage('           yedekleme baþarýyla yapýldý !'+#13+'sakýn " D:\gunluk yedek "  klasörünü silme !!'+#13+'bundan sonra baþlat menüsündeki yedek programýndan UpDate edene kadar girilen bilgiler kaybolacak!!');
x:=255;
form2.AlphaBlendValue:=(x);
end
else
begin
showmessage('hata !! yedekleme yapýlamadý ! database e ulaþýlamadý ') ;
 x:=255;
form2.AlphaBlendValue:=(x);
end;
x:=255;
form2.AlphaBlendValue:=(x);
end;


 end;


procedure TForm2.BitBtn1Click(Sender: TObject);
 var
 a:byte;

 begin

 a:=messagedlg('Bölümlerin hepsi dolduruldumu kontrol et '+#13+' Tarihi doðru gir'+#13+'Söylediðim yerlerde yanlýþlýk varmý ?',mtconfirmation,[mbyes,mbno],0);
 if a=mrno then
 begin
 kay:=kay+2;
 adotable1.Insert;
showmessage('Baþarýyla Kaydedildi..');
 end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
var
x:string;
a:word;
label ali;
begin
if kay>2 then
begin
ali:
label1.visible:=false;
 x:=form1.DBEdit1.Text;

 label4.caption:='Güle güle '+(x);

  label4.Visible:=true;
   image1.Visible:=false;
   DBEdit1.Visible:=false;
    DBEdit2.Visible:=false;

    DBMemo1.Visible:=false;
     arama.Visible:=false;

     RzLEDDisplay2.Visible:=false;
     RzLEDDisplay1.Visible:=false;
      bitbtn3.Visible:=false;
     bitbtn2.Visible:=false;
     bitbtn1.Visible:=false;
      bitbtn5.Visible:=false;
      bitbtn7.Visible:=false;
      bitbtn6.Visible:=false;
      bitbtn4.Visible:=false;
      bitbtn8.Visible:=false;





 gecikme(2000);
  dur2:=dur2+2; // gecikme presedürünü durdurmak için koþul u doðrulama
  gecikme(1000);
  form2.adoconnection1.connected:=false;
  form1.adoconnection1.connected:=false;
  form1.Hide;
  form2.Hide;
  form6.close;
  form5.close;
  form4.close;
  form3.close;

  form2.close;
 form1.Close;
 application.terminate;
end
else
a:=messagedlg('Günlük kaydedilmemiþ görünüyo !!'+#13+'çýkmak istediðine eminmisin ??',mtwarning,[mbyes,mbno],0);
 if a=mryes then
 goto ali;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
var
 x:byte;
begin
{form2.Visible:=false;
form4.Visible:=false;
form5.Visible:=false;
form6.Visible:=false;
form7.visible:=false; }
x:=150;
form2.AlphaBlendValue:=(x);
form3.Show;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
var x:byte;
begin
x:=150;
{form2.Visible:=false;
form3.Visible:=false;
form5.Visible:=false;
form6.Visible:=false;
form7.visible:=false; }
form2.AlphaBlendValue:=(x);
form4.show;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
 var
 x:byte;
begin
x:=150;
{form2.Visible:=false;
form4.Visible:=false;
form5.Visible:=false;
form3.Visible:=false;
form7.visible:=false;}
form2.AlphaBlendValue:=(x);
form6.show;
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
 var
 x:byte;
begin
x:=150;
{form2.Visible:=false;
form4.Visible:=false;
form3.Visible:=false;
form6.Visible:=false;
form7.visible:=false;}
form2.AlphaBlendValue:=(x);
form5.show;
end;
procedure TForm2.BitBtn8Click(Sender: TObject);
begin
adotable1.Locate('tarih',arama.Text,[lopartialkey]);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Timer1.Interval:=1000;
Timer1.Enabled:=true;
rzleddisplay2.caption:=TimeToStr(Now);
rzleddisplay1.caption:=datetostr(Now);
end;

procedure TForm2.ProgramKaydetveKapat1Click(Sender: TObject);
var
 a:byte;
 x:string;
kontrl:word;
label ali;
 begin

 kontrl:=messagedlg('Bölümlerin hepsi dolduruldumu kontrol et '+#13+' Tarihi doðru gir'+#13+'Söylediðim yerlerde yanlýþlýk varmý ?',mtconfirmation,[mbyes,mbno],0);
 if kontrl=mrno then
 begin
 kay:=kay+2;
 adotable1.Insert;
showmessage('Baþarýyla Kaydedildi..');
 end;


begin
if kay>2 then
begin
ali:
label1.visible:=false;
 x:=form1.DBEdit1.Text;

 label4.caption:='Güle güle '+(x);

  label4.Visible:=true;
   image1.Visible:=false;
   DBEdit1.Visible:=false;
    DBEdit2.Visible:=false;

    DBMemo1.Visible:=false;
     arama.Visible:=false;

     RzLEDDisplay2.Visible:=false;
     RzLEDDisplay1.Visible:=false;
      bitbtn3.Visible:=false;
     bitbtn2.Visible:=false;
     bitbtn1.Visible:=false;
      bitbtn5.Visible:=false;
      bitbtn7.Visible:=false;
      bitbtn6.Visible:=false;
      bitbtn4.Visible:=false;
      bitbtn8.Visible:=false;





 gecikme(2000);
  dur2:=dur2+2; // gecikme presedürünü durdurmak için koþul u doðrulama
  gecikme(1000);
  form2.adoconnection1.connected:=false;
  form1.adoconnection1.connected:=false;
  form1.Hide;
  form2.Hide;
  form6.close;
  form5.close;
  form4.close;
  form3.close;

  form2.close;
 form1.Close;
 application.terminate;
end
else
a:=messagedlg('Günlük kaydedilmemiþ görünüyo !!'+#13+'çýkmak istediðine eminmisin ??',mtwarning,[mbyes,mbno],0);
 if a=mryes then
 goto ali;
end;
 end;
procedure TForm2.Kapat1Click(Sender: TObject);
var
x:string;
a:word;
label ali;
begin
if kay>2 then
begin
ali:
label1.visible:=false;
 x:=form1.DBEdit1.Text;

 label4.caption:='Güle güle '+(x);

  label4.Visible:=true;
   image1.Visible:=false;
   DBEdit1.Visible:=false;
    DBEdit2.Visible:=false;

    DBMemo1.Visible:=false;
     arama.Visible:=false;

     RzLEDDisplay2.Visible:=false;
     RzLEDDisplay1.Visible:=false;
      bitbtn3.Visible:=false;
     bitbtn2.Visible:=false;
     bitbtn1.Visible:=false;
      bitbtn5.Visible:=false;
      bitbtn7.Visible:=false;
      bitbtn6.Visible:=false;
      bitbtn4.Visible:=false;
      bitbtn8.Visible:=false;





 gecikme(2000);
  dur2:=dur2+2; // gecikme presedürünü durdurmak için koþul u doðrulama
  gecikme(1000);
  form2.adoconnection1.connected:=false;
  form1.adoconnection1.connected:=false;
  form1.Hide;
  form2.Hide;
  form6.close;
  form5.close;
  form4.close;
  form3.close;

  form2.close;
 form1.Close;
 application.terminate;
end
else
a:=messagedlg('Günlük kaydedilmemiþ görünüyo !!'+#13+'çýkmak istediðine eminmisin ??',mtwarning,[mbyes,mbno],0);
 if a=mryes then
 goto ali;
end;

procedure TForm2.A1Click(Sender: TObject);
begin
form2.WindowState:=wsmaximized;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=VK_CONTROL)and(key=VK_RETURN) then
form2.Hide;
end;

procedure TForm2.suiButton1Click(Sender: TObject);
begin
form1.WindowState:=wsminimized;
form2.WindowState:=wsminimized;
end;

end.





