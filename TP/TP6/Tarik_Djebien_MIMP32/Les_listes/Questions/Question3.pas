// auteur : Djebien Tarik
// date   : novembre 2009
// objet  : Calcul de la longueur d'une Liste 

program Question3;
uses U_Exemples_Listes,
     U_Liste,
     U_Element;



function longueurListe(L: LISTE): INTEGER;
var res : INTEGER;
begin
  res:= 0;
  while not(estListeVide(L)) do
    begin
      L:= reste(L);
      res:= res + 1;
    end{while};

  longueurListe:= res;
end{longueurListe};

BEGIN
  writeln;
  writeln('Question 4.');
  writeln('La longueur de la liste numero ',NBLISTES,' est ',longueurListe(tab_listes[NBLISTES]));   
  writeln;
END.
