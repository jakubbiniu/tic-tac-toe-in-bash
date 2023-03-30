#!/bin/bash

player_symbol="O"
computer_symbol="X"
first="p"

while getopts "p:c:f:h" option
do
    case "${option}" in
        h) echo "Arguments:
        -p      You can choose the symbol you want to play with (default "O"). 
                If you switch player to "X" computer automatically swithces to "O"
        -c      You can choose the symbol computer has to play with (default "X")
                if you switch computer to "O" player automatically swithces to "X"
        -f      you can choose who is going to start ("p"/"c", "p" is default)
        -h      shows help"
        exit ;;
        p) player_symbol=${OPTARG}
        if [[ "$player_symbol" == "X" ]]; then
        computer_symbol="O"
        elif [[ "$player_symbol" == "O" ]]; then
        computer_symbol="X"
        fi
        ;;
        c) computer_symbol=${OPTARG}
        if [[ "$computer_symbol" == "X" ]]; then
        player_symbol="O"
        elif [[ "$computer_symbol" == "O" ]]; then
        player_symbol="X"
        fi
        ;;
        f) 
        if [[ "${OPTARG}" == "c" ]]; then
        first="c"
        fi
        ;;
    esac
done

echo "Tic Tac Toe! Let's play the game!"
# echo $first
# echo $player_symbol
# echo $computer_symbol
# echo $beginning

declare -A board
for i in {1..3}
    do
        for j in {1..3}
            do
                board[i,j]=" "
            done
    done

move_count=0
player_move_count=0
computer_move_count=0
player_winner=1
computer_winner=1
draw=1

player_win () {
    if [[ "${board[1,1]}" == "${board[1,2]}" && "${board[1,2]}" == "${board[1,3]}" && "${board[1,1]}" == "$player_symbol" ]] ; then
        player_winner=0
    elif [[ "${board[2,1]}" == "${board[2,2]}" && "${board[2,2]}" == "${board[2,3]}" && "${board[2,1]}" == "$player_symbol" ]] ; then
        player_winner=0
    elif [[ "${board[3,1]}" == "${board[3,2]}" && "${board[3,2]}" == "${board[3,3]}" && "${board[3,3]}" == "$player_symbol" ]] ; then
        player_winner=0
    elif [[ "${board[1,1]}" == "${board[2,1]}" && "${board[2,1]}" == "${board[3,1]}" && "${board[3,1]}" == "$player_symbol" ]] ; then
        player_winner=0
    elif [[ "${board[1,2]}" == "${board[2,2]}" && "${board[2,2]}" == "${board[3,2]}" && "${board[3,2]}" == "$player_symbol" ]] ; then
        player_winner=0
    elif [[ "${board[1,3]}" == "${board[2,3]}" && "${board[2,3]}" == "${board[3,3]}" && "${board[3,3]}" == "$player_symbol" ]] ; then
        player_winner=0
    elif [[ "${board[1,1]}" == "${board[2,2]}" && "${board[2,2]}" == "${board[3,3]}" && "${board[3,3]}" == "$player_symbol" ]] ; then
        player_winner=0
    elif [[ "${board[1,3]}" == "${board[2,2]}" && "${board[2,2]}" == "${board[3,1]}" && "${board[3,1]}" == "$player_symbol" ]] ; then
        player_winner=0
    fi
}

