#!/bin/bash

rm ggplot2.tex || true

Rscript render.R
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' ggplot2.tex

pdflatex ggplot2.tex
biber ggplot2 
pdflatex ggplot2.tex
pdflatex ggplot2.tex
