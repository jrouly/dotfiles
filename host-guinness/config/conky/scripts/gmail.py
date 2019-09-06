#!/usr/bin/python

import sys
import requests
from requests.auth import HTTPBasicAuth
from bs4 import BeautifulSoup

result_parser = 'lxml'
actions = ['unread', 'emails']

def get_credentials(credentials_file_name):
    with open(credentials_file_name, 'r') as credentials_file:
        user = credentials_file.readline()[:-1] # trim newlines
        password = credentials_file.readline()[:-1] # trim newlines
        url = credentials_file.readline()[:-1] # trim newlines
        return (user, password, url)
    return None

def ping_gmail(credentials):
    (user, password, url) = credentials
    response = requests.get(url, auth=HTTPBasicAuth(user, password))
    if response.status_code >= 400:
        raise Exception('Error pinging gmail.')
    soup = BeautifulSoup(response.text, result_parser)
    return soup

def get_unread_count(soup):
    return soup.find('fullcount').text

def get_unread_mails(soup):
    return soup.find_all('entry')

def print_unread_count(soup):
    """
    Print the single digit count of unread emails.
    """
    print(get_unread_count(soup))

def print_formatted_emails(soup):
    """
    Print all unread emails in the format
        From: <sendername>; <subjectline>
    """
    def format_mail(mail):
        email = mail.find('author').find('name').text
        subject = mail.find('title').text
        return 'From: {}; {}'.format(email, subject)

    unread_mails = get_unread_mails(soup)
    formatted_mails = [format_mail(mail) for mail in unread_mails]
    for formatted_mail in formatted_mails:
        print(formatted_mail)


if __name__ == '__main__':

    try:
        raise Exception

        if len(sys.argv) != 3 or sys.argv[2] not in actions:
            # Usage information is suppressed for quiet use in conky.
            #print('Usage: gmail.py credentials-file action')
            #print('\tcredentials-file: \n\t\tuser\n\t\tpassword\n\t\tatom-url')
            #print('\taction: unread | emails')
            sys.exit(0)

        credentials_file_name = sys.argv[1]
        action = sys.argv[2]

        credentials = get_credentials(credentials_file_name)
        soup = ping_gmail(credentials)

        if action == actions[0]:
            print_unread_count(soup)
        elif action == actions[1]:
            print_formatted_emails(soup)
    except:
        # If for some reason information can't be printed,
        # just output 'N/A'. Everyone likes that error message,
        # and it's better than mysteriously empty output, imo.
        print('N/A') # 
        sys.exit(0)
