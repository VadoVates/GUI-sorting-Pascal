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
    procedure Button_BubbleClick(Sender: TObject);
    procedure Button_EndProgramClick(Sender: TObject);
    procedure Button_InfoClick(Sender: TObject);
    procedure Button_InsertionClick(Sender: TObject);
    procedure Button_Insertion_w_GuardClick(Sender: TObject);
    procedure Button_KopiujClick(Sender: TObject);
    procedure Button_Kopiuj_OdwrotnieClick(Sender: TObject);
    procedure Button_LosujClick(Sender: TObject);
    procedure Button_QuickClick(Sender: TObject);
    procedure Button_SelectionClick(Sender: TObject);
    procedure Wyswietl_Zrodlo;
    procedure Wyswietl_Posortowane;
    procedure Wypelnienie_Tablicy;
    procedure KopiowanieDoSort;
    procedure KopiowanieDoLiczb;
    procedure KopiowanieOdwrotne;
    procedure SortowanieBabelkowe;
    procedure SortowanieProsteWstawianie;
    procedure SortowanieWstawianieZeStraznikiem;
    procedure SortowanieProsteWybieranie;
    procedure SortowanieSzybkie (lewa, prawa : integer);
    procedure Zamien (var x, y : integer);
  private
    tabSort : array [0..cRozmiarTablicy] of integer;
    tabLiczb : array [0..cRozmiarTablicy] of integer;
    liczbaZamian, liczbaPorownan : integer;

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

procedure TSort.Button_InsertionClick(Sender: TObject);
begin
  KopiowanieDoSort;
  SortowanieProsteWstawianie;
  Wyswietl_Posortowane;
  Edit_Liczba_Zamian.Clear;
  Edit_Liczba_Zamian.Text:=IntToStr(liczbaZamian);
  liczbaZamian:=0;
  Edit_Liczba_Porownan.Clear;
  Edit_Liczba_Porownan.Text:=IntToStr(liczbaPorownan);
  liczbaPorownan:=0;
end;

procedure TSort.Button_Insertion_w_GuardClick(Sender: TObject);
begin
  KopiowanieDoSort;
  SortowanieWstawianieZeStraznikiem;
  Wyswietl_Posortowane;
  Edit_Liczba_Zamian.Clear;
  Edit_Liczba_Zamian.Text:=IntToStr(liczbaZamian);
  liczbaZamian:=0;
  Edit_Liczba_Porownan.Clear;
  Edit_Liczba_Porownan.Text:=IntToStr(liczbaPorownan);
  liczbaPorownan:=0;
end;

procedure TSort.Button_KopiujClick(Sender: TObject);
begin
  ListBox_Zrodlowe.Clear;
  KopiowanieDoLiczb;
  Wyswietl_Zrodlo;
end;

procedure TSort.Button_Kopiuj_OdwrotnieClick(Sender: TObject);
begin
  ListBox_Zrodlowe.Clear;
  KopiowanieOdwrotne;
  Wyswietl_Zrodlo;
end;

procedure TSort.Button_LosujClick(Sender: TObject);
begin
  Wypelnienie_Tablicy;
  Wyswietl_Zrodlo;
end;

procedure TSort.Button_QuickClick(Sender: TObject);
begin
  KopiowanieDoSort;
  SortowanieSzybkie (1, cRozmiarTablicy);
  Wyswietl_Posortowane;
  Edit_Liczba_Zamian.Clear;
  Edit_Liczba_Zamian.Text:=IntToStr(liczbaZamian);
  liczbaZamian:=0;
  Edit_Liczba_Porownan.Clear;
  Edit_Liczba_Porownan.Text:=IntToStr(liczbaPorownan);
  liczbaPorownan:=0;
end;

procedure TSort.Button_SelectionClick(Sender: TObject);
begin
  KopiowanieDoSort;
  SortowanieProsteWybieranie;
  Wyswietl_Posortowane;
  Edit_Liczba_Zamian.Clear;
  Edit_Liczba_Zamian.Text:=IntToStr(liczbaZamian);
  liczbaZamian:=0;
  Edit_Liczba_Porownan.Clear;
  Edit_Liczba_Porownan.Text:=IntToStr(liczbaPorownan);
  liczbaPorownan:=0;
end;

procedure TSort.Button_EndProgramClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TSort.Button_BubbleClick(Sender: TObject);
begin
  KopiowanieDoSort;
  SortowanieBabelkowe;
  Wyswietl_Posortowane;
  Edit_Liczba_Zamian.Clear;
  Edit_Liczba_Zamian.Text:=IntToStr(liczbaZamian);
  liczbaZamian:=0;
  Edit_Liczba_Porownan.Clear;
  Edit_Liczba_Porownan.Text:=IntToStr(liczbaPorownan);
  liczbaPorownan:=0;
