#! /bin/sh
ldc2 cbp.d -i -O3 -ffast-math -release
[ -e cbp.o ] && rm cbp.o
[ -e cbp.obj ] && rm cbp.obj
