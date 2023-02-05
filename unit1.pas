unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button_Info: TButton;
    Button_EndProgram: TButton;
    Button_Quick_Sort: TButton;
    Button_Sort_Bubble: TButton;
    Button_Kopiuj: TButton;
    Button_Kopiuj_Odwrotnie: TButton;
    Button_Losuj: TButton;
    Button_Sort_Insertion_w_Guard: TButton;
    Button_Sort_Insertion: TButton;
    Button_Selection_Sort: TButton;
    Edit_Liczba_Zamian: TEdit;
    Edit_Liczba_Porownan: TEdit;
    Label_Liczba_Zamian: TLabel;
    Label_Dane_Zrodlowe: TLabel;
    Label_Dane_Posortowane: TLabel;
    Label_Liczba_Porownan: TLabel;
    ListBox_Zrodlowe: TListBox;
    ListBox_Posortowane: TListBox;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.

