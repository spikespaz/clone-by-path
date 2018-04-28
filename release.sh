#! /bin/sh
dmd cbp.d -O -release -inline -boundscheck=off
[ -e cbp.o ] && rm cbp.o
[ -e cbp.obj ] && rm cbp.obj
