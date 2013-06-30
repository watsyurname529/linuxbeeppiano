#!/usr/bin/env python

# Importing the libraries
import subprocess 
import curses

notes = {
        ord('a') : 261.63, #C4
        ord('w') : 277.18, #Db4
        ord('s') : 293.66, #D4
        ord('e') : 311.13, #Eb4
        ord('d') : 329.63, #E4
        ord('f') : 349.23, #F4
        ord('t') : 369.99, #Gb4
        ord('g') : 392.00, #G4
        ord('y') : 415.30, #Ab4
        ord('h') : 440.00, #A4
        ord('u') : 466.16, #Bb4
        ord('j') : 493.88, #B4
        ord('k') : 523.25, #C5
        }

try:

    #Set up Curses
    lin = curses.initscr() #Initialize window
    curses.cbreak()        #Turn off buffering of chars, allows to be read without pressing enter

    #Be friendly
    lin.addstr(" Welcome to the linux beep piano! (Coded in Python!)\n")
    lin.addstr(" Press keys a-k for whole steps, keys w-u for half steps, and q to exit.\n")

    while True:

    #Get that character
    x = lin.getch()

    if x == ord('q'):
        break
    elif x in notes.keys():
        subprocess.call("beep -f {0}".format(notes.get(x, 0)), shell=True)

finally:
    #Call commands to properly exit curses and return terminal to original state
    curses.nocbreak()
    lin.keypad(0) 
    curses.echo()
    curses.endwin()
