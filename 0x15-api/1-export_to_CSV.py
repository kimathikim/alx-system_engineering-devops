#!/usr/bin/python3

"""
a script that uses restul API to return the
info of an employee about his TODO list progress
"""
import csv
import json
from sys import argv
import requests


class CustomDialect(csv.excel):
    quoting = csv.QUOTE_ALL


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

    # exporting to csv
    with open(str(id) + ".csv", "w", encoding="utf8") as file:
        exporter = csv.writer(file, delimiter=",", quotechar="'")
        for task in todo:
            task_completed = "True" if task.get("completed") else "False"
            exporter.writerow([
                json.dumps(id),
                json.dumps(user.get("username")),
                json.dumps(task_completed),
                json.dumps(task.get("title"))
            ])


if __name__ == "__main__":
    employee_id = argv[1]
    todolistGet(employee_id)
