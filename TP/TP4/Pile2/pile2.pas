PROGRAM pile1;
USES U_Pile,
     U_Element,
     crt;

const MAX = 100;

VAR tab : ARRAY[1..MAX] of ELEMENT;
    P : PILE;
    i : CARDINAL;


       
BEGIN
clrscr;
  
  i:= 1;
  P:= PILE_VIDE;
  
  writeln('Entrez une suite de nombre un à un en la terminant par un chifre negatif : ');
  
  
  {
    lit un à un une suite de nombres saisis au clavier, ces chifres étant empilés succesivement dans une
    pile initialement vide. La suite des nombres lus est terminée lorsque l'utilisateur entre un chiffre negatif (ce
    dernier chiffre ne pouvant donc pas faire partie de la suite lue, et n'étant donc pas empiler).
  }
  
  
   
    repeat
      begin
        lireElement(tab[i]);
        if tab[i] >= 0 then
        begin
        empiler(tab[i],P);
        i:= i + 1;
        end;
      end;
    until tab[i] < 0 ;
   
  // vide la pile en écrivant les chifres un à un.
writeln;
  while not(estPileVide(P)) do
    begin
    ecrireElement(sommet(P));
    depiler(P);
    end;

repeat until keypressed;    
END.
