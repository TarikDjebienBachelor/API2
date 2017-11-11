// auteur : etudiant Djebien Tarik
// date   : octobre 2009
// objet  : Tour de hanoi

{question 1 : affichage verifié.

 question 2 : Compilation = true
 			  Execution = false
 			  An unhandled exception occurred at <adress_memoire> :
              TourVide : Tour A vide !
			  En effet, la Condition d'utilisation de la procedure
			  deplacerDisque n'est pas respectée.On demande de deplacer un disque absent de la tour 
			  etant donné que l'on a modifié l'etat initial du nombre de disques de depart.
			  
 question 3 : Compilation = true
 			  Execution = false
			  An unhandled exception occurred at <adress_memoire> :
			  TourPleine : Trop de disques sur la tour A !
			  En effet, la Condition d'utilisation de la procedure
			  initialiserTours n'est pas respectée.
			  CU : n doit être inférieur ou égal à MAX
			  ici n = 11 et MAX = 10 n > MAX d'ou le probleme rencontré à l'execution.
}

//question 4 :
 
program hanoi;
uses hanoiUtils,SysUtils;

var n : integer;

procedure Hanoi(n: integer ; D,A,I: TOUR);
begin
   if n = 1 then
      deplacerDisque(D,A)
   else begin
      Hanoi(n-1,D,I,A);
      deplacerDisque(D,A);
      Hanoi(n-1,I,A,D);
   end;//if
end{Hanoi};

begin
	n := strToInt(paramstr(1));
	visualisation_tours := true;
	initialiserTours(n);
	
	Hanoi(n,'A','B','C');

end.
