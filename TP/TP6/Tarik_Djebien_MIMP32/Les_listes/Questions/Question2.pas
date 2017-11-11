// auteur : Djebien Tarik
// date   : novembre 2009
// objet  : Programme de test de l'unité U_Liste et U_Exemples_Listes

program Question2;
uses U_Exemples_Listes,
     U_Liste,
     U_Element;

var i : INTEGER;

BEGIN

  for i := 1 to NBLISTES do 
    begin
      writeln('Pour la liste numero ',i,' on a les deux premiers élements : ');
      ecrireElement(tete(tab_listes[i]));
      ecrireElement(tete(reste(tab_listes[i])));
      writeln;
    end{for};
END.
