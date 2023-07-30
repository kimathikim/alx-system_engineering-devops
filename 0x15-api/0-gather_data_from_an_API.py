#!/usr/bin/python3

"""
a script that uses restul API to return the
info of an employee about his TODO list progress
"""
import requests
from sys import argv


def todolistGet(id):
    """function that defines the endpoints and retreived data"""

    # url
    url = "https://jsonplaceholder.typicode.com"

    # endpoints
    user = "{}/users/{}".format(url, id)
    # print("{}".format(user))
    todo = "{}/todos".format(user)
    task_Done = "{}?completed=true".format(todo)

    # get the data. making the request using get method and
    # specified format to be used

    user = requests.get(user)
    user = user.json()
    # print("{}".format(user))

    todo = requests.get(todo)
    todo = todo.json()

    task_Done = requests.get(task_Done)
    task_Done = task_Done.json()

    print("Employee {} is done with tasks({}/{}):".format(
        user['name'], len(task_Done), len(todo)))
    for task in task_Done:
        print("\t {}".format(task.get("title")))


if __name__ == "__main__":
    employee_id = argv[1]
    todolistGet(employee_id)
