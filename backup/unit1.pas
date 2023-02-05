unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

const
  cRozmiarTablicy = 20;

type

  { TSort }

  TSort = class(TForm)
    Button_Info: TButton;
    Button_EndProgram: TButton;
    Button_Quick: TButton;
    Button_Bubble: TButton;
    Button_Kopiuj: TButton;
    Button_Kopiuj_Odwrotnie: TButton;
    Button_Losuj: TButton;
    Button_Insertion_w_Guard: TButton;
    Button_Insertion: TButton;
    Button_Selection: TButton;
    Edit_Liczba_Zamian: TEdit;
    Edit_Liczba_Porownan: TEdit;
    Label_Liczba_Zamian: TLabel;
    Label_Dane_Zrodlowe: TLabel;
    Label_Dane_Posortowane: TLabel;
    Label_Liczba_Porownan: TLabel;
    ListBox_Zrodlowe: TListBox;
    ListBox_Posortowane: TListBox;
    procedure Button_EndProgramClick(Sender: TObject);
    procedure Button_InfoClick(Sender: TObject);
    procedure Button_KopiujClick(Sender: TObject);
    procedure Button_Kopiuj_OdwrotnieClick(Sender: TObject);
    procedure Button_LosujClick(Sender: TObject);
    procedure Wyswietl_Zrodlo;
  private
    tabSort : array [0..cRozmiarTablicy] of integer;
    tabLiczb : array [0..cRozmiarTablicy] of integer;
    zmienna1, zmienna2 : integer;

  public

  end;

var
  Sort: TSort;

implementation

{$R *.lfm}


{ TSort }

procedure TSort.Button_InfoClick(Sender: TObject);
var
  komunikat : string;
begin
  komunikat := 'Programista: Marek Górski, Wersja programu v 0.1.1';
  Application.MessageBox(PChar(komunikat),'Info');
end;

procedure TSort.Button_KopiujClick(Sender: TObject);
begin

end;

procedure TSort.Button_Kopiuj_OdwrotnieClick(Sender: TObject);
begin

end;

procedure TSort.Button_LosujClick(Sender: TObject);
begin

end;

procedure TSort.Button_EndProgramClick(Sender: TObject);
begin
  Application.Terminate;
end;


procedure TSort.Wyswietl_Zrodlo;
var
  i : integer;
begin
  ListBox_Zrodlowe.Clear;
  for i:=1 to cRozmiarTablicy do
  ListBox_Zrodlowe.Items.Add (IntToStr(i) + ': ' + IntToStr(tabLiczb[i]));
end;

end.

