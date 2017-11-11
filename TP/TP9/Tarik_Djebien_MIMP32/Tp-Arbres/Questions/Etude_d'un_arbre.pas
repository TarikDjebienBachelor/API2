// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : TP 9 - Manipulation d'arbres binaires : questions 3/4/5/6/7


program etude_arbre;
uses U_Element,
     U_Arbre, 
     U_Exemples_Arbres;

BEGIN

writeln('Question 3');

writeln('NIP mod 50 = ',k);
writeln;

afficherArbre(exemple[k]);
writeln;writeln;

infixe(exemple[k]);
writeln;writeln;

writeln('Question 4');

writeln('taille ( exemple[',k,'] ) = ', taille(exemple[k]) );
writeln;

writeln('Question 5');

writeln('hauteur ( exemple[',k,'] ) = ', hauteur(exemple[k]) );
writeln;

writeln('Question 6');

writeln('nombreFeuilles ( exemple[',k,'] ) = ', nombreFeuilles(exemple[k]) );
writeln;

writeln('Question 7');

writeln('parcours infixé de exemple[k], liste des élements : ');infixe(exemple[k]);writeln;
writeln;
END.
