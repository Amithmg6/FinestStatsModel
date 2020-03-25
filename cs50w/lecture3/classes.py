"""
init when i create a function what will i need in it

self is name refering to the name i have created

creating a point as p and its created using the class point i have created.

finally print out the x and y value
"""

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

p = Point(3, 5)
print(p.x)
print(p.y)
