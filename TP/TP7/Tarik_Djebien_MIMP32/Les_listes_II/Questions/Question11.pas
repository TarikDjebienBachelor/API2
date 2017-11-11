// auteur : Djebien Tarik ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : novembre 2009
// objet  : Test de la fonction Trie(L: LISTE): LISTE ; 

program Question11;
uses U_Element,
	 U_Liste,
	 U_Exemples_Listes;

var i : CARDINAL ;
    L_trier : LISTE;

BEGIN
  writeln;
  writeln('Question 11.');
  writeln;
  
   
  //Test du trie sur toutes les listes définies dans l'unité U_Exemples_Listes.pas.

  for i := 1 to NBLISTES do 
    begin
      L_trier := trie(tab_listes[i]);
      writeln('Pour la liste numero ',i,' on a : ');
      write('L',i,' = ');AfficherListe(tab_listes[i]);writeln;
      write('trie(L',i,') = ');AfficherListe(L_trier);writeln;
      writeln('estTriee(L',i,') retourne :',estTriee(tab_listes[i]));
      writeln('estTriee(trie(L',i,')) retourne :',estTriee(L_trier));
      
      write('L',i,' = ');AfficherListe(tab_listes[i]);writeln(' reste inchangée. ');
      
      writeln;
    end{for};
  
  
  
  writeln;
END.
