// auteur : Djebien Tarik ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : novembre 2009
// objet  : Test de la procedure insererDansLeTri(const e: LISTE ; var L: LISTE); 

// Merci pour vos remarques,
// Cordialement.



program Question9;
uses U_Element,
	 U_Liste;

var L,E: LISTE;
   

BEGIN
  writeln;
  writeln('Question 9.');
  writeln;
  
  // Initialisation
  L := LISTEVIDE;
  E := LISTEVIDE;
  
  // test sur la liste L = (1,3)
  L := ajouteEnTete(1,ajouteEnTete(3,L));
  write(' L = ');AfficherListe(L);writeln; // on doit avoir L = (1,3)
  writeln(' estTriee(L) retourne :',estTriee(L)); // TRUE
  writeln;
  
  // On insere les élements 0,2 et 4 avec la liste L 
  
  // E=(0)
  E := ajouteEnTete(0,E);
  insererDansLeTri(E,L);
  
  // E=(2)
  modifierTete(E,2);
  insererDansLeTri(E,L);
  
  // E=(4)
  modifierTete(E,4);
  insererDansLeTri(E,L);
  
  // On verifie bien que la procedure a modifié la liste L en paramètre
  write(' L = ');AfficherListe(L);writeln; // on doit avoir L = (0,1,2,3,4) 
  writeln(' estTriee(L) retourne :',estTriee(L)); // TRUE
  writeln;
  
END.
