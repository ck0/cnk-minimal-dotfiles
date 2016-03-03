#! /usr/bin/env python

import fileinput
import sys

if __name__ == "__main__":
    lines = set()
    for line in fileinput.input():
        if line not in lines:
            sys.stdout.write(line)
        lines.add(line)
