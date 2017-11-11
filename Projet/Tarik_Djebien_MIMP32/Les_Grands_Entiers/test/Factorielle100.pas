// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : Factorielle 100

program factorielle100;
uses SysUtils,
	 U_Grands_Entiers;

function factGDEntier(n : GDENTIER) : GDENTIER;
begin
  if n = ZERO then
    factGDEntier := string2GDEntier('1')
  else 
    factGDEntier := mult(n,factGDEntier(string2GDEntier(IntToStr((StrToInt(GDEntier2String(n)))-1))));
end;//factGDEntier
 
 
var 
  G : GDENTIER;
begin
  writeln('f(n) = n! ');write('n = ');lireGDEntier(G);
  ecrireGDEntier(G);write('! = ');
  ecrireGDEntier(factGDEntier(G));
  writeln;
  writeln;
  writeln('Remarque : ');
  writeln(' l''inconvenient est que ce programme effectue le calcul du factorielle de 100');
  writeln(' et plus generalement de n! pour 0 <= n <= 2^32 -1 mais pas d''un grand entier.');
  writeln('En effet prenons cet exemple : ');
  writeln(' 1111 2222 3333 4444 ! = 1111 2222 3333 4444 x 1111 2222 3333 4443! ');
  writeln('qui donne sous forme de liste');
  writeln('(4444 3333 2222 1111)! =(4444 3333 2222 1111)x(4443 3333 2222 1111)!');
  writeln('on doit alors decrementer la tete de (4444 3333 2222 1111)! et effectuer');
  writeln(' les multiplication successivement jusque 0 et ensuite passer à ');
  writeln(' (4444 3333 2222 1111)!^.suivant qui sera de meme decrementer jusque 0');
  writeln(' l''algorithme est repétéé jusqu''a ce que la liste soit vide.');
  writeln(' le produit de tout les termes obtenus donne le factorielle du grandEntier en entrée');
  writeln(' manque de temps je n''ai pas pu implementer correctement cet algorithme.');
  writeln;
  writeln(' Fin du projet sur les Grands Entiers.'); 
end.
