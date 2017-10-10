#!/bin/bash

# Elimino texs
rm 0_instalacion.tex || true
rm markdown.tex || true
rm control.tex || true
rm introduccion.tex || true
rm conclusion.tex || true

Rscript render.R
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' 0_instalacion.tex
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' markdown.tex
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' control.tex
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' introduccion.tex
sed -i 's/\\begin{figure}\[htbp\]/\\begin{figure}\[H\]/g;s/\\maketitle//g' conclusion.tex

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

pdflatex introduccion.tex
biber introduccion 
pdflatex introduccion.tex
pdflatex introduccion.tex

pdflatex conclusion.tex
biber conclusion 
pdflatex conclusion.tex
pdflatex conclusion.tex
