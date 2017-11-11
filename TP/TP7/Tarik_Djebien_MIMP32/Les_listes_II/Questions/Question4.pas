// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : novembre 2009
// objet  : Test du predicat estTriee(L: LISTE): BOOLEAN ; 

program Question4;
uses U_Element,
	 U_Liste,
	 U_Exemples_Listes;

var L1,L2,L3,L4 : LISTE;
    i : CARDINAL ;
 

BEGIN
  writeln;
  writeln('Question 4.');
  writeln;
  
  // Initialisation
  L1 := LISTEVIDE;
  L2 := LISTEVIDE;
  L3 := LISTEVIDE;
  L4 := LISTEVIDE;
  
  // test sur la liste L1 = (1,2,3)
    for i:=3 downto 1 do begin
      L1:= ajouteEnTete(i,L1);
    end; 
  write('L1 = ');AffichageListe(L1);writeln;
  writeln('estTriee(L1) retourne :',estTriee(L1));
  
  // test sur la liste L2 = (3,2,1)
    for i:=1 to 3 do begin
      L2:= ajouteEnTete(i,L2);
    end;
  write('L2 = ');AffichageListe(L2);writeln;
  writeln('estTriee(L2) retourne :',estTriee(L2));
  
  // test sur la liste L3 = (3)
  L3:= ajouteEnTete(3,L3);
  write('L3 = ');AffichageListe(L3);writeln;
  writeln('estTriee(L3) retourne :',estTriee(L3));
  
  // test sur la liste L4 = ()
  write('L4 = ');AffichageListe(L4);writeln;
  writeln('estTriee(L4) retourne :',estTriee(L4));
  
  
  writeln;
  writeln('Question 5.');
  writeln;
  
  //Question 5. 
  //Test du prédicat sur toutes les listes définies dans l'unité U_Exemples_Listes.pas.

  for i := 1 to NBLISTES do 
    begin
      writeln('Pour la liste numero ',i,' on a : ');
      write('L',i,' = ');AffichageListe(tab_listes[i]);writeln;
      writeln('estTriee(L',i,') retourne :',estTriee(tab_listes[i]));
      writeln;
    end{for};
  
  
  
  writeln;
END.