computer_win () {
    if [[ "${board[1,1]}" == "${board[1,2]}" && "${board[1,2]}" == "${board[1,3]}" && "${board[1,1]}" == "$computer_symbol" ]] ; then
        computer_winner=0
    elif [[ "${board[2,1]}" == "${board[2,2]}" && "${board[2,2]}" == "${board[2,3]}" && "${board[2,1]}" == "$computer_symbol" ]] ; then
        computer_winner=0
    elif [[ "${board[3,1]}" == "${board[3,2]}" && "${board[3,2]}" == "${board[3,3]}" && "${board[3,3]}" == "$computer_symbol" ]] ; then
        computer_winner=0
    elif [[ "${board[1,1]}" == "${board[2,1]}" && "${board[2,1]}" == "${board[3,1]}" && "${board[3,1]}" == "$computer_symbol" ]] ; then
        computer_winner=0
    elif [[ "${board[1,2]}" == "${board[2,2]}" && "${board[2,2]}" == "${board[3,2]}" && "${board[3,2]}" == "$computer_symbol" ]] ; then
        computer_winner=0
    elif [[ "${board[1,3]}" == "${board[2,3]}" && "${board[2,3]}" == "${board[3,3]}" && "${board[3,3]}" == "$computer_symbol" ]] ; then
        computer_winner=0
    elif [[ "${board[1,1]}" == "${board[2,2]}" && "${board[2,2]}" == "${board[3,3]}" && "${board[3,3]}" == "$computer_symbol" ]] ; then
        computer_winner=0
    elif [[ "${board[1,3]}" == "${board[2,2]}" && "${board[2,2]}" == "${board[3,1]}" && "${board[3,1]}" == "$computer_symbol" ]] ; then
        computer_winner=0
    fi
}

print_board () {
    echo
    echo " ${board[1,1]} | ${board[1,2]} | ${board[1,3]} "
    echo "_________"
    echo " ${board[2,1]} | ${board[2,2]} | ${board[2,3]} "
    echo "_________"
    echo " ${board[3,1]} | ${board[3,2]} | ${board[3,3]} "
    echo
}

player_move () {
    echo "Your move!"
    read -p "Input row where you want to play: " i
    while [[ "$i" -lt 1 || "$i" -gt 3 ]]
        do
            echo "Input number from 1 to 3"
            read -p "Input row where you want to play: " i
        done
    read -p "Input column where you want to play: " j
    while [[ "$j" -lt 1 || "$j" -gt 3 ]]
        do
            echo "Input number from 1 to 3"
            read -p "Input row where you want to play: " j
        done
    while [[ "${board[$i,$j]}" == "$player_symbol" || "${board[$i,$j]}" == "$computer_symbol" || "$i" -lt 1 || "$i" -gt 3 || "$j" -lt 1 || "$j" -gt 3 ]]
        do
            echo "wrong place!"
            read -p "Input row where you want to play: " i
            read -p "Input column where you want to play: " j
        done
    board[$i,$j]=$player_symbol
    move_count=$((move_count+1))
    player_move_count=$((player_move_count+1))
}

computer_move () {
    i=2
    j=2
    while [[ "${board[$i,$j]}" == "$player_symbol" || "${board[$i,$j]}" == "$computer_symbol" ]]
    do
        i=$((1 + $RANDOM % 3))
        j=$((1 + $RANDOM % 3))
    done
    board[$i,$j]=$computer_symbol
    move_count=$((move_count+1))
    computer_move_count=$((computer_move_count+1))
}


if [[ "$first" == "p" ]]; then
    player_win
    computer_win
    while [[ "$move_count" -lt 9 && "$player_winner" -eq 1 && "$computer_winner" -eq 1 ]]
        do
            print_board
            player_move
            player_win
        if [[ "$move_count" -lt 9 && "$player_winner" -eq 1 && "$computer_winner" -eq 1 ]]; then
            print_board
            computer_move
            computer_win
        fi
        done
elif [[ "$first" == "c" ]]; then
    computer_win
    player_win
    while [[ "$move_count" -lt 9 && "$player_winner" -eq 1 && "$computer_winner" -eq 1 ]]
        do
            print_board
            computer_move
            computer_win
        if [[ "$move_count" -lt 9 && "$player_winner" -eq 1 && "$computer_winner" -eq 1 ]]; then
            print_board
            player_move
            player_win
        fi
        done
fi

print_board
if [[ "$player_winner" -eq 0 ]]; then
    echo "You won! Congratulations!"
elif [[ "$computer_winner" -eq 0 ]]; then
    echo "You lost! Better luck next time!"
else
    echo "Draw!"
fi
echo "Number of your moves: $player_move_count"
echo "Number of computer's moves: $computer_move_count"
