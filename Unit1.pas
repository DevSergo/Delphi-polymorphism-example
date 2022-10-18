(*
        Простой пример использования ad-hoc Полиморфизма в Delphi
        на примере функции Add
*)


unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btAddIntegerValues: TButton;
    btAddStringValues: TButton;
    edValue1: TEdit;
    edValue2: TEdit;
    procedure btAddIntegerValuesClick(Sender: TObject);
    procedure btAddStringValuesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

function Add(x,y:integer): integer; overload;
begin
  Result := x + y;
end;

function Add(x,y:string): string; overload;
begin
  Result := 'Итоговая строка: ' + x + y;
end;

{$R *.dfm}

procedure TForm1.btAddIntegerValuesClick(Sender: TObject);
var
  ResultValue: string;
  IntValue1, IntValue2: integer;
begin
            /// здесь, передаём в функцию Add числовые аргументы
  try
    IntValue1 := strtoint(trim(edValue1.Text));
    IntValue2 := strtoint(trim(edValue2.Text));
    ResultValue := inttostr ( Add(IntValue1, IntValue2) );
    ShowMessage(ResultValue);
  except
    ShowMessage('Ошибка конвертации строка - число');
  end;
end;

procedure TForm1.btAddStringValuesClick(Sender: TObject);
var
  ResultValue: string;
begin
            /// здесь, передаём в функцию Add строковые аргументы
  ResultValue := Add(edValue1.Text, edValue2.Text);
  ShowMessage(ResultValue);
end;

end.
