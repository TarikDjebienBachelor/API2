// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : test des procedures d'affichage pour les parcours 
//			postfixe/infixe/prefixe d'un arbre binaire.

program test;
uses U_Arbre;

var A: ARBRE;

BEGIN
// Arbre decrit dans le cours Arbre(II)

(*                             1
*                       _______|_______
*                      2               3
*                 _____|____        ___|___
*                4          5       6      7
*              __|        __|__     |__
*             8          9     10      11
*)


A:= creerArbre(1,creerArbre(2,creerArbre(4,creerArbre(8,ARBREVIDE,ARBREVIDE),ARBREVIDE),creerArbre(5,creerArbre(9,ARBREVIDE,ARBREVIDE),creerArbre(10,ARBREVIDE,ARBREVIDE))),creerArbre(3,creerArbre(6,ARBREVIDE,creerArbre(11,ARBREVIDE,ARBREVIDE)),creerArbre(7,ARBREVIDE,ARBREVIDE)));
afficherArbre(A);
writeln;

// parcours infixé
writeln('infixe : ');infixe(A);writeln;

// parcours postfixé
writeln('postfixe : ');postfixe(A);writeln;

// parcours prefixé
writeln('prefixe : ');prefixe(A);writeln;
writeln;

ecrireElement(plusADroite(A));
END.
