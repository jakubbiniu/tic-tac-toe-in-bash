# tic-tac-toe-in-bash
### Description
It's a simple bash script to play tic tac toe against the computer. It allows you to choose the symbol of player, symbol of the computer and decide who is going to start the game. It uses getopts to read the arguments. Program is secure from a situation when player wants to write its symbol on the place which was already taken, or whether the player wants to put its symbol outside the board. The strategy of the computer is simple. It always wants to put its symbol on the middle of the board. If ti is taken, then the computer chooses random place. After the game the scrpits displays the number of moves and the information about the winner.
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



