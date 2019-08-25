unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, Buttons;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    XPManifest1: TXPManifest;
    BitBtn1: TBitBtn;
    
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit2;

{$R *.dfm}




procedure TForm4.FormCreate(Sender: TObject);
begin
 setwindowlong(handle,GWL_STYLE,getwindowlong(handle,GWL_STYLE) AND NOT WS_CAPTION);
height:=height+1;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
x:byte;
begin
x:=255;
form2.AlphaBlendValue:=(x);
form4.close;
end;
end.
