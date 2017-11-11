// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Une fonction avec des pointeurs

program factorielle3;
uses SysUtils;

function factorielle3(n : CARDINAL ) : CARDINAL;
var
   i : ^CARDINAL;
   f : ^CARDINAL;

begin
  new(f); // alloue un emplacement memoire à f
  f^ := 1; // f --> 1
  new(i);  // alloue un emplacement memoire à i
  i^ := 1;  // i --> 1
  
  
  while i^ <= n do
   begin 
    f^ := f^ * i^ ;
    inc(i^);
   end{while};
    
  factorielle3 := f^ ;
  dispose(f);
  dispose(i);
end{factorielle3};

BEGIN
  writeln(strToInt(paramstr(1)),'! = ',factorielle3(strToInt(paramstr(1))) );
END.
