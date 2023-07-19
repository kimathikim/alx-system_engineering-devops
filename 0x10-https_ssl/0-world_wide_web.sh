#!/usr/bin/env bash
## Bash script that will display information about subdomains.

sub_domain() {
	declare -a subdomains=("www" "lb-01" "web-01" "web-02")
	#? Validate if exist subdomain.
	for sub in "${subdomains[@]}"; do
		if [ "${2}" == "${sub}" ] || [ -z "${2}" ]; then
			dig "$sub.$1" | grep -A1 'ANSWER SECTION:' | paste - - | awk -v var="${sub}" '{print "The subdomain " var " is a " $7 " record and points to " $8}'
		fi
	done
}

sub_domain "$1" "$2"
