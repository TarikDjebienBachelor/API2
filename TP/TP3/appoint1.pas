// auteur : DJEBIEN TARIK - MIMP 32 
// date   : 12/11/2009
// objet  : EXO 1,2   TP3-API2

//1. le probleme
{ 

    PIECES = (1,2,5,10,20,50,100,200)
	
	n = somme (np*p) , p appartient à PIECES, np appartient à N
	
	exemple :
	   n = 100 centimes
	   
	    n1  n2  n5  n10  n20  n50  n100  n200
	    0   0   0    0    0    0     1     0    (1)
   ou  100  0   0    0    0    0     0     0
   ou   3   6   5    1    0    1     0     0
   ou   etc...

   Notation: on notera dorenavant (1) comme 00000010
             et le "ou" comme "|"
   
   (1.1)
   cas n =
   .0 : 1 possibilité unique, ne rien donner 							=> C(0)=1
   .1 : 10000000                             							=> C(1)=1
   .2 : 20000000|01000000					 							=> C(2)=2
   .3 : 30000000|11000000					 							=> C(3)=2
   .4 :	40000000|21000000|02000000			 							=> C(4)=3
   .5 :	50000000|31000000|12000000|00100000	 							=> C(5)=4
   .6 :	60000000|41000000|22000000|10100000|03000000					=> C(6)=5
   .7 :	70000000|51000000|32000000|20100000|13000000|01100000			=> C(7)=6
   .8 :	80000000|61000000|42000000|30100000|23000000|11100000|04000000	=> C(8)=7
   .9 : 90000000|71000000|52000000|40100000|33000000|21100000|14000000|
     	02100000								 						=> C(9)=8
   .10: 10,0000000|81000000|62000000|50100000|43000000|31100000
        24000000|12100000|00200000|10010000|05000000  					=> C(10)=11
    
	----------------------------------------------------------------------------
	|   n  ||  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  10  |
	----------------------------------------------------------------------------
    | C(n) ||  1  |  1  |  2  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  11  |
    ----------------------------------------------------------------------------
}

//2. Un cas simple avec deux pieces seulement
{
	PIECES = (1,2)
	
	(2.1)
	cas n =
   .0 : 1 possibilité unique, ne rien donner 							=> C(0)=1
   .1 : 10000000                             							=> C(1)=1
   .2 : 20000000|01000000					 							=> C(2)=2
   .3 : 30000000|11000000					 							=> C(3)=2
   .4 :	40000000|21000000|02000000			 							=> C(4)=3
   .5 :	50000000|31000000|12000000	 							        => C(5)=3
   .6 :	60000000|41000000|22000000|03000000					            => C(6)=4
	etc...
	
	finalement on a :
	
	----------------------------------------------------------------------------
	|   n  ||  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  10  |
	----------------------------------------------------------------------------
    | C(n) ||  1  |  1  |  2  |  2  |  3  |  3  |  4  |  4  |  5  |  5  |  6   |
    ----------------------------------------------------------------------------
	
	On remarque que nous avons une incrementation : de 1 sur n 
													de 1 sur C(n+2) avec C(0)=C(1)=1 
	
	=> C(0+2)=C(1+2)=2 => C(2+2)=C(3+2)=3 => etc...
	donc pour tout n >=2 on a : C(n+2) = C(n) + 1
							 => C(n) = C(n+2) - 1 
	                         => C(n) = C(n-2) + 1 
							       **CQFD**
}

//(2.2)
program appoint1;
uses crt,
	 SysUtils;
	 
var i:integer;
    n : CARDINAL;

//manuel d'utilisation du parametrage de l'executable de appoint1.pas
procedure usage_appoint1(const s : STRING);
   begin
      writeln(stderr,'Nombre de parametres incorrect ! Usage : ');
      writeln(stderr,s+' <n> ');
      writeln(stderr,'avec <n> = somme a regler');
      halt(1);
   end {usage};

//Fonction qui calcule le nombre de possibilité de payer une somme n avec deux pieces: 1,2
function nbAppoint(n:integer):integer;
  begin
     case n of
	   0 : nbAppoint := 1;
	   1 : nbAppoint := 1;
	 else
	   nbAppoint := nbAppoint(n-2)+1
	 end;
  end;//nbAppoint

//(2.3)

Begin

//Debut du programme
   begin
	if paramcount() = 0 then
	begin
	writeln;
	writeln('Remarque: entrer une somme à regler en parametre à l''execution du programme') ;
	writeln('          pour tester une somme de votre choix.');
    end;
   end;
   
//affichage des valeurs
  writeln;writeln(' PIECES = {1,2} ');writeln;
  for i:=0 to 10 do
    writeln('n = ',i,' => C(',i,') = ',nbAppoint(i));
	
//passage de la somme en parametre à l'execution
  begin
	if ((paramcount() <> 1) and (paramcount() <> 0 )) then
      usage_appoint1(paramstr(0));
	
	if paramcount() = 1 then
	  begin  
        n := StrToInt(paramstr(1));writeln;
	    writeln('Pour votre somme n = ',n,', on a C(',n,') = ',nbAppoint(n));
	  end;
  end;
	
//(2.4)
	
	begin
	writeln;
	writeln('Exprimons C(n) en fonction de n : ');
	writeln;
	writeln('     C(n) = E(n/2) + 1    '); 
	writeln;
	writeln('avec E(x) la partie entiere de x tel que E(x) < x < E(x)+1');
	end;
	
//Fin du programme
	begin
	writeln;
	repeat until keypressed;
	clrscr;
	end;
end.
