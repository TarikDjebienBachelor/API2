// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : octobre 2009
// objet  : Unité munie des opérations primitives sur le type ELEMENT

Unit U_Element;

Interface

type 
	ELEMENT = CARDINAL;
	
//ecriture du parametre e sur la sortie standard
procedure ecrireElement ( const e : ELEMENT );

//saisie de la valeur parametre e sur la sortie standard
procedure lireElement ( out e : ELEMENT );

// egal(e1,e2) = VRAI si et seulement si e1 = e2
function egal(e1,e2: ELEMENT): BOOLEAN;

// inferieur(e1,e2) = VRAI si et seulement si e1 < e2
function inferieur(e1,e2: ELEMENT): BOOLEAN;

// inferieurOuEgal(e1,e2) = VRAI si et seulement si e1 <= e2
function inferieurOuEgal(e1,e2: ELEMENT): BOOLEAN;

// max(x,y) = x si x > y et y sinon
function max(x,y: INTEGER): INTEGER;

// compareElements(e1,e2)= -1 si e1 < e2
//                          0 si e1 = e2
//                          1 si e1 > e2
function compareElements(e1,e2: ELEMENT): INTEGER;

Implementation

procedure ecrireElement ( const e : ELEMENT );
begin
writeln(e);
end;//ecrireElement

procedure lireElement ( out e : ELEMENT );
begin
readln(e);
end;//lireElement


// egal(e1,e2) = VRAI si et seulement si e1 = e2
function egal(e1,e2: ELEMENT): BOOLEAN;
begin
  egal:= (e1 = e2);
end;//egal


// inferieur(e1,e2) = VRAI si et seulement si e1 < e2
function inferieur(e1,e2: ELEMENT): BOOLEAN;
begin
  inferieur:= (e1 < e2);
end;//inferieur


// inferieurOuEgal(e1,e2) = VRAI si et seulement si e1 <= e2
function inferieurOuEgal(e1,e2: ELEMENT): BOOLEAN;
begin
  inferieurOuEgal:= (e1 <= e2);
end;//inferieurOuEgal

// max(x,y) = x si x > y et y sinon
function max(x,y: INTEGER): INTEGER;
begin
  if x > y then max:= x else max := y;
end{max};

// compareElements(e1,e2)= -1 si e1 < e2
//                          0 si e1 = e2
//                          1 si e1 > e2
function compareElements(e1,e2: ELEMENT): INTEGER;
begin
 if e1 = e2 then
  compareElements:= 0
 else
 if e1 > e2 then
  compareElements:= 1
  else
  compareElements:= -1;
end{compareElements};

Initialization

Finalization

end.
