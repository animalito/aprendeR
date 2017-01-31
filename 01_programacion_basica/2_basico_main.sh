#!/bin/bash

Rscript 2_basico_render.r
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' 2_basico.tex
pdflatex 2_basico.tex
biber 2_basico
pdflatex 2_basico.tex
pdflatex 2_basico.tex

