// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : novembre 2009
// objet  : Test de la procedure Trier(var L: LISTE); 

program Question13;
uses U_Element,
	 U_Liste,
	 U_Exemples_Listes;

var i : CARDINAL ;
    

BEGIN
  writeln;
  writeln('Question 13.');
  writeln;
  
   
  //Test du tri par insertion sur toutes les listes définies dans l'unité U_Exemples_Listes.pas.

  for i := 1 to NBLISTES do 
    begin
      
      // Au depart, on a :
      writeln('Pour la liste numero ',i,' on a : ');
      write('L',i,' = ');AfficherListe(tab_listes[i]);writeln;
      
      // TRI PAR INSERTION SUR LA LISTE
      trier(tab_listes[i]);
      
      // Ensuite, on a :
      write('Aprés trier(L',i,'), L',i,' = ');AfficherListe(tab_listes[i]);writeln;
      writeln('estTriee(L',i,') retourne :',estTriee(tab_listes[i]));
      
      write('L',i,' = ');AfficherListe(tab_listes[i]);writeln(' a changée. ');
      
      writeln;
    end{for};
  
  
  
  writeln;
END.
