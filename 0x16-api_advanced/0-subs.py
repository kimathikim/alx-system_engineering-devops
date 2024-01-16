#!/usr/bin/python3
"""Function that queries the Reddit API and returns the number of subscribers
"""


def number_of_subscribers(subreddit):
    """Function that queries the Reddit API and
    returns the number of subscribers"""
    import requests

    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)\
               AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77\
               Safari/537.36"
    }
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        return response.json().get("data").get("subscribers")
    else:
        return 0