end;

procedure TSort.Wypelnienie_Tablicy;
var
  i : integer;
begin
  Randomize;
  for i:=1 to cRozmiarTablicy do
      tabLiczb[i]:=random(1000);
  liczbaZamian:=0;
  liczbaPorownan:=0;
end;

procedure TSort.Wyswietl_Zrodlo;
var
  i : integer;
begin
  ListBox_Zrodlowe.Clear;
  for i:=1 to cRozmiarTablicy do
      ListBox_Zrodlowe.Items.Add (IntToStr(i) + ': ' + IntToStr(tabLiczb[i]));
end;

procedure TSort.Wyswietl_Posortowane;
var
  i : integer;
begin
  ListBox_Posortowane.Clear;
  for i:=1 to cRozmiarTablicy do
      ListBox_Posortowane.Items.Add (IntToStr(i) + ': ' + IntToStr(tabSort[i]));
end;

procedure TSort.KopiowanieDoSort;
var
  i : word;
begin
  for i:=1 to cRozmiarTablicy do
      tabSort[i]:=tabLiczb[i];
end;

procedure TSort.KopiowanieDoLiczb;
var
  i : word;
begin
  for i:=1 to cRozmiarTablicy do
      tabLiczb[i]:=tabSort[i];
end;

procedure TSort.KopiowanieOdwrotne;
var
  i : word;
begin
  for i:=1 to cRozmiarTablicy do
      tabLiczb[i]:=tabSort[cRozmiarTablicy-i+1];
end;

procedure TSort.SortowanieBabelkowe;
var
  i, j : word;
begin
  for i:=1 to cRozmiarTablicy-1 do
      begin
        for j:=cRozmiarTablicy downto i+1 do
            begin
              liczbaPorownan:=liczbaPorownan+1;
              if (tabSort [j-1]>tabSort [j]) then
              begin
                Zamien (tabSort[j-1], tabSort[j]);
                liczbaZamian:=liczbaZamian+1;
              end;
            end;
      end;
end;

procedure TSort.Zamien (var x, y : integer);
var
  temp : integer;
begin
  temp:=x;
  x:=y;
  y:=temp;
end;

procedure TSort.SortowanieProsteWstawianie;
var
  i, j : integer;
  czyKoniec : boolean;
begin
  for i:=1 to cRozmiarTablicy-1 do
      begin
        czyKoniec:=false;
        j:=i+1;
        repeat
          liczbaPorownan:=liczbaPorownan+1;
          if (tabSort[j]<tabSort[j-1]) then
          begin
            liczbaZamian:=liczbaZamian+1;
            Zamien (tabSort[j],tabSort[j-1]);
            j:=j-1;
          end
          else
              czyKoniec:=true;
        until (j=1) or (czyKoniec=true);
      end;
end;

procedure TSort.SortowanieWstawianieZeStraznikiem;
var
  i, j, temp : integer;
begin
  for i:=2 to cRozmiarTablicy do
      begin
        temp:=tabSort[i];
        tabSort[0]:=temp;
        j:=i-1;
        liczbaPorownan:=liczbaPorownan+1;
        while temp<tabSort[j] do
        begin
          liczbaZamian:=liczbaZamian+1;
          tabSort[j+1]:=tabSort[j];
          j:=j-1;
        end;
        tabSort[j+1]:=temp;
      end;
end;

procedure TSort.SortowanieProsteWybieranie;
var
  i, j, min : integer;
begin
  for i:=1 to cRozmiarTablicy-1 do
      begin
        min:=i;
        for j:=i to cRozmiarTablicy do
            begin
              liczbaPorownan:=liczbaPorownan+1;
              if tabSort[min]>tabSort[j] then min:=j;
            end;
        Zamien (tabSort[i],tabSort[min]);
        liczbaZamian:=liczbaZamian+1;
      end;
end;

procedure TSort.SortowanieSzybkie (lewa, prawa : integer);
var
  i, j, srodek : integer;
begin
  i:=(lewa+prawa) div 2;
  srodek := tabSort[i];
  tabSort[i]:=tabSort[prawa];
  j:=lewa;
  for i:=lewa to prawa-1 do
      begin
        liczbaPorownan:=liczbaPorownan+1;
        if (tabSort[i] < srodek) then
        begin
          liczbaZamian:=liczbaZamian+1;
          Zamien (tabSort[i],tabSort[j]);
          j:=j+1;
        end;
      end;
  tabSort[prawa]:=tabSort[j];
  tabSort[j]:=srodek;
  if (lewa<(j-1)) then SortowanieSzybkie(lewa, j-1);
  if ((j+1)<prawa) then SortowanieSzybkie(j+1,prawa);
end;

end.

