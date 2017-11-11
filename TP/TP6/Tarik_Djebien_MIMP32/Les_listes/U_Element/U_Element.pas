// auteur : Djebien Tarik
// date   : octobre 2009
// objet  : Unité munie des opérations primitives sur le type ELEMENT

Unit U_Element;

Interface

type 
	ELEMENT = INTEGER ;
	
//ecriture du parametre e sur la sortie standard
procedure ecrireElement ( const e : ELEMENT );

//saisie de la valeur parametre e sur la sortie standard
procedure lireElement ( out e : ELEMENT );


Implementation

procedure ecrireElement ( const e : ELEMENT );
begin
writeln(e);
end;//ecrireElement

procedure lireElement ( out e : ELEMENT );
begin
readln(e);
end;//lireElement


Initialization

Finalization

end.
