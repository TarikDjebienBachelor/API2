Unit U_Element;

Interface

type 
	ELEMENT = CHAR ;
	
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
