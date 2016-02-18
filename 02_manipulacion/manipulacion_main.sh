#!/bin/bash

Rscript manipulacion_render.r
pdflatex manipulacion.tex
biber manipulacion 
pdflatex manipulacion.tex
pdflatex manipulacion.tex
