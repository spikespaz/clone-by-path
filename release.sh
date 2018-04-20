#! /bin/sh
dmd cbp.d -O -release -inline -boundscheck=off
rm cbp.o
