#!/bin/bash

Rscript manipulacion_render.r
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' manipulacion.tex
pdflatex manipulacion.tex
biber manipulacion 
pdflatex manipulacion.tex
pdflatex manipulacion.tex

Rscript transformacion_render.r
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' transformacion.tex
pdflatex transformacion.tex
biber transformacion 
pdflatex transformacion.tex
pdflatex transformacion.tex

Rscript importacion_render.r
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' importacion.tex
pdflatex importacion.tex
biber importacion 
pdflatex importacion.tex
pdflatex importacion.tex


