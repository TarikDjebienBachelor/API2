// Auteur : Djebien Tarik
// Date   : novembre 2009
// Objet  : Simulation de pointeurs

Unit U_Pointeur;

INTERFACE

CONST 
	N = 100;

VAR 
  // la memoire (le tas)
  tas   : ARRAY[1..N] of INTEGER;
  // table d'allocation indexé par les adresses telle que table[i]<=>tas[i] non alloué(libre) 
  table : ARRAY[1..N] of BOOLEAN; 
  
CONST
    NUL = 0;

TYPE
   ADRESSE  = 1..N; // indices du tas
   POINTEUR = NUL..N;
   
// initTable : rend libre le tas d'entiers.
procedure initTable;

// libre(i) <=> tas[i] non alloué.
function libre(i: ADRESSE) : BOOLEAN;

// allouer(p) réserve une zone libre du tas et attribue l'adresse de cette zone à p.
// CU : le tas est supposé ne pas être complètement alloué
procedure allouer(out p: POINTEUR);  

// desallouer(p) qui libère la zone d'adresse p et attribue la valeur NUL à p.
procedure desallouer(var p: POINTEUR);

// valeurPointee(p) qui donne accès à la valeur de la zone pointée par p.
function valeurPointee(p: POINTEUR): CARDINAL;

// attribuer(n,p) qui atribue la valeur n à la zone pointée par p.
// CU: p doit pointer vers une zone allouée
procedure attribuer(const n: CARDINAL ; const p: POINTEUR);


IMPLEMENTATION


// initTable : rend libre le tas d'entiers.
procedure initTable;
var i: CARDINAL;
begin
  for i:=1 to N do
    table[i]:= TRUE;
end{initTable};

// libre(i) <=> tas[i] non alloué.
function libre(i: ADRESSE) : BOOLEAN;
begin
  libre:= table[i];
end{libre};


// allouer(p) réserve une zone libre du tas et attribue l'adresse de cette zone à p.
// CU : le tas est supposé ne pas être complètement alloué
procedure allouer(out p: POINTEUR);  
var i: INTEGER;
begin
  //Recherche et reservation d'un emplacement libre dans la table
  i:= 1;
  while not(libre(i)) do i:= i+1;
  table[i]:= FALSE;
  //affectation de l'adresse de cette zone à p
  p:= i;
end{allouer};

// desallouer(p) qui libère la zone d'adresse p et attribue la valeur NUL à p.
procedure desallouer(var p: POINTEUR);
begin
  table[p]:= TRUE;
  p:= NUL;
end{desallouer};

// valeurPointee(p) qui donne accès à la valeur de la zone pointée par p.
function valeurPointee(p: POINTEUR): CARDINAL;
begin
  valeurPointee:= tas[p];
end {valeurPointee};

// attribuer(n,p) qui atribue la valeur n à la zone pointée par p.
// CU: p doit pointer vers une zone allouée
procedure attribuer(const n: CARDINAL ; const p: POINTEUR);
begin
 if not(libre(p)) then
  tas[p]:= n;
end {attribuer};




initialization
initTable;
finalization

END.
