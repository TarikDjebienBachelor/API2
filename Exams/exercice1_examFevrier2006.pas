// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : Exercice 1 de l'Examen API2 session janvier 2008

program exercice1;
uses U_Element,
	 U_Liste;

VAR L,L1: LISTE;

// Question 1
// mirroirCopy construit une nouvelle liste L' à partir de L
// tel que si L=(1,2,3,4,5) alors L'=(5,4,3,2,1) et L reste inchangée	 
Function mirroirCopy(const L: LISTE): LISTE;
var L2 : LISTE;
begin
  L2:= cloner(L);
  L2:= miroir(L2);
  mirroirCopy:= L2;
end{mirroirCopy};

// Question 2
procedure retourner(var l: LISTE);
var s,p: LISTE;
begin
  if not(estListeVide(l)) AND not(estListeVide(reste(l))) then begin
    p:= LISTEVIDE;
    s:= l;
    l:= reste(s);
      while not(estListeVide(reste(l))) do begin
        s^.suivant := p;
        p:= s;
        s:= l;
        l:= reste(l);
      end;//while
    s^.suivant:= p;
    l^.suivant:= s;
  end;//if
end{retourner};

BEGIN
L:= LISTEVIDE;
L1:= LISTEVIDE;

L:= creerListeOrdreInc(5);  
write('L = ');AfficherListe(L);writeln;
L1:= mirroirCopy(L);
write('L1 = ');AfficherListe(L1);writeln;
write('L = ');AfficherListe(L);writeln;
retourner(L);
write('L = ');AfficherListe(L);writeln;
END.
