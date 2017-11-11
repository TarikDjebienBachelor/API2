PROGRAM pile1;
USES U_Pile,
     U_Element,
     crt;

const MAX = 100;

VAR tab : ARRAY[1..MAX] of ELEMENT;
    P : PILE;
    i : CARDINAL;

const  stop = '.' ;
       
BEGIN
clrscr;
  
  i:= 1;
  P:= PILE_VIDE;
  
  writeln('Entrez des caracteres un à un en la terminant par un point : ');
  
  
  {
    lit un à un une suite de caractères saisis au clavier, ces caractères étant empilés succesivement dans une
    pile initialement vide. La suite des caractères lus est terminée lorsque l'utilisateur entre le caractère ’.’ (ce
    dernier caractère ne pouvant donc pas faire partie de la suite lue, et n'étant donc pas empiler).
  }
  
  
   
    repeat
      begin
        lireElement(tab[i]);
        if tab[i] <> stop then
        begin
        empiler(tab[i],P);
        i:= i + 1;
        end;
      end;
    until tab[i] = stop ;
writeln;   
  // vide la pile en écrivant les caractères un à un.

  while not(estPileVide(P)) do
    begin
    ecrireElement(sommet(P));
    depiler(P);
    end;

repeat until keypressed;    
END.
