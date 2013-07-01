#!/bin/bash

#Thanks to redditor: 'cpbills'
#for this wonderful bash code

echo "Welcome to the Linux Beep Piano! (Coded in BASH!)";
echo "Press keys a-k for whole steps, keys w-u for half steps, and q to exit.";
echo "Shout out and thank you to redditor 'cpbills' for most of the code!";

while read -sn1 key; do
    case "$key" in
        a)
            beep -f 261.63;; #C4
        w)
            beep -f 277.18;; #Db4
        s)
            beep -f 293.66;; #D4
        e)
            beep -f 311.13;; #Eb4
        d)
            beep -f 329.63;; #E4
        f)
            beep -f 349.23;; #F4
        t)
            beep -f 369.99;; #Gb4
        g)
            beep -f 392.00;; #G4
        y)
            beep -f 415.30;; #Ab4
        h)
            beep -f 440.00;; #A4
        u)
            beep -f 466.16;; #Bb4
        j)
            beep -f 493.88;; #B4
        k)
            beep -f 523.25;; #C5
        q)
            break
    esac
done
