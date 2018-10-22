with Ada.Text_IO, Ada.Numerics.Float_Random, Ada.Sequential_IO, Ada.Direct_IO;
use Ada.Text_IO, Ada.Numerics.Float_Random;

package body lab2 is
   
   procedure Zapelnij(Tab : in out Wektor) is
      Gen                 : Generator;
   begin
      Reset(Gen);
      -- losowanie elementow z zapisem do tablicy
      for E of Tab loop
         E := Random(Gen);
      end loop;
   end Zapelnij;

   procedure Wypisz(Tab   : Wektor) is
   begin
      -- wypisanie tablicy
      for  I in Tab'Range loop
         Put_Line("Tab(" & I'Img & ")=" & Tab(I)'Img);
      end loop;
   end Wypisz;

   function Sprawdz(A     : Wektor) return Boolean is
   begin
      return (for all I in A'First..(A'Last-1) => A(I+1)>=A(I));
   end Sprawdz;
   
   procedure Sortuj(Tab: in out Wektor) is
      Temp: Float;
   begin
      for I in Tab'First..(Tab'Last-1) loop
         for J in (I+1)..Tab'Last loop
            if Tab(J) < Tab(I) then
               Temp := Tab(I);
               Tab(I) := Tab(J);
               Tab(J) := Temp;
            end if;    
         end loop;
      end loop;
   end Sortuj;
   
   procedure Zapisz(Tab: in Wektor) is
      FTLog : FILE_TYPE;
   begin
      Create (FTLog, Out_File, "zapisane.txt");
      for I in Tab'Range loop
         Put_Line(FTLog, Tab(I)'Img);
      end loop;
      Close (FTLog);
   end Zapisz;
   
end lab2;
