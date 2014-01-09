#!/usr/bin/env python

# Thanks to the various users on GitHub who have edited this code in various ways

# Importing the libraries
import subprocess 
import curses

#Note libraries; with 3 octaves!
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
        
notes_8va = {
        ord('a') : 523.25, #C5
        ord('w') : 554.37, #Db5
        ord('s') : 587.33, #D5
        ord('e') : 622.25, #Eb5
        ord('d') : 659.26, #E5
        ord('f') : 698.46, #F5
        ord('t') : 739.99, #Gb5
        ord('g') : 783.99, #G5
        ord('y') : 830.61, #Ab5
        ord('h') : 880.00, #A5
        ord('u') : 932.33, #Bb5
        ord('j') : 987.77, #B5
        ord('k') : 1046.50, #C6
        }

notes_8vb = {
        ord('a') : 130.81, #C3
        ord('w') : 138.59, #Db3
        ord('s') : 146.83, #D3
        ord('e') : 155.56, #Eb3
        ord('d') : 164.81, #E3
        ord('f') : 174.61, #F3
        ord('t') : 185.00, #Gb3
        ord('g') : 196.00, #G3
        ord('y') : 207.65, #Ab3
        ord('h') : 220.00, #A3
        ord('u') : 233.08, #Bb3
        ord('j') : 246.94, #B3
        ord('k') : 261.63, #C4
        }

#Assign variable to change octaves
octave = notes

try:

    #Set up Curses
    lin = curses.initscr() #Initialize window
    curses.cbreak()        #Turn off buffering of chars, allows to be read without pressing enter

    #Be friendly
    lin.addstr(" Welcome to the linux beep piano! (Coded in Python!)\n")
    lin.addstr(" Press keys a-k for white keys, w-e and t-u for black keys, and q to exit.\n")
    lin.addstr(" z switches to low octave, c to high octave, x goes back to middle.\n")

    while True:

        #Get that character
        x = lin.getch()

        if x == ord('q'):
            break
        elif x == ord('z'):
            octave = notes_8vb
        elif x == ord('x'):
            octave = notes
        elif x == ord('c'):
            octave = notes_8va
        elif x in octave.keys():
            subprocess.call("beep -f {0}".format(octave.get(x, 0)), shell=True)

finally:
    #Call commands to properly exit curses and return terminal to original state
    curses.nocbreak()
    lin.keypad(0) 
    curses.echo()
    curses.endwin()
