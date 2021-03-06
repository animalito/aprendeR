#!/bin/bash

# Rscript 1_basico_render.r
# xelatex 1_basico.tex
# biber 1_basico
# xelatex 1_basico.tex
# xelatex 1_basico.tex

rm 1_basico.tex || true

Rscript 1_basico_render.r
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' 1_basico.tex
pdflatex 1_basico.tex
biber 1_basico
biber 1_basico
pdflatex 1_basico.tex
pdflatex 1_basico.tex
