#!/usr/bin/env python3
import pacman

def get_line_from_file(filename, line_number):
    try:
        with open(filename, 'r') as file:
            for current_line_number, line in enumerate(file, start=1):
                if current_line_number == line_number:
                    return line.strip()
        return "Line number out of range."
    except FileNotFoundError:
        return "File not found."


def remove(str):
    try:
        # Attempt to install the PHP package
        pacman.remove(str)
        print(f"{str} removed successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")

def install(str):
    try:
        # Attempt to install the PHP package
        pacman.install(str)
        print(f"{str} installed successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")






if __name__ == "__main__":
    packages = []
    packagesN = 2

    filename = 'packgs.txt'
    
    for i in range(1, packagesN+1):
        lineContent = get_line_from_file(filename, i)
        packages.append(lineContent)

    for i in range(0, packagesN):
        print(packages[i])
