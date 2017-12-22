run 'run_file.pl' to play the game.

uc_look(Object): always successful - can look at any object
look(Object): checked version - looks at given object in current place

uc_study(Object): always successful - can study any object
study(Object): cheched version - studies given object in current place

inventory: displays inventory

uc_move(Location): always successful - can move to anywhere
move(Location): checked version - moves to adjacent place

uc_take(Item): always successful - can take any object
take(Item): checked version - take object from current place

uc_put(Item,Location): always successful - can put object anywhere
put(Item,Location): checked version - put object to target location in current place

uc_make(Item): always successful - put Item into inventory
make(Item): checked version - create Item only if you have the ingredients and equipment

uc_transfer(Disk,Pylon_From,Pylon_To): always successful - Move Disk from Pylon_From to Pylon_To
transfer(Disk,Pylon_From,Pylon_To): checked version - Moves disk if request is consistent with the rules of towers of hanoi

play: Invokes the game loop (all commands from above work in the game loop)
When putting an object, most rooms only supports the syntax of: "put ITEM LOCATION"
