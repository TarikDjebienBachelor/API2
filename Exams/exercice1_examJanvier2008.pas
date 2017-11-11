// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : decembre 2009
// objet  : Exercice 1 de l'Examen API2 session janvier 2008

program exercice1;
uses U_Element,
	 U_Liste;

VAR L1,L2,L: LISTE;
	 
Function Fusion(L1,L2: LISTE): LISTE;
begin
  if estListeVide(L1) then
    Fusion := L2
  else if estListeVide(L2) then
    Fusion := L1
  else if inferieur(tete(L1),tete(L2)) then
    Fusion := ajouteEnTete(tete(L1),Fusion(reste(L1),L2)) 
  else
    Fusion := ajouteEnTete(tete(L2),Fusion(L1,reste(L2)))
end{Fusion};

BEGIN
L1:= LISTEVIDE;
L2:= LISTEVIDE;
L:= LISTEVIDE;

L1:= ajouteEnTete(7,L1);L1:= ajouteEnTete(5,L1);L1:= ajouteEnTete(3,L1);
L2:= ajouteEnTete(9,L2);L2:= ajouteEnTete(6,L2);L2:= ajouteEnTete(2,L2);L2:= ajouteEnTete(1,L2);L2:= ajouteEnTete(0,L2);

write('L1 = ');AfficherListe(L1);writeln;
write('L2 = ');AfficherListe(L2);writeln;

L:= Fusion(L1,L2);

write('L = ');AfficherListe(L);writeln;
END.
