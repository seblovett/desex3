echo WARNING - this will not generate the tables. 
echo Run make.sh in Unix to correctly generate Databook

pdflatex Databook.tex
pdflatex Databook.tex
pdflatex Databook.tex

del Databook_DRAFTONLY.pdf
move Databook.pdf Databook_DRAFTONLY.pdf
