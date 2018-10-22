with Ada.Text_IO, lab2;
use Ada.Text_IO, lab2;

procedure Main is
   Tab: Wektor(0..19) := (others => 0.0);
begin
   Zapelnij(Tab);
   Wypisz(Tab);
   Put_Line(Sprawdz(Tab)'Image);
   Sortuj(Tab);
   Wypisz(Tab);
   Put_Line(Sprawdz(Tab)'Image);
   Zapisz(Tab);
end Main;
