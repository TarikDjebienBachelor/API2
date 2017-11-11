// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : novembre 2009
// objet  : Test de la nouvelle Unité U_Element.pas 

program Question2;
uses U_Element;

var e1,e2 : ELEMENT;

 

BEGIN
  writeln;
  writeln('Question 2.');
  writeln;
  
  write('entrer e1 : ');readln(e1);
  write('entrer e2 : ');readln(e2);
  writeln('e1 = e2 est ',egal(e1,e2));
  writeln('e1 < e2 est ',inferieur(e1,e2));
  writeln('e1 <= e2 est ',inferieurOuEgal(e1,e2));
  
  writeln;
END.
