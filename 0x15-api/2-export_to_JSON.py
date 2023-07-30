#!/usr/bin/python3

"""
a script that uses restul API to return the
info of an employee about his TODO list progress
"""
import json
from sys import argv
import requests


def todolistGet(id):
    """function that defines the endpoints and retreived data"""

    # url
    url = "https://jsonplaceholder.typicode.com"

    # endpoints
    user = "{}/users/{}".format(url, str(id))
    todo = "{}/todos".format(user)

    # get the data. making the request using get method and
    # specified format to be used
    user = requests.get(user)
    user = user.json()
    todo = requests.get(todo)
    todo = todo.json()
    # print("{}".format(todo))

    # exporting to json
    to_json = {}
    to_json[id] = []
    with open(str(id) + ".json", "w", encoding="utf8") as file:
        for task in todo:
            to_json[id].append({
                "task": task.get("title"),
                "completed": task.get("completed"),
                "username": user.get("username")
            })
        json.dump(to_json, file)


if __name__ == "__main__":
    employee_id = argv[1]
    todolistGet(employee_id)
