def square(x):
    return x * x

""" adding main function to avoid running all the code when called """

def main():
    for i in range(10):
        print("{} squared is {}".format(i, square(i)))

""" name = name, if i am running this file then run the main function """
if __name__ == "__main__":
    main()