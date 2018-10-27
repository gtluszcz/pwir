with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics.discrete_Random ,Ada.Strings.Fixed;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;
procedure Lab4Tree is

type Element is
  record 
    Data : Integer := 0;
    Up : access Element := Null;
    Left : access Element := Null;
    Right : access Element := Null;
  end record; 

type Elem_Ptr is access all Element;

Function Depth(Tree: in Elem_Ptr; Deep: in Integer) return Integer is
begin
    If Tree = Null then
        return Deep;
    else
        return Integer'Max(
            Depth(Tree.Left, Deep+1),
            Depth(Tree.Right, Deep+1)
        );
    end if;
end Depth;


Procedure Print(Tree: in Elem_Ptr) is
begin
    if Tree /= Null then
        Put("(");
        if Tree.Left /= Null then
            Print(Tree.Left);
            Put("<-");
        end if;
        Put(Tree.Data, Width => 0);
        if Tree.Right /= Null then
            Put("->");
            Print(Tree.Right);
        end if;
        Put(")");
    end if;
end Print;


-- TODO Make Up pointer useful
Procedure Wstaw(Tree: in out Elem_Ptr; N: Integer) is
    Elem: Elem_Ptr := new Element;
begin
    Elem.Data := N;
    If Tree = Null then
        Tree := Elem;
    else
        if Elem.Data < Tree.Data then
            Wstaw(Tree.Left, N);
        else
            Wstaw(Tree.Right, N);
        end if;   
    end if;
end Wstaw;

Function Search(Tree: in out Elem_Ptr; N: in Integer) return Boolean is
begin
    if Tree /= Null and then Tree.Data = N then
        return True;
    elsif  Tree /= Null and then Tree.Data /= N then
        return Search(Tree.Left, N) or Search(Tree.Right,N);
    else 
        return False;
    end if;
end Search;

Procedure Serialize(Tree: in out Elem_Ptr) is
begin
    if Tree /= Null then
        Put("{");
        Put("""data"":");
        Put("""");
        Put(Tree.Data, Width => 0);
        Put("""");
        Put(",""left"":");
        Serialize(Tree.Left);
        Put(",""right"":");
        Serialize(Tree.Left);
        Put("}");
    else
        Put("null");
    end if;
end Serialize;

Tree: Elem_Ptr := Null;
begin
    Wstaw(Tree, 5);
    Wstaw(Tree, 3);
    Wstaw(Tree, 6);
    Wstaw(Tree, 5);
    Wstaw(Tree, 2);
    Print(Tree);
    Put_Line(Search(Tree, 7)'Img);
    Serialize(Tree);

end Lab4Tree;