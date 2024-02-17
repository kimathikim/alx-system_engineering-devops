#!/usr/bin/python3
"""A recursive function that queries the reddit API and returns
a list containing the titles of all hot articles for a given subreddit"""
import requests
import sys


def recurse(subreddit, hot_list=None):
    if hot_list is None:
        hot_list = []
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)\
               AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77\
               Safari/537.36"
    }
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        data = response.json().get("data")
        titles = data.get("children")
        print(titles)
        for title in titles:
            title = title.get("data").get("title")
            hot_list.append(title)
        after = data.get("after")
        if after:
            recurse(subreddit, hot_list)
    else:
        print("None")
    return hot_list


results = recurse(sys.argv[1])
print(len(results))
