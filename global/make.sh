
#run all simulations and make tables
cd ..
for dir in ./*/
do
        dir=${dir%*/}
        echo ${dir##*/}
        if [ ".git" != ${dir##*/} ]; then
        if [ "global" != ${dir##*/} ]; then
                cd ${dir}
                if [ "inv" != ${dir##*/} ]; then
                        cp ../inv/inv.mag inv.mag
                fi
                sh simulate spice ${dir##*/}  noguiplease
                if [ $? != 0 ]; then
                        echo "An error has occurred with " ${dir##*/} 
                else
                        python ../global/mt0totable.py -i ${dir##*/}_ld.mt0 -o acresults.txt
                fi
                cd ..
        fi
        fi
done

cd global 

pdflatex Databook.tex
pdflatex Databook.tex
pdflatex Databook.tex
