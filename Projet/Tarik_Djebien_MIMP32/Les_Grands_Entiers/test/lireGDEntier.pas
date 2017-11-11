// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : Test de la procedure lireGDEntier
program test;
uses U_Grands_Entiers,
	 U_Liste,
	 U_Element,
	 crt;

var S : STRING;
	G : GDENTIER;
	
BEGIN
  writeln;
  writeln(' TEST: procedure d''entrée / sortie ');
  writeln;
  writeln('Entrer un Grand Entier : ');
  
  //entrée
  lireGDEntier(G);
  // test de validité
  S:= GDEntier2String(G);
  if estChaineValide(S) then
  begin
  //Affichage du grand entier sous forme de liste
  writeln('Votre Grand entier est : ');
  //sortie
  ecrireGDEntier(G);
  end
  else
    writeln('Entrer une chaine composé uniquement de chiffres decimaux.');

writeln;
repeat until keypressed;
end.
