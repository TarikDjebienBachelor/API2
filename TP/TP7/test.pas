// auteur : Djebien Tarik
// date   : novembre 2009
// objet  : Test de la nouvelle Unité U_Liste.pas 


program Test2;
uses U_Element,
	 U_Liste;

var L : LISTE;
 
 
   
BEGIN
  writeln;
  writeln('test de U_Liste.');
  writeln;
  
  // Initialisation
  
  L := LISTEVIDE;
  L := creerListeOrdreInc(5);
  write('L = ');AfficherListe(L);writeln;
  inserer(2,L,2);
  write('L = ');AfficherListe(L);writeln;
  inserer(2,L,12);
  write('L = ');AfficherListe(L);writeln;
   
  // affichage de L  
  
  write('L = ');AfficherListe(L);writeln;
  
   
END.
