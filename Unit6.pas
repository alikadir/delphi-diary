unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit2, Unit3;

{$R *.dfm}




procedure TForm6.FormCreate(Sender: TObject);
begin
 setwindowlong(handle,GWL_STYLE,getwindowlong(handle,GWL_STYLE) AND NOT WS_CAPTION);
height:=height+1;
end;

procedure TForm6.BitBtn1Click(Sender: TObject);
var
x:byte;
begin
x:=255;
form2.AlphaBlendValue:=(x);
form6.close;
end;
end.
