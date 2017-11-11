// auteur : enseignants d'API2
// date   : septembre 2008
// objet  : outils pour programmer hanoi
unit hanoiUtils;

interface

const MAX = 10; // nbre maximal de disques

type   
   TOUR = 'A'..'C';
   
var
   visualisation_tours : BOOLEAN;
   
   // initialise la tour A avec n disques
   // et les autres tas sont vides
   // CU : n doit être inférieur ou égal à MAX
   procedure initialiserTours(const n : CARDINAL);
   
   
   // deplace le disque au sommet de la tour d vers la tour a
   // CU : la tour d ne doit pas être vide.
   procedure deplacerDisque(const d,a : TOUR); 
   
implementation
uses SysUtils;

type
   INDICEDISQUE = 1..MAX;
   TAILLEDISQUE = 0..MAX;
   TOURS = array[TOUR] of record
      sommet : 0..MAX;
      contenu : array[INDICEDISQUE] of TAILLEDISQUE;
   end {TOURS};

   TourVide   = class(SysUtils.Exception);
   TourPleine = class(SysUtils.Exception);

var
   t : TOURS;
   dessins : array[TAILLEDISQUE] of STRING;
   socle   : STRING;
   k       : CARDINAL;
   i       : TAILLEDISQUE;
   
   procedure dessiner;
   var
      i : INDICEDISQUE;
      k : TOUR;
   begin
      for i := high(INDICEDISQUE) downto low(INDICEDISQUE) do begin
         for k := low(TOUR) to high(TOUR) do
            if i <= t[k].sommet then
               write(dessins[t[k].contenu[i]])
            else
               write(dessins[0]);
         writeln();
      end {for i};
      for k := low(TOUR) to high(TOUR) do
            write(socle+' ');
      writeln();
   end {dessiner};
   
   procedure initialiserTours(const n : CARDINAL);
   var
      i : 1..MAX+1;
      k : TOUR;
   begin
      if n>MAX then
         raise TourPleine.create('Trop de disques sur la tour A !')
      else begin
         for i := low(INDICEDISQUE) to n do
            t[low(TOUR)].contenu[i] := n+1-i;
         for i := n+1 to high(INDICEDISQUE) do
            t[low(TOUR)].contenu[i] := 0;
         t[low(TOUR)].sommet := n;
         for k := succ(low(TOUR)) to high(TOUR) do begin
            for i := low(INDICEDISQUE) to high(INDICEDISQUE) do
               t[k].contenu[i] := 0;
            t[k].sommet := 0;
         end {for k};
         if visualisation_tours then dessiner;
      end {else};
   end {initialiserTours};
   
   procedure deplacerDisque(const d,a : TOUR);
   begin
      inc(t[a].sommet);
      if t[d].sommet=0 then
         raise TourVide.create('Tour '+d+' vide !')
      else begin
         t[a].contenu[t[a].sommet] := t[d].contenu[t[d].sommet];
         dec(t[d].sommet);
         writeln(d, ' -> ',a);
         if visualisation_tours then dessiner;
      end {else};
   end {deplacerDisque};
   
initialization
   // par défaut pas d'affichage des tours 
   visualisation_tours := false;
   
   socle := '';
   for k := 1 to 2*MAX+3 do
      socle := socle + '~';
   
   for i := low(TAILLEDISQUE) to high(TAILLEDISQUE) do begin
      dessins[i] := ' ';
      for k := 1 to high(TAILLEDISQUE)-i do
         dessins[i] := dessins[i] + ' ';
      for k := 1 to i do
         dessins[i] := dessins[i] + '=';
      dessins[i] := dessins[i] + '|';
      for k := 1 to i do
         dessins[i] := dessins[i] + '=';
      for k := 1 to high(TAILLEDISQUE)-i do
         dessins[i] := dessins[i] + ' ';
      dessins[i] := dessins[i] + '  ';
   end {for i};
   
   
finalization
   writeln(stderr);
   writeln(stderr,'--- Hanoï - API2 - 2008 ---');
end.
