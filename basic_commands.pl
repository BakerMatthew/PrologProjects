:-include(week1).

%Checked version of look
look(Place):-room(Place),here(Place),
			 uc_look(Place).
look(Container):-container(Container),location(Container,Place),here(Place),
				uc_look(Container).
look(Item):-location(Item,Container),location(Container,Place),here(Place),
			uc_look(Item).
look(Item):-location(Item,Place),here(Place),
			uc_look(Item).

%Checked version of study
study(Held_Item):-has(Held_Item),
				  uc_study(Held_Item).
study(Place):-room(Place),here(Place),
			  uc_study(Place).
study(Container):-container(Container),location(Container,Place),here(Place),
   			 	  uc_study(Container).
study(Item):-location(Item,Container),location(Container,Place),here(Place),
			 uc_study(Item).
study(Item):-location(Item,Place),here(Place),
			 uc_study(Item).

%List out contents of inventory
list_inventory(Item):-has(Item),
		   			  tab(2),write_name(Item),nl,
		   			  fail.
list_inventory(_).
inventory:-
		   write("You are currently holding:"),nl,
		   list_inventory(_),!.

%Unchecked (always successful) version of move action
uc_move(Place):-here(Cur_Place),
				retract(here(Cur_Place)),asserta(here(Place)),
				look(Place).

%Checked version of move
move(Place):-room(Place),here(Cur_Place),connection(Place,Cur_Place),
			 uc_move(Place).

%Unchecked (always successful) version of take action
uc_take(Item):-asserta(has(Item)),retract(location(Item,_)).

%Checked version of take
take(Item):-location(Item,Container),location(Container,Place),here(Place),\+ heavy(Item),
			uc_take(Item).
take(Item):-location(Item,Place),here(Place),\+ heavy(Item),
			uc_take(Item).

%Unchecked (always successful) version of put action
uc_put(Item,Location):-asserta(location(Item,Location)),retract(has(Item)).

%Checked version of put
put(Item,Location):-has(Item),here(Location),
					uc_put(Item,Location).
put(Item,Container):-has(Item),container(Container),location(Container,Location),here(Location),
					uc_put(Item,Location).
