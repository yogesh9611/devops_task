#!/bin/bash

# Define the function to convert number to wordy version
function to_word() {
    case $1 in
        0) echo "zero";;
        1) echo "one";;
        2) echo "two";;
        3) echo "three";;
        4) echo "four";;
        5) echo "five";;
        6) echo "six";;
        7) echo "seven";;
        8) echo "eight";;
        9) echo "nine";;
        10) echo "ten";;
        20) echo "twenty";;
        30) echo "thirty";;
        40) echo "forty";;
        50) echo "fifty";;
        60) echo "sixty";;
        70) echo "seventy";;
        80) echo "eighty";;
        90) echo "ninety";;
        100) echo "one hundred";;
        *) echo $1;;
    esac
}

# Define the range of numbers to print
start=0
end=100

# Print the numbers and convert every tenth to wordy version
for (( i=start; i<=end; i++ )); do
    if (( i % 10 == 0 )); then
        echo $(to_word $i)
    else
        echo $i
    fi
done
