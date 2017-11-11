// auteur : 
// date   : 
// objet  : 
program <A COMPLETER>;
uses SysUtils;

   <ICI VOS DECLARATIONS>   


   // procedure de description de l'usage du programme
   // utilisee uniquement si usage incorrect
   procedure usage(const s : STRING);
   begin
      writeln(stderr,'Nombre de parametres incorrect !');
      writeln(stderr,'Usage : ');
      writeln(stderr,s+' <n> ');
      writeln(stderr,' <n> = somme a regler');
      halt(1);
   end {usage};
var
   n : CARDINAL;
begin
   if paramcount() <> 1 then
      usage(paramstr(0));
   n := StrToInt(paramstr(1));   

end.
