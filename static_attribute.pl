:-include(adventure).
% Given an object: display its name and short_desc
display_item(Item):-name(Item,Name),short_desc(Item,Short),!,
				   write("  "),write(Name),nl,
				   write("    "),write(Short),nl.

% Given a location: display the location's name and its contents->short_desc
display_contents(Place):-location(Item,Place),
						display_item(Item),
						fail.
display_contents(_).

% Given a location: display name and short_desc
display_location(Place):-name(Place,Name),short_desc(Place,Short),!,
						write(Name),nl,
						write("  "),write(Short),nl.

% Make doors symmetric: X <==> Y
connected(X,Y):-door(X,Y).
connected(X,Y):-door(Y,X).
% Given a location: display all doors(connections)
display_connections(Place):-connected(Place,Connection),
						   display_location(Connection),
						   fail.
display_connections(_).

% Given a location: display name, short_desc, connections, contents
look(Place):-
			display_location(Place),
			write("You can reach:"),nl,display_connections(Place),
			write("You see:"),nl,display_contents(Place).

% Given a location: display long_desc, contents
search(Place):-long_desc(Place,Long),
			  write(Long),nl,
			  write("You see:"),nl,display_contents(Place).
