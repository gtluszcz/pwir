with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.discrete_Random ,Ada.Strings.Fixed,  Ada.Containers.Doubly_Linked_Lists,  Ada.Numerics.Generic_Elementary_Functions, Ada.Containers.Vectors, Ada.Calendar;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed, Ada.Containers, Ada.Numerics, Ada.Calendar;
procedure Lab4Sito is

package Lists_Integer is new Doubly_Linked_Lists(Integer);
package Math is new Generic_Elementary_Functions(Float);
use Math;
use Lists_Integer;

procedure Eratostenes(N: in Integer) is
    Lista: Lists_Integer.List;
begin
    for i in 2..N loop
    Lista.Append(i);
    end loop;

    for i in 2..Integer(Sqrt(Float(N))) loop
        for j in Lista.Iterate loop
            if (Element(j) mod i) = 0 and then Element(j) /= i then
                Replace_Element(Lista,j,1);
            end if;
        end loop;
    end loop;

    for i of Lista loop
        if i /= 1 then
            Put(i'Img);
        end if;
    end loop;
end Eratostenes;

package Float_Container is new Vectors(Natural,Integer);    -- changed
use Float_Container;
procedure Eratostenes2(N: in Integer) is
    Vektor: Vector;
    J: Integer;
begin
    for i in 1..N loop
    Append(Vektor,i);
    end loop;

    for i in 2..Integer(Sqrt(Float(N))) loop
        J := i*i;
        while J <= Integer(Length(Vektor)) loop
            Replace_Element(Vektor,J-1,1);
            J := J + i;
        end loop;
    end loop;

    for i of Vektor loop
        if i /= 1 then
            Put(i'Img);
        end if;
    end loop;
end Eratostenes2;


T1, T2: Time; -- czasy bezwzgledne
D: Duration;  -- czas względny, 

begin
    T1 := Clock;
    Eratostenes(100000);
    T2 := Clock;
    D := T2 - T1;
    Put_Line("Czas pierwszy " & D'Img);
    T1 := Clock;
    Eratostenes2(100000);
    T2 := Clock;
    D := T2 - T1;
    Put_Line("Czas drugi " & D'Img);
end Lab4Sito;