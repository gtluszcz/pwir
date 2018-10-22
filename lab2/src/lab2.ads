package lab2 is
   
   type Wektor is array (Integer range <>) of Float;
   
   function Sprawdz(A     : Wektor) return Boolean;
   
   procedure Zapelnij(Tab : in out Wektor);
   procedure Wypisz(Tab   : Wektor);
   procedure Sortuj(Tab: in out Wektor);
   procedure Zapisz(Tab: in Wektor);

end lab2;
