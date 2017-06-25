#!/bin/bash
rm 1b_basico.tex || true

Rscript 1b_basico_render.r
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' 1b_basico.tex
pdflatex 1b_basico.tex
biber 1b_basico
pdflatex 1b_basico.tex
pdflatex 1b_basico.tex
