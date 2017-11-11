// auteur : EW
// date   : novembre 2008
// objet  : fournir quelques listes predefinies
//          pour effectuer des tests sur les listes
//          necessite que le type ELEMENT soit un type CARDINAL ou INTEGER
unit U_Exemples_Listes;

interface
uses U_Liste;

const
   NBLISTES = 20;
   
var
   tab_listes : array[1..NBLISTES] of LISTE;

implementation
const
   VALMAX  = 10000; // valeur maximale d'un élément d'une liste
var
   i : 1..NBLISTES;
   
   // listeOrdonnee(n) construit la liste (n, n-1, n-2, ..., 2,1)
   function listeOrdonnee(n : CARDINAL) : LISTE;
   begin
      if n = 0 then
         listeOrdonnee := LISTEVIDE
      else
         listeOrdonnee := ajouteEnTete(n,listeOrdonnee(n-1));
   end {listeOrdonnee};
   
   // listeAlea(n) : cree une liste aleatoire de longueur n
   function listeAlea(n : CARDINAL) : LISTE;
   begin
      if n = 0 then
         listeAlea := LISTEVIDE
      else
         listeAlea := ajouteEnTete(random(VALMAX),listeAlea(n-1));
   end {listeAlea};

   // desallouer(l) : libere l'espace memoire alloue
   // pour chaque cellule de la liste l
   procedure desallouer(var l : LISTE);
   var l1 : LISTE;
   begin
      if not estListeVide(l) then begin
         l1 := reste(l);
         desallouer(l1);
         dispose(l);
      end {if};
   end {desallouer};

initialization

   randomize();
   for i := 1 to NBLISTES-1 do 
      tab_listes[i] := listeAlea(i);
   
   tab_listes[NBLISTES] := listeOrdonnee(NBLISTES);
   
   
finalization
   
   for i := 1 to NBLISTES do
      desallouer(tab_listes[i]);
end.
      