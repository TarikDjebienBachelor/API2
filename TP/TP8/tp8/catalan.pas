//RAKOTOBE Sitraka Eric
//NOMBRE DE CATALAN 


program catalan;

const  MAX = 50; // indice du dernier nombre de catalan à calculer type  

type TABLE = array[0..MAX] of CARDINAL;

     POINT=RECORD
           x,y:REAL;
     end;


// catalan(n) = nombre d'arbres binaires de taille n 
// programmation récursive suivant la définition récurrente 
function catalan(n : CARDINAL) : CARDINAL;
var k,int:CARDINAL;
begin 
  int:=0;
  if (n=0) or (n=1) then begin
    catalan:=1;
  end else begin
      for k:=0 to n-1 do begin
        int:= (catalan(n-1-k)*catalan(k))+int;
      end;
  catalan:=int;
  end;
end;

// catalan2(n) = nombre d'arbres binaires de taille n 
// programmation itérative en utilisant un tableau 
function catalan2(n : CARDINAL) : CARDINAL;
var i,int,k:CARDINAL;
    t:TABLE;
begin
  t[0]:=1; t[1]:=1; //int:=0; // initialisation des 2premieres valeurs du tableau
    for i:=2 to n do begin  
        int:=0;
      for k:=0 to i-1 do begin
        int:= (t[i-1-k]*t[k])+int;
      end;
        t[i]:=int;
    end;
catalan2:= t[n];
end;


// tabuleCatalan() = table des nombres de Catalan pour les indices compris entre 0 et MAX 
function tabuleCatalan() : TABLE;
var i,int,k:CARDINAL;
    t:TABLE;
begin
  t[0]:=1; t[1]:=1; //int:=0; // initialisation des 2premieres valeurs du tableau
    for i:=2 to MAX do begin  
        int:=0;
      for k:=0 to i-1 do begin
        int:= (t[i-1-k]*t[k])+int;
      end;
        t[i]:=int;
    end;
tabuleCatalan:=t;
end;

// catalan3(n) = nombre d'arbres binaires de taille n 
// programmation itérative en utilisant un tableau 
function catalan3(n : CARDINAL) : REAL;
var i,int,k:CARDINAL;
    t:TABLE;
begin
  t[0]:=1; t[1]:=1; //int:=0; // initialisation des 2premieres valeurs du tableau
    for i:=2 to n do begin  
        int:=0;
      for k:=0 to i-1 do begin
        int:= (t[i-1-k]*t[k])+int;
      end;
        t[i]:=int;
    end;
catalan3:= t[n];
end;





//Fonction factorielle qui va nous servir pr le calcul de CatalanBinomiaux
function factorielle(n:CARDINAL):CARDINAL;
begin
  if (n=0) then begin
    factorielle:=1;
  end else begin
    factorielle:=factorielle(n-1)*n;
  end;
end;



//avec les coefficient binomiaux : cn = (2n)!/(n!)² (n+1)
function catalanBinomiaux(n:CARDINAL):REAL; 
begin
 catalanBinomiaux:=factorielle(2*n) div ((factorielle(n)*(factorielle(n)))*(n+1));
end;



var cn,n:CARDINAL;
    tableau:TABLE;
    fichier,fichier2:FILE OF POINT;
    p:POINT;
    j:CARDINAL;
    i:REAL;
    k:LONGWORD;

begin


 for j:=0 to 5 do begin
    writeln('c(',j,')= ',catalan(j));
  end;
    writeln('c(19)= ',catalan(19)); 


  for j:=0 to 10 do begin
    writeln('c(',j,')= ',catalan2(j));
  end;
    writeln('c(19)= ',catalan2(19)); 


  tableau:=tabuleCatalan();
  for j:=0 to MAX do begin
    writeln('tabuleCatalan[',j,']= ',tableau[j]);
  end;     


  for j:=0 to 50 do begin
    writeln('c(',j,')= ',catalan3(j)); 
  end; 
 

  writeln('entrer le nombre pour calculer son catalan');
  read(n);
  writeln('c(',n,')= ',catalanBinomiaux(n));          


//REDIRECTION VERS UN FICHIER
    assign(fichier,paramstr(1));
    rewrite(fichier);
  for j:=0 to 10 do begin
     p.x:=j;
     p.y:=catalan(j);
     write(fichier,p);
  end;   
     close(fichier);
//n ln (cn)
    assign(fichier2,paramstr(1));
    rewrite(fichier2);
  for k:=0 to 10 do begin
     p.x:=k;
     p.y:=ln(catalan(k))/ln 2;
     write(fichier2,p);
  end;      
     close(fichier2);      

  for j:=1 to n do begin
    writeln('Les termes Cn+1 / Cn =  ',catalan(j+1)/catalan(j)); 
  end; 

                
end.




