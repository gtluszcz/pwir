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

Procedure Insert(Tree: in out Elem_Ptr; N: Integer) is
    Elem: Elem_Ptr := new Element;
    P: Elem_Ptr := Null;
    L: Elem_Ptr := Tree;
    IsLeft: Boolean;
begin
    Elem.Data := N;
    If Tree = Null then
        Elem.Up := P;
        Tree := Elem;
    else
        while L /= Null loop
            P := L;
            if N < L.Data then
                L := L.Left;
                IsLeft := True;
            else
                L := L.Right;
                IsLeft := False;
            end if;   
        end loop;

        if IsLeft then
            P.Left := Elem;
        else
            P.Right := Elem;
        end if;

        Elem.Up := P;
    end if;
end Insert;

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
    Insert(Tree, 5);
    Insert(Tree, 3);
    Insert(Tree, 6);
    Insert(Tree, 5);
    Insert(Tree, 2);
    Print(Tree);
    Put_Line(Search(Tree, 7)'Img);
    Serialize(Tree);

end Lab4Tree;