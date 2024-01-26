#!/usr/bin/python3
"""Main func"""

import sys

if __name__ == "__main__":
    top_ten = __import__("1-top_ten").top_ten
    if len(sys.argv) < 2:
        print("Please insert an arguement for the sureddit to search")
    else:
        top_ten(sys.argv[1])
