-- zad

with Ada.Text_IO, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Numerics.Float_Random;

procedure Zad is
	type Wektor is array (Integer range <>) of Float;
	Tab: Wektor(1..20) := (others => 0.0);
	
	
	procedure Zapelnij(Tab: in out Wektor) is
		Gen : Generator;
	begin
		Reset(Gen);
	  -- losowanie elementow z zapisem do tablicy
	  for E of Tab loop 
	    E := Random(Gen);
	  end loop;
	end Zapelnij;
	
	procedure Wypisz(Tab: Wektor) is
	begin
	  -- wypisanie tablicy
	  for  I in Tab'Range loop
	    Put_Line("Tab(" & I'Img & ")=" & Tab(I)'Img);
	  end loop;
	end Wypisz;	
	
	function Sprawdz(A: Wektor) return Boolean is 
	begin
		return (for all I in A'First..(A'Last-1) => A(I+1)>=A(I));
	end Sprawdz;	
	
begin
	Zapelnij(Tab);
  Wypisz(Tab);
	Sprawdz(Tab);
end Zad;