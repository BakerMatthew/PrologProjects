:-include(week2).

% Unchecked version of make
uc_make(Item):-asserta(has(Item)).

% Checked version of make
make(Item):-create_recipe(Equipment,Ingredients,Item),
				 location_has(Equipment),has_ingredients(Ingredients),
				 consume_ingredients(Ingredients),asserta(has(Item)).

location_has(Equipment):-location(Equipment, Place),
						 here(Place).

has_ingredients([]):-!. % Base case
has_ingredients([Item|Remainder]):-has(Item),has_ingredients(Remainder). % Recursive

consume_ingredients([]):-!.
consume_ingredients([Item|Remainder]):-retract(has(Item)),consume_ingredients(Remainder).

% Unchecked version of transfer
uc_transfer(Disk,Pylon_From,Pylon_To):-retract(location(Disk,Pylon_From)),asserta(location(Disk,Pylon_To)),
									   has_won,print_victory,halt.

% Checked version of transfer
transfer(Disk,Pylon_From,Pylon_To):-here(secret_lab),location(Disk,Pylon_From),
									\+ disk_can_move(Disk,Pylon_From),\+ disk_can_move(Disk,Pylon_To),
									uc_transfer(Disk,Pylon_From,Pylon_To).

disk_can_move(Disk,Pylon):-location(Other_Disk,Pylon),
					  	   is_larger(Disk,Other_Disk).
disk_can_move(_).

is_larger(large_disk,medium_disk).
is_larger(large_disk,small_disk).
is_larger(medium_disk,small_disk).

% Checks win condition
has_won:-location(small_disk,pylon_c),location(medium_disk,pylon_c),location(large_disk,pylon_c).
print_victory:-write("Victory!"),nl,
			   write("You have foiled the plans of Dr.Sundberg and saved the world!"),nl.
