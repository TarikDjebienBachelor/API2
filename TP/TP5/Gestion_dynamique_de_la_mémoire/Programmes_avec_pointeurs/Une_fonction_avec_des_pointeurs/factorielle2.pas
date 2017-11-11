// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Une fonction avec des pointeurs

program factorielle2;
uses SysUtils;

function factorielle2(n : CARDINAL ) : CARDINAL;
var
   i :  CARDINAL;
   f : ^CARDINAL;

begin
  new(f); // alloue un emplacement memoire à f
  f^ := 1; // f --> 1

  for i:= 1 to n do
    f^ := f^ * i ;
    
  factorielle2 := f^ ;
  dispose(f);

end{factorielle2};

BEGIN
  writeln(strToInt(paramstr(1)),'! = ',factorielle2(strToInt(paramstr(1))) );
END.
