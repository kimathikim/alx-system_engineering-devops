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
    todo = "{}/todos".format(user)
    task_Done = "{}?completed=true".format(todo)

    # get the data. making the request using get method and
    # specified format to be used

    user = requests.get(user)
    user = user.json()

    todo = requests.get(todo)
    todo = todo.json()

    task_Done = requests.get(task_Done)
    task_Done = task_Done.json()

    output = "Employee {}: {}".format(user.get("name"), "OK" if len(
        task_Done) == len(todo) else "Incorrect")

    return output


if __name__ == "__main__":
    employee_id = int(argv[1])
    result = todolistGet(employee_id)
    print(result)
