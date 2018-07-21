#! /bin/sh
ldc2 cbp.d -O3 -release
[ -e cbp.o ] && rm cbp.o
[ -e cbp.obj ] && rm cbp.obj
