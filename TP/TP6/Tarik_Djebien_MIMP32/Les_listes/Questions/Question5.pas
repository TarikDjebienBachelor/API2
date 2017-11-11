// auteur : Djebien Tarik
// date   : novembre 2009
// objet  : Affichage à l'ecran des élements d'une Liste 

program Question5;
uses U_Exemples_Listes,
     U_Liste,
     U_Element;

var i : INTEGER;

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

// Affiche les élements de la liste sans les parentheses
procedure ElementListe(const L: LISTE);
begin
   if not(estListeVide(L)) then
     begin
       write(tete(L));
       if not(estListeVide(reste(L))) then
         begin
           write(',');
           ElementListe(reste(L));
         end{if};
     end{if};
end{ElementListe};

// Affiche les élements de la liste avec les parentheses
procedure AffichageListe(const L: LISTE);
begin
   write('(');
   ElementListe(L);
   write(')');
end{AffichageListe};

BEGIN
  writeln;
  writeln('Question 6.');
  writeln;
  
  // On affiche chaque liste de tab_listes accompagné de sa longueur 
  for i := 1 to NBLISTES do 
    begin
      writeln('Pour la liste numero ',i,' on a : ');
      write('L',i,' = ');
      AffichageListe(tab_listes[i]);
      writeln;
      writeln('Longueur de L',i,' = ',longueurListe(tab_listes[i]));
      writeln;
    end{for};
  
END.
