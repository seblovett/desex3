
#run all simulations and make tables
cd ..
echo "Running HSPice on all cells" > spice.out
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
                        echo "${dir##*/}  ERROR" >> ../spice.out
                else
			echo "${dir##*/}  PASS" >> ../spice.out
                        python ../global/mt0totable.py -i ${dir##*/}_ld.mt0 -o acresults.txt
                fi
                cd ..
        fi
        fi
done

#go back to the global directory
cd global 
#tex the hell out of it
pdflatex Databook.tex
pdflatex Databook.tex
pdflatex Databook.tex
