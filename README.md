# tic-tac-toe-in-bash
### Description
It's a simple bash script to play tic tac toe against the computer. It allows you to choose the symbol of the player, and the symbol of the computer. You may also decide who is going to start the game. It uses getopts to read the arguments. The program is secure from a situation when the player wants to write its symbol on the place which was already taken, or whether the player wants to put its symbol outside the board. The strategy of the computer is simple. It always wants to put its symbol in the middle of the board. If it is taken, then the computer chooses a random place. After the game, the script displays the number of moves and the information about the winner.
### How to run
To run the script just type in CLI:
```
./tic-tac-toe.sh
```
To see the manual:
```
./tic-tac-toe.sh -h
```
Example of using some another arguments (it changes player symbol to #, computer symbol to & and computer is going to start):
```
./tic-tac-toe.sh -p # -c & -f c
```



