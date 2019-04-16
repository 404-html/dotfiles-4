#!/usr/bin/env python3

import re
import os
import sys
import datetime
from jinja2 import Template
import subprocess

HOME_DIR = os.getenv("HOME")
ORG_DIR = os.getenv('ORG_HOME', "{home}/org".format(home=HOME_DIR))

JOURNAL_DIR = ORG_DIR +'/journal'
ENTRY_TEMPLATE = JOURNAL_DIR + "/.template.jinja"


def get_datetime():
    today = datetime.datetime.today()
    result = dict()
    result["date"] = today.strftime('%Y-%m-%d')
    result["day"] = today.strftime('%A')
    result["day_abbr"] = today.strftime('%a')
    result["day_of_month"] = today.strftime('%d')
    result["time"] = today.strftime('%H:%M')
    result["month"] = today.strftime('%B')
    result["month_abbr"] = today.strftime('%b')
    result["year"] = today.strftime('%Y')
    return result


NOW = get_datetime()


def read_template(path):
    with open(path) as t:
        read_data = t.read()
    return Template(read_data)


def get_timestamp(active=True):
    result = "<{timestamp}>" if active else "[{timestamp}]"
    timestamp = "{date} {day_abbr} {time}".format(**NOW)
    return result.format(timestamp=timestamp)


def is_file_exist(path):
    exists = os.path.isfile(path)
    if exists:
        return True
    else:
        return False


def get_or_create_entry():
    path = JOURNAL_DIR + "/{date}.org".format(**NOW)

    if not is_file_exist(path):
        template = read_template(ENTRY_TEMPLATE)
        f = open(path, "x")
        f.write(template.render(**NOW))
        f.close()

    return path


def get_next_record_num(path):
    f = open(path, "r")
    pattern = re.compile(r"^\*+\s")
    count = 0
    linenum = 0
    for line in f:
        linenum +=1
        if pattern.match(line):
            count += 1

    f.close
    return (count, linenum)


def append_record(path, record):
    f = open(path, "a+")
    f.write("\n")
    f.write("** {record}\n".format(record=record))
    f.write("   {timestamp}\n".format(timestamp=get_timestamp(False)))
    f.close()


entry_path = get_or_create_entry()
record_num, line_num = get_next_record_num(entry_path)

default_record_name = "Record {n}".format(n=record_num)

record_name = input("New record name [{default}]: ".format(default=default_record_name))

if not record_name:
    record_name = default_record_name

append_record(entry_path, record_name)

subprocess.call("emacs -nw +"+str(line_num+2) + " " + entry_path, shell=True)

