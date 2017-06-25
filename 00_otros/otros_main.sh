#!/bin/bash

# Elimino texs
rm 0_instalacion.tex || true
rm markdown.tex || true
rm control.tex || true

Rscript render.R
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' 0_instalacion.tex
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' markdown.tex
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' control.tex

pdflatex 0_instalacion.tex
biber 0_instalacion 
pdflatex 0_instalacion.tex
pdflatex 0_instalacion.tex

pdflatex markdown.tex
biber markdown 
pdflatex markdown.tex
pdflatex markdown.tex

pdflatex control.tex
biber control 
pdflatex control.tex
pdflatex control.tex
