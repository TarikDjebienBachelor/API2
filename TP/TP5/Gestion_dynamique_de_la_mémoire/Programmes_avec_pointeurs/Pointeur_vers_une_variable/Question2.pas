// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Pointeur vers une variable

program Question2;
uses SysUtils;

var n : INTEGER;
    p : ^INTEGER;

begin  

n := strToInt(paramstr(1)); // n <-- ./Question2_n
p := @n; 					// p --> n

writeln('Au debut : ');
writeln('n = ',n);			// n = valeur(n)
writeln('p^ = ',p^);		// p^ --> valeur(n)

inc(p^);					// p^ <-- p^ + 1  
							// ( p^ <-- valeur(n) + 1 ) => ( n <-- valeur(n) + 1)
							
							
writeln('Apres incrementation de la zone pointee par p :');
writeln('n = ',n);			// n = valeur(p^) = valeur(n)
writeln('p^ = ',p^);		// p^ --> valeur(n)

{On remarque que l'incrementation du pointeur qui pointe vers l'objet 
implique directement l'incrementation de l'objet lui meme.}

end.
