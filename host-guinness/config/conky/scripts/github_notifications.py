#!/usr/bin/python

import sys
import requests
from requests.auth import HTTPBasicAuth
from bs4 import BeautifulSoup

result_parser = 'lxml'
url = 'https://api.github.com/notifications'
actions = ['unread', 'emails']

def get_token(credentials_file_name):
    with open(credentials_file_name, 'r') as credentials_file:
        token = credentials_file.readline()[:-1] # trim newlines
        return token
    return None

def ping_github(token):
    auth_header = {'Authorization': 'token {}'.format(token)}
    response = requests.get(url, headers=auth_header)
    if response.status_code >= 400:
        raise Exception('Error pinging github.')
    soup = BeautifulSoup(response.text, result_parser)
    return soup


if __name__ == '__main__':


    try:
        if len(sys.argv) != 2:
            # Usage information is suppressed for quiet use in conky.
            # print('Usage: github_notifications.py credentials-file')
            sys.exit(0)

        credentials_file_name = sys.argv[1]

        token = get_token(credentials_file_name)
        soup = ping_github(token)

        print(soup)

    except:
        # If for some reason information can't be printed,
        # just output 'N/A'. Everyone likes that error message,
        # and it's better than mysteriously empty output, imo.
        print('N/A')
        sys.exit(0)
