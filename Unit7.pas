unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ShellApi;

type
  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
var
x:byte;
begin
x:=255;
form2.AlphaBlendValue:=(x);
form7.close;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  setwindowlong(handle,GWL_STYLE,getwindowlong(handle,GWL_STYLE) AND NOT WS_CAPTION);
height:=height+1;
end;

procedure TForm7.Button2Click(Sender: TObject);
var
  OpStruc: TSHFileOpStruct;
  frombuf, tobuf: Array [0..128] of Char;
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
showmessage('        yedekleme ba�ar�yla yap�ld� !'+#13+' sak�n " D:\gunluk yedek " klas�r�n� silme !!'+#13+'�uandan itibaren g�nl�k program� tekrar kurulana kadar �al��m�yacak !!')
else
showmessage('hata !! yedekleme yap�lamad� ! database e ula��lamad� ') ;
end;

procedure TForm7.Button3Click(Sender: TObject);

begin
 deletefile('C:\Program Files\GUNLUK\mediadbali\db\alidatabase.mdb');
  begin
renamefile('d:\gunluk yedek\alidatabase.mdb','C:\Program Files\GUNLUK\mediadbali\db\alidatabase.mdb');
   deletefile('d:\gunluk yedek\*.*');
if fileexists('C:\Program Files\GUNLUK\mediadbali\db\alidatabase.mdb') then
showmessage('UpDate ba�ar�l� !'+#13+' kurulumdan sonra yazd���n g�nl�k silindi !'+#13+'�uan son yedekledi�in bilgiler geri geldi..')
else
showmessage('hata yedeklenemedi d:\gunluk yedek\alidatabase.mdb ye ula��lam�yor ! ') ;
end;
removedir('d:\gunluk yedek');

end;

end.
