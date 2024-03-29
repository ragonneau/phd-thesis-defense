## Makefile
## Copyright 2022 Tom M. Ragonneau
#
# This work may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3
# of this license or (at your option) any later version.
# The latest version of this license is in
#   http://www.latex-project.org/lppl.txt
# and version 1.3 or later is part of all distributions of LaTeX
# version 2005/12/01 or later.
#
# This work has the LPPL maintenance status `maintained'.
#
# The Current Maintainer of this work is Tom M. Ragonneau.
LC := latexmk
LCFLAGS := -file-line-error -halt-on-error -interaction=nonstopmode -shell-escape

SRC = $(wildcard *.tex)
OBJ = $(basename $(SRC))

all: $(OBJ)

%: %.tex
	$(LC) $(LCFLAGS) $^

.PHONY: clean
clean:
	$(LC) -c
	find . -regex ".*-figure[0-9]*.*\..*" -type f -exec rm -f "{}" ";"
