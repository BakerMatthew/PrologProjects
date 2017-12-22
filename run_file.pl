:-include(week3).

% PARSE : parse([V]==atoms,InputList==[string]):-verb(V,InputList-[]).
parse([V], InputList):-verb(V, InputList-[]).
parse([V,O], InputList):-verb(V,InputList-S1), noun(O,S1-[]).
parse([put, Item, Location], InputList):-verb(put, InputList-S1),
										 noun(Item, S1-S2), noun(Location, S2-[]).
parse([transfer, Disk, Pylon_To, Pylon_From], InputList):-verb(transfer, InputList-S1),
											  			  noun(Disk, S1-S2), noun(Pylon_To, S2-S3), noun(Pylon_From, S3-[]).

% VERBS
% quit game
verb(halt, ["exit" | X]-X).
verb(halt, ["exit", "game" | X]-X).
verb(halt, ["exit", "the", "game" | X]-X).
verb(halt, ["quit" | X]-X).
verb(halt, ["quit", "game" | X]-X).
verb(halt, ["quit", "the", "game" | X]-X).

% look
verb(uc_look, ["uc_look" | X]-X).
verb(look, ["look" | X]-X).
verb(look, ["look", "at" | X]-X).
verb(look, ["look", "at", "the" | X]-X).
verb(look, ["view" | X]-X).
verb(look, ["view", "the" | X]-X).

% study
verb(uc_study, ["uc_study" | X]-X).
verb(study, ["study" | X]-X).
verb(study, ["study", "the" | X]-X).
verb(study, ["search" | X]-X).
verb(study, ["search", "the" | X]-X).
verb(study, ["inspect" | X]-X).
verb(study, ["inspect", "the" | X]-X).

% inventory
verb(inventory, ["inventory" | X]-X).
verb(inventory, ["list", "inventory" | X]-X).
verb(inventory, ["list", "my", "inventory" | X]-X).
verb(inventory, ["display", "inventory" | X]-X).
verb(inventory, ["display", "my", "inventory" | X]-X).
verb(inventory, ["view", "inventory" | X]-X).
verb(inventory, ["view", "my", "inventory" | X]-X).

% move
verb(uc_move, ["uc_move" | X]-X).
verb(move, ["move" | X]-X).
verb(move, ["move", "to" | X]-X).
verb(move, ["move", "to", "the" | X]-X).
verb(move, ["go" | X]-X).
verb(move, ["go", "to" | X]-X).
verb(move, ["go", "to", "the" | X]-X).
verb(move, ["walk" | X]-X).
verb(move, ["walk", "to" | X]-X).
verb(move, ["walk", "to", "the" | X]-X).
verb(move, ["run" | X]-X).
verb(move, ["run", "to" | X]-X).
verb(move, ["run", "to", "the" | X]-X).

% take
verb(uc_take, ["uc_take" | X]-X).
verb(take, ["take"| X]-X).
verb(take, ["take", "a" | X]-X).
verb(take, ["take", "the" | X]-X).
verb(take, ["grab" | X]-X).
verb(take, ["grab", "a" | X]-X).
verb(take, ["grab", "the" | X]-X).
verb(take, ["pick", "up" | X]-X).
verb(take, ["pick", "up", "a" | X]-X).
verb(take, ["pick", "up", "the" | X]-X).

% put
verb(uc_put, ["uc_put" | X]-X).
verb(put, ["put" | X]-X).
verb(put, ["put", "the" | X]-X).
verb(put, ["put", "down" | X]-X).
verb(put, ["put", "down", "the" | X]-X).
verb(put, ["place" | X]-X).
verb(put, ["place", "the" | X]-X).
verb(put, ["place", "down" | X]-X).
verb(put, ["place", "down", "the" | X]-X).
verb(put, ["set" | X]-X).
verb(put, ["set", "the" | X]-X).
verb(put, ["set", "down" | X]-X).
verb(put, ["set", "down", "the" | X]-X).

