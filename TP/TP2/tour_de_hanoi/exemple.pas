// auteur : enseignants d'API2
// date   : septembre 2008
// objet  : illustration de l'unité hanoiUtils
program exemple;
uses hanoiUtils;

begin
   visualisation_tours := true;
   initialiserTours(11);
   deplacerDisque('A','C');
   deplacerDisque('A','B');
   deplacerDisque('C','B');
end.
   
