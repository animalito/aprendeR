#!/bin/bash

cd 00_otros/
./otros_main.sh
cd ../01_programacion_basica/
./1_basico_main.sh
./2_basico_main.sh
cd ../02_manipulacion/
./manipulacion_main.sh
cd ../03_visualizacion/
./viz_main.sh

cd ..
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
