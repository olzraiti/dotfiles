#!/usr/bin/python2.7

import sys
import re

debugFlag = False

def debug(msg):
    if debugFlag:
        if msg != None:
            print msg

class Node:
    def __init__(self, val, action, title, count, *children):
        self.val = val
        self.action = action
        self.title = title
        if count != None: count = int(count)
        self.count = count
        self.children = {}
        for child in children:
            self.addChild(child)

    def __repr__(self):
        if self.val != None:
            return self.val + " " + str(self.children)
        else:
            return str(self.children)

    def addChild(self, child):
        if self.val == None:
            keyPath = child.val
        else:
            keyPath = child.val[len(self.val):]
        debug("keyPath: " + keyPath)

        node = self
        for char in keyPath:
            if char not in node.children:
                node.children[char] = Node(None, None, None, None)
            lastNode = node
            node = node.children[char]
        node.val = child.val
        node.action = child.action
        node.title = child.title
        node.count = child.count

    def isFlower(self):
        return not self.val == None

    def findMaxFlower(self):
        debug("find flower")

        outer = {"max": None}

        def findRec(node):
            for key, child in node.children.iteritems():
                if (child.val != None): debug(child.val + " " + str( child.isFlower() ))
                if (child.count != None): debug(child.count)
                if (outer["max"] != None): debug(outer["max"].count)
                if child.isFlower():
                    print "isFlower"
                    if (child.count != None): print type(child.count)
                    if (outer["max"] != None): print type(outer["max"].count)
                    if outer["max"] != None: print child.count > outer["max"].count
                    if outer["max"] == None or child.count > outer["max"].count:
                        debug("set to max: " + child.val + " " + str(child.count))
                        outer["max"] = child
                if not child.isFlower() and not child.children == {}:
                    findRec(child)

        findRec(self)

        return outer["max"]

    def find(self, query):
        node = self
        for char in query:
            debug("char: " + char)
            if char not in node.children:
                debug("not") 
                return node
            else:
                node = node.children[char]
        if not node.isFlower():
            return node.findMaxFlower()
        return node

def find(query):

    root = Node(None, None, None, None)

    with open("/home/olli/.local/share/lighthouse_queries") as fp:
        for line in fp:
            space_splitted = re.split(" ", line)
            count = space_splitted[0]
            line = " ".join(space_splitted[1:])
            splitted = re.split("{|}|\|\|\|", line)
            query_input = splitted[0].strip()
            title = splitted[1].strip()
            action = splitted[2].strip()
            root.addChild(Node(query_input, action, title, count))

        debug("query: " + query)
        result = root.find(query)
        #print result.action
         
        if result != None and result.action != None and result.title != None:
            return {"action": result.action, "title": result.title}

if len(sys.argv) > 1:
    result = find(sys.argv[1])
    print "{" + result["action"] + " ||| " + result["title"] + "}"
