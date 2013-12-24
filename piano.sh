#!/bin/bash

#Thanks to redditor: 'cpbills'
#for the original wonderful bash code

clear
echo " Welcome to the Linux Beep Piano! (Coded in BASH!)";
echo " Press keys a-k for white keys, w-e and t-u for black keys, and q to exit.";
echo " z switches to low octave, c to high octave, x goes back to middle."
echo " Shout out and thank you to redditor 'cpbills' for most of the code!";

notes=( 261.63 277.18 293.66 311.13 329.63 349.23 369.99 392.00 415.30 440.00 466.16 493.88 523.25 );
notes_8va=( 523.25 554.37 587.33 622.25 659.26 698.46 739.99 783.99 830.61 880.00 932.33 987.77 1046.50 );
notes_8vb=( 130.81 138.59 146.83 155.56 164.81 174.61 185.00 196.00 207.65 220.00 233.08 246.94 261.63 );

octave=middle

beep_note() {
    case "$octave" in
        low)
            beep -f ${notes_8vb[$1]};;
        middle)
            beep -f ${notes[$1]};;
        high)
            beep -f ${notes_8va[$1]};;
    esac
}

while read -sn1 key; do
    case "$key" in
        a)
            beep_note 0;; #C
        w)
            beep_note 1;; #Db
        s)
            beep_note 2;; #D
        e)
            beep_note 3;; #Eb
        d)
            beep_note 4;; #E
        f)
            beep_note 5;; #F
        t)
            beep_note 6;; #Gb
        g)
            beep_note 7;; #G
        y)
            beep_note 8;; #Ab
        h)
            beep_note 9;; #A
        u)
            beep_note 10;; #Bb
        j)
            beep_note 11;; #B
        k)
            beep_note 12;; #C
        z)
            octave=low;;
        x)
            octave=middle;;
        c)
            octave=high;;
        q)
            break
    esac
done
