#!/usr/bin/env bash
#  Bash script that displays the content of the file /etc/passwd

while EFI= read -r -l; do
	echo "$l" | cut -d ":" -f1,4,7
done <"/etc/passwd"