% make
verb(uc_make, ["uc_make" | X]-X).
verb(make, ["make" | X]-X).
verb(make, ["make", "the" | X]-X).
verb(make, ["build" | X]-X).
verb(make, ["build", "the" | X]-X).
verb(make, ["create" | X]-X).
verb(make, ["create", "the" | X]-X).
verb(make, ["combine" | X]-X).
verb(make, ["concoct" | X]-X).
verb(make, ["brew" | X]-X).

% transfer
verb(uc_transfer, ["uc_transfer" | X]-X).
verb(transfer, ["transfer" | X]-X).
verb(transfer, ["transfer", "the" | X]-X).

% NOUNS
% context sensitive
noun(plaza,["outside"|X]-X):-here(avenue).
noun(plaza,["outside"|X]-X):-here(common_room).
noun(plaza,["outside"|X]-X):-here(engr).
noun(plaza,["outside"|X]-X):-here(ser_1st_floor).
noun(plaza,["outside"|X]-X):-here(plaza).

noun(bedroom,["room"|X]-X):-here(bedroom).
noun(bedroom_closet,["closet"|X]-X):-here(bedroom).

noun(closet,["closet"|X]-X):-here(eslc_south).

% locations
noun(agricultural_science, ["agsci" | X]-X).
noun(agricultural_science, ["agsci", "building" | X]-X).
noun(agricultural_science, ["agricultural", "science", "building" | X]-X).
noun(animal_science, ["ansci" | X]-X).
noun(animal_science, ["ansci", "building" | X]-X).
noun(animal_science, ["animal", "science" | X]-X).
noun(animal_science, ["animal", "science", "building" | X]-X).
noun(avenue, ["avenue" | X]-X).
noun(bedroom, ["bedroom" | X]-X).
noun(bedroom, ["in", "bedroom" | X]-X).
noun(bedroom, ["from", "bedroom" | X]-X).
noun(bedroom_closet, ["from", "bedroom", "closet" | X]-X).
noun(bedroom_closet, ["bedroom", "closet" | X]-X).
noun(bone, ["bone" | X]-X).
noun(bone, ["dragon", "bone" | X]-X).
noun(book_a, ["from", "book a" | X]-X).
noun(book_a, ["Corpus", "Hermiticum" | X]-X).
noun(book_a, ["book a" | X]-X).
noun(book_a, ["from", "Corpus", "Hermiticum" | X]-X).
noun(book_b, ["book b" | X]-X).
noun(book_b, ["War", "and", "Peace" | X]-X).
noun(book_c, ["book c" | X]-X).
noun(book_c, ["Great", "Expectations" | X]-X).
noun(bunsen_burner, ["bunsen", "burner" | X]-X).
noun(charged_bone, ["bone" | X]-X).
noun(charged_bone, ["dragon", "bone" | X]-X).
noun(charged_bone, ["charged", "bone" | X]-X).
noun(chemistry_lab, ["chemistry", "lab" | X]-X).
noun(clean_clothes, ["clean", "clothes" | X]-X).
noun(closet, ["from", "equipment", "closet" | X]-X).
noun(closet, ["equipment", "closet" | X]-X).
noun(coat, ["from", "coat" | X]-X).
noun(coat, ["coat" | X]-X).
noun(common_room, ["common", "room" | X]-X).
noun(computer_lab, ["computer", "lab" | X]-X).
noun(dirty_clothes, ["dirty", "clothes" | X]-X).
noun(elevator, ["elevator" | X]-X).
noun(engr, ["from", "engr" | X]-X).
noun(engr, ["from", "engr", "building" | X]-X).
noun(engr, ["from", "engineering" | X]-X).
noun(engr, ["from", "engineering", "building" | X]-X).
noun(engr, ["engr" | X]-X).
noun(engr, ["engr", "building" | X]-X).
noun(engr, ["engineering" | X]-X).
noun(engr, ["engineering", "building" | X]-X).
noun(eslc_north, ["eslc", "north" | X]-X).
noun(eslc_north, ["eccels", "science", "learning", "center", "north" | X]-X).
noun(eslc_north, ["eccels", "science", "learning", "center", "north", "building" | X]-X).
noun(eslc_south, ["eslc", "south" | X]-X).
noun(eslc_south, ["eccels", "science", "learning", "center", "south" | X]-X).
noun(eslc_south, ["eccels", "science", "learning", "center", "south", "building" | X]-X).
noun(figurine, ["figurine" | X]-X).
noun(figurine, ["alien", "figurine" | X]-X).
noun(flask, ["flask" | X]-X).
noun(flask, ["glass", "flask" | X]-X).
noun(fly, ["fly" | X]-X).
noun(fly, ["dead", "fly" | X]-X).
noun(geology_building, ["from", "geology" | X]-X).
noun(geology_building, ["from", "geology", "building" | X]-X).
noun(geology_building, ["geology" | X]-X).
noun(geology_building, ["geology", "building" | X]-X).
noun(goggles,["goggles" | X]-X).
noun(goggles,["safety", "goggles" | X]-X).
noun(goggles,["dark", "safety", "goggles" | X]-X).
noun(green_beam, ["green", "beam" | X]-X).
noun(green_beam, ["green", "beam", "enclosure" | X]-X).
noun(hall, ["hallway" | X]-X).
noun(hall, ["hall" | X]-X).
noun(hub, ["hub" | X]-X).
noun(ice_cream, ["aggie", "creamery" | X]-X).
noun(ice_cream, ["aggie", "ice", "cream" | X]-X).
noun(key, ["key" | X]-X).
noun(kitchen, ["kitchen" | X]-X).
noun(large_disk, ["large", "disk" | X]-X).
noun(large_disk, ["large", "energy", "disk" | X]-X).
noun(laser, ["laser" | X]-X).
noun(laser, ["laser", "array" | X]-X).
noun(laser_lab, ["laser", "lab" | X]-X).
noun(library, ["library" | X]-X).
noun(library, ["merill-cazier", "library" | X]-X).
noun(lost_homework, ["lost", "homework" | X]-X).
noun(lost_homework, ["lost", "geometry", "homework" | X]-X).
noun(lost_homework, ["homework" | X]-X).
noun(lost_homework, ["geometry", "homework" | X]-X).
noun(medium_disk, ["medium", "disk" | X]-X).
noun(medium_disk, ["medium", "energy", "disk" | X]-X).
noun(movie, ["movie" | X]-X).
noun(movie, ["Men", "in", "Black" | X]-X).
noun(note, ["note" | X]-X).
noun(observatory, ["observatory" | X]-X).
noun(old_main, ["main" | X]-X).
noun(old_main, ["old", "main" | X]-X).
noun(plaza, ["plaza" | X]-X).
noun(plaza, ["engineering", "plaza" | X]-X).
noun(potion, ["potion" | X]-X).
noun(pylon_a, ["pylon_a" | X]-X).
noun(pylon_a, ["red", "pylon" | X]-X).
noun(pylon_a, ["on", "red", "pylon" | X]-X).
noun(pylon_a, ["to", "red", "pylon" | X]-X).
noun(pylon_a, ["from", "red", "pylon" | X]-X).
noun(pylon_b, ["pylon_b" | X]-X).
noun(pylon_b, ["blue", "pylon" | X]-X).
noun(pylon_b, ["on", "blue", "pylon" | X]-X).
noun(pylon_b, ["to", "blue", "pylon" | X]-X).
noun(pylon_b, ["from", "blue", "pylon" | X]-X).
noun(pylon_c, ["pylon_c" | X]-X).
noun(pylon_c, ["on", "green", "pylon" | X]-X).
noun(pylon_c, ["to", "green", "pylon" | X]-X).
noun(pylon_c, ["from", "green", "pylon" | X]-X).
noun(quad, ["quad" | X]-X).
noun(recipe, ["recipe" | X]-X).
noun(recipe, ["potion", "recipe" | X]-X).
noun(recipe, ["alchemy", "recipe" | X]-X).
noun(recipe, ["alchemical", "recipe" | X]-X).
noun(recipe, ["invisibility", "recipe" | X]-X).
noun(recipe, ["invisibility", "potion", "recipe" | X]-X).
noun(roof, ["roof" | X]-X).
noun(roof, ["ser", "roof" | X]-X).
noun(roof, ["SER", "roof" | X]-X).
noun(roommate_room, ["from", "roommate", "room" | X]-X).
noun(roommate_room, ["roommate", "room" | X]-X).
noun(roommate_room, ["roommates", "room" | X]-X).
noun(roommate_room, ["from", "roommate's", "room" | X]-X).
noun(roommate_room, ["roommate's", "room" | X]-X).
noun(secret_lab, ["secret", "lab" | X]-X).
noun(ser_1st_floor, ["first", "floor", "SER" | X]-X).
noun(ser_1st_floor, ["first", "floor", "of", "SER" | X]-X).
noun(ser_1st_floor, ["first", "floor", "SER", "building" | X]-X).
noun(ser_1st_floor, ["first", "floor", "of", "SER", "building" | X]-X).
noun(ser_1st_floor, ["1st", "floor", "SER" | X]-X).
noun(ser_1st_floor, ["1st", "floor", "of", "SER" | X]-X).
noun(ser_1st_floor, ["1st", "floor", "SER", "building" | X]-X).
noun(ser_1st_floor, ["1st", "floor", "of", "SER", "building" | X]-X).
noun(ser_2nd_floor, ["second", "floor", "SER" | X]-X).
noun(ser_2nd_floor, ["second", "floor", "of", "SER" | X]-X).
noun(ser_2nd_floor, ["second", "floor", "SER", "building" | X]-X).
noun(ser_2nd_floor, ["second", "floor", "of", "SER", "building" | X]-X).
noun(ser_2nd_floor, ["2nd", "floor", "SER" | X]-X).
noun(ser_2nd_floor, ["2nd", "floor", "of", "SER" | X]-X).
noun(ser_2nd_floor, ["2nd", "floor", "SER", "building" | X]-X).
noun(ser_2nd_floor, ["2nd", "floor", "of", "SER", "building" | X]-X).
noun(small_disk, ["small", "disk" | X]-X).
noun(small_disk, ["small", "energy", "disk" | X]-X).
noun(special_collections, ["from", "special", "collections" | X]-X).
noun(special_collections, ["special", "collections" | X]-X).
noun(special_collections, ["from", "special", "collections", "room" | X]-X).
noun(special_collections, ["special", "collections", "room" | X]-X).
noun(tsc, ["tsc" | X]-X).
noun(tsc, ["TSC" | X]-X).
noun(tsc, ["tsc", "building" | X]-X).
noun(tsc, ["taggart", "student", "center" | X]-X).
noun(tsc, ["taggart", "student", "center", "building" | X]-X).
noun(tsc_patio, ["tsc", "patio" | X]-X).
noun(tunnels_east, ["tunnels", "east" | X]-X).
noun(tunnels_east, ["east", "tunnels" | X]-X).
noun(tunnels_east, ["underground", "tunnels" | X]-X).
noun(tunnels_north, ["tunnels", "north" | X]-X).
noun(tunnels_north, ["north", "tunnels" | X]-X).
noun(tunnels_north, ["underground", "tunnels" | X]-X).
noun(tunnels_west, ["tunnels", "west" | X]-X).
noun(tunnels_west, ["west", "tunnels" | X]-X).
noun(tunnels_west, ["underground", "tunnels" | X]-X).

% Executes given Command
do(Command):-Command, !.

% Game loop ==> end loop if win or exit/quit
play():-repeat, read_words(W), parse(C, W), Command=..C, do(Command).
