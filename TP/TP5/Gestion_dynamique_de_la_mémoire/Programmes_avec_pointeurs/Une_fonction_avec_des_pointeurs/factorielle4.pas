// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Une fonction avec des pointeurs

program factorielle4;
uses SysUtils;
type 
	POINTEUR = ^CARDINAL;

function factorielle4(n : POINTEUR ) : POINTEUR;
var
   i : ^CARDINAL;
   f : ^CARDINAL;

begin
  new(f); // alloue un emplacement memoire à f
  f^ := 1; // f --> 1 : initialise f à 1
  new(i);  // alloue un emplacement memoire à i
  i^ := 1;  // i --> 1 : initialise i à 1
  
  //on boucle exactement n - i + 1 = n fois
  while i^ <= n^ do
   begin 
    f^ := f^ * i^ ; // f^ <-- f^ x i^
    inc(i^); // i^ <-- i^ + 1
   end{while};
    
  factorielle4 := f ; // factorielle4 renvoie un pointeur de cardinal
  
  
  dispose(i); // on desalloue le pointeur i qui a servi de compteur 
  //mais surtout pas le pointeur f qui contient le resultat.
  
end{factorielle4};

var n : POINTEUR; // pointeur n en entrée de la fonction

//corps du programme principal
BEGIN
  new(n); //On alloue un emplacement memoire pour le pointeur n
  n^ := strToInt(paramstr(1)); // n^ <-- valeur dont le factorielle sera calculé
  writeln(strToInt(paramstr(1)),'! = ',( factorielle4(n) )^ ); 
  // factorielle4(n) renvoie le pointeur de cardinal f
  // donc ( factorielle4(n) )^ = f^ nous donne la valeur du resultat final
  // f^ <-- (n^)!
END.
