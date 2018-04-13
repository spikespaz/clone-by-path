@echo off
dmd cbp.d -O -release -inline -boundscheck=off
del cbp.obj
