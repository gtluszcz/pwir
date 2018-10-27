with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.discrete_Random;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Lab4Lista is

type Element is
  record 
    Data : Integer := 0;
    Next : access Element := Null;
  end record; 

type Elem_Ptr is access all Element;

procedure Print(List : access Element) is
  L : access Element := List;
begin
  if List = Null then
    Put_Line("List EMPTY!");
  else
    Put_Line("List:"); 
  end if; 
  while L /= Null loop
    Put(L.Data, 4);
    New_Line;
    L := L.Next;
  end loop; 
end Print;

procedure Insert(List : in out Elem_Ptr; D : in Integer) is
  E : Elem_Ptr := new Element; 
begin
  E.Data := D;
  E.Next := List;
  -- lub E.all := (D, List);
  List := E;
end Insert;

function Insert(List : access Element; D : in Integer) return access Element is 
  ( new Element'(D,List) ); 

procedure Insert_Sort(List : in out Elem_Ptr; D : in Integer) is 
  E : Elem_Ptr := new Element;
  L : Elem_Ptr := List;
begin
  E.Data := D;
  if List = Null then
    List := E;
  else
    while L.Next /= Null and then L.Next.Data < E.Data loop
      L := L.Next;
    end loop; 
    E.Next := L.Next;
    L.Next := E;
  end if;
end Insert_Sort;

procedure Insert_Random(List: in out Elem_Ptr; N : in Integer; M : in Integer) is
  subtype Die is Integer range 1 .. M;
  package Random_Die is new Ada.Numerics.Discrete_Random (Die);
  use Random_Die;
  G : Generator;
begin
  Reset(G);
  for I in 1..N loop
    Insert_Sort(List,Random(G));
  end loop;
end Insert_Random;

function Search(List: in Elem_Ptr; N: in Integer) return Boolean is
  L : access Element := List;
begin
  if List = Null then
    return False;
  end if; 
  while L /= Null loop
    if L.Data = N then 
      return True;
    end if;
    L := L.Next;
  end loop;
  return False; 
end Search;

procedure Delete(List: in out Elem_Ptr; N: in Integer) is
  L : access Element := List;
  P : access Element := List;
begin
  if List /= Null then 
    if List.Data = N then
      List := List.Next;
    else
      while L /= Null and then L.Data /= N loop
          P := L;
          L := L.Next;
        end loop; 

      P.Next := L.Next;
    end if;
  end if;
end Delete;


Lista : Elem_Ptr := Null;

begin
  Print(Lista);
  Lista := Insert(Lista, 21);
  for I in reverse 1..20 loop
    Insert(Lista,I);
  end loop;
  Insert_Sort(Lista, 223);
  Insert_Random(Lista, 2, 999);
  Put_Line(Search(Lista, 21)'Img);
  Delete(Lista, 21);
  Print(Lista);
end Lab4Lista;