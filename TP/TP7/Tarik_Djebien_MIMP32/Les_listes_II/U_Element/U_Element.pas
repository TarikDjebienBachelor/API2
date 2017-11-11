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



Initialization

Finalization

end.
