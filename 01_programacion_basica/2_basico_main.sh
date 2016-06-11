#!/bin/bash

Rscript 2_basico_render.r
pdflatex 2_basico.tex
biber 2_basico
pdflatex 2_basico.tex
pdflatex 2_basico.tex

