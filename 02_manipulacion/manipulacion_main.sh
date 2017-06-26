#!/bin/bash
 
rm manipulacion.tex || true

Rscript manipulacion_render.r
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' manipulacion.tex
pdflatex manipulacion.tex
biber manipulacion
pdflatex manipulacion.tex
pdflatex manipulacion.tex

rm transformacion.tex || true

Rscript transformacion_render.r
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' transformacion.tex
pdflatex transformacion.tex
biber transformacion
pdflatex transformacion.tex
pdflatex transformacion.tex

./rm importacion.tex || true

Rscript importacion_render.r
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' importacion.tex
pdflatex importacion.tex
biber importacion
pdflatex importacion.tex
pdflatex importacion.tex


