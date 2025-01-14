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

"""
def remove(str):
    try:
        # Attempt to install the PHP package
        pacman.remove(str)
        print(f"{str} removed successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")

"""
def install_pacman(str):
    try:
        pacman.install(str)
        print(f"{str} installed successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")

def install_aur(str):
    try:
        pacman.set_bin("yay")
        pacman.install(str)
        print(f"{str} installed successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")



if __name__ == "__main__":
    packagesPacman = []
    packagesAur    = []

    packagesPacmanN = 15
    packagesAurN = packagesPacmanN + 1;

    filename = 'pakgs.txt'
    
    # Read Pacman packages
    for i in range(1, packagesPacmanN + 1):
        lineContent = get_line_from_file(filename, i)
        if lineContent and lineContent != "Line number out of range." and lineContent != "File not found.":
            packagesPacman.append(lineContent)

    # Read AUR packages
    for i in range(packagesPacmanN + 1, packagesAurN + 1):
        lineContent = get_line_from_file(filename, i)
        if lineContent and lineContent != "Line number out of range." and lineContent != "File not found.":
            packagesAur.append(lineContent)

    # Install Pacman packages
    for package in packagesPacman:
        install_pacman(package)

    # Install AUR packages
    for package in packagesAur:
        install_aur(package)
    
