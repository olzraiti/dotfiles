#!/usr/bin/python2.7
import sys
import re
from tempfile import mkstemp
from shutil import move
from os import remove, close

file_path = "/home/olli/.local/share/lighthouse_queries"

query = sys.argv[1]
query_splitted = re.split("{", query)
query_val = query_splitted[0]
query_parsed = "{".join(query_splitted[1:])

found = False

val = None

fh, abs_path = mkstemp()
with open(abs_path,'w') as new_file:
    with open(file_path, "a+") as old_file:
        for line in old_file:
            if not found:
                splitted = re.split(" ", line)
                count = splitted[0]
                cached_query = " ".join(splitted[1:])
                splitted = re.split("{", cached_query)
                val = splitted[0]
                cached_query = "{".join(splitted[1:]).replace("\n", "")
                #print count
                #print val
                #print cached_query
                if query_parsed == cached_query:
                    found = True
                    max = val
                    if len(val) < len(query_val): max = query_val
                    line = count + " " + max + "{" + cached_query + "\n"
                    new_file.write(line.replace(count, str(int(count) + 1), 1))
                if not found:
                    new_file.write(line)
            else:
                new_file.write(line)
    if not found:
        new_file.write("1 " + query + "\n")

close(fh)
#Remove original file
remove(file_path)
#Move new file
move(abs_path, file_path)
