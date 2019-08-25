unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, XPMan, jpeg,
  ExtCtrls, Buttons;

type
  TForm5 = class(TForm)
    Image1: TImage;
    XPManifest1: TXPManifest;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
   
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit2, Unit3;

{$R *.dfm}




procedure TForm5.FormCreate(Sender: TObject);
begin
 setwindowlong(handle,GWL_STYLE,getwindowlong(handle,GWL_STYLE) AND NOT WS_CAPTION);
height:=height+1;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
var
x:byte;
begin
x:=255;
form2.AlphaBlendValue:=(x);
form5.close;
end;

end.
