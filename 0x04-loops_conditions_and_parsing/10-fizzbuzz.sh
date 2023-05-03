#!/usr/bin/env bash
# display 1 to then. fizzBuzz

i=1

while [ $i -le 20 ]; do
	if [ $((i % 3)) -eq 0 ] && [ $((i % 5)) -eq 0 ]; then
		echo "FizzBuzz"
	elif [ $((i % 3)) -eq 0 ]; then
		echo "Fizz"
	elif [ $((i % 5)) -eq 0 ]; then
		echo "Buzz"
	else
		echo "$i"
	fi
	((i++))
done
