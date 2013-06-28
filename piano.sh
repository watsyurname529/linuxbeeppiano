#!/usr/bin/python

done = True

#Importing the libraries
import subprocess
import curses

#Set up Curses
lin = curses.initscr() #Initialize window
curses.cbreak()        #Turn off buffering of chars, allows to be read without pressing enter

#Be friendly
lin.addstr("Welcome to the linux beep piano! (Coded in Python!)\n")
lin.addstr("Press keys a-k for whole steps, keys w-u for half steps, and q to exit.\n")

#Infinite loop! (kinda)
while done == True:
	#Get that character
	x = lin.getch()
	#Check that character
	if(x == ord('a')):
		#Using subprocess to call beep from command line
		subprocess.call("beep -f 261.63", shell=True) #C4
	elif(x == ord('w')):
		subprocess.call("beep -f 277.18", shell=True) #Db4
	elif(x == ord('s')):
		subprocess.call("beep -f 293.66", shell=True) #D4
	elif(x == ord('e')):
		subprocess.call("beep -f 311.13", shell=True) #Eb4
	elif(x == ord('d')):
		subprocess.call("beep -f 329.63", shell=True) #E4
	elif(x == ord('f')):
		subprocess.call("beep -f 349.23", shell=True) #F4
	elif(x == ord('t')):
		subprocess.call("beep -f 369.99", shell=True) #Gb4
	elif(x == ord('g')):
		subprocess.call("beep -f 392.00", shell=True) #G4
	elif(x == ord('y')):
		subprocess.call("beep -f 415.30", shell=True) #Ab4
	elif(x == ord('h')):
		subprocess.call("beep -f 440.00", shell=True) #A4
	elif(x == ord('u')):
		subprocess.call("beep -f 466.16", shell=True) #Bb4
	elif(x == ord('j')):
		subprocess.call("beep -f 493.88", shell=True) #B4
	elif(x == ord('k')):
		subprocess.call("beep -f 523.25", shell=True) #C5
	elif(x == ord('q')):
		done = False

#Call commands to properly exit curses and return terminal to original state
curses.nocbreak()
lin.keypad(0) 
curses.echo()
curses.endwin()		
			
