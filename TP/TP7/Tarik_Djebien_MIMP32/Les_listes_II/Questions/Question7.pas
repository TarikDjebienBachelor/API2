// auteur : Djebien Tarik ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : novembre 2009
// objet  : Test de la fonction insere(e: ELEMENT ; L: LISTE): LISTE ; 

// Merci pour vos remarques,
// Cordialement.



program Question7;
uses U_Element,
	 U_Liste;

var L: LISTE;
    R,S,T: LISTE;

BEGIN
  writeln;
  writeln('Question 7.');
  writeln;
  
  // Initialisation
  L := LISTEVIDE;
  R := LISTEVIDE; S := LISTEVIDE; T := LISTEVIDE;
  
  // test sur la liste L = (1,3)
  L := ajouteEnTete(1,ajouteEnTete(3,L));
  
  
  // On affiche R,S et T à l'ecran
  writeln(' Soit R, S et T trois listes vides : ');
  write(' R = ');AfficherListe(R);writeln; // R = ()
  write(' S = ');AfficherListe(S);writeln; // S = ()
  write(' T = ');AfficherListe(T);writeln; // T = ()
  
  writeln;
  // On insere les élements 0,2 et 4 avec la liste L 
  
  R := insere(0,L);
  S := insere(2,L);
  T := insere(4,L);
  
  // On verifie bien que la fonction insere n'a pas modifié la liste L en paramètre
  write(' L = ');AfficherListe(L);writeln; // on doit avoir L = (1,3)
  writeln(' estTriee(L) retourne :',estTriee(L)); // TRUE
  writeln;
  
  writeln(' R <-- insere(0,L) ');
  write(' R = ');AfficherListe(R);writeln; // on doit avoir R = (0,1,3)
  writeln(' estTriee(R) retourne :',estTriee(R)); // TRUE
  write(' L = ');AfficherListe(L);writeln(' reste inchangée. '); // on doit avoir L = (1,3)
  writeln;
  
  writeln(' S <-- insere(2,L) ');
  write(' S = ');AfficherListe(S);writeln; // on doit avoir S = (1,2,3)
  writeln(' estTriee(S) retourne :',estTriee(S)); // TRUE
  write(' L = ');AfficherListe(L);writeln(' reste inchangée. '); // on doit avoir L = (1,3)
  writeln;
  
  writeln(' T <-- insere(4,L) ');
  write(' T = ');AfficherListe(T);writeln; // on doit avoir T = (1,3,4)
  writeln(' estTriee(T) retourne :',estTriee(T)); // TRUE
  write(' L = ');AfficherListe(L);writeln(' reste inchangée. '); // on doit avoir L = (1,3)
  writeln; 
END.
