set term postscript enhanced
set size 2.2,1 
set output "%outputname%.ps"
set terminal postscript "TimesRoman" 20
set title "%stationname% (%provider% station %lon% %lat%) \n\n        Validation cycle: %oldcycle%                                                                                               Current cycle: %cycle%                                                      "
set grid
set xdata time
set format x "%m/%d-%H:%M"
set xtics 43200
set mxtics 12
set key outside bottom horizontal center
set key font ",15"
set datafile missing "-99999"
set timefmt "%Y-%m-%d %H:%M:%S"
set yrange [:]
set autoscale xfix
set ylabel "%ylabel%"
count1(fname)=system(sprintf("awk 'NR>2 && $6!=-99999.0000 { print $0 }' %s | wc -l",fname))
k=count1("%filename%")
#
# if this column consists of only missing values, write a message but
# don't plot anything; only pretend to plot something so that we get the
# right time range across the bottom; if there are real values, plot them
set style circle radius 1500   
plot "%oldfilename%"      using  1:%el2%:%el3% with filledcurves lc 9 title "GEFS ensemble spread", \
     ""                   using  1:%el2%:%el4% with filledcurves lc 9 notitle, \
     ""                   using  1:%el3%:%el4% with filledcurves lc 9 notitle, \
     ""                   using  1:%el5%:%el6% lt rgb "#2F4F4F" with filledcurves title "SREF ensemble spread", \
     ""                   using  1:%el5%:%el7% lt rgb "#2F4F4F" with filledcurves notitle, \
     ""                   using  1:%el6%:%el7% lt rgb "#2F4F4F" with filledcurves notitle, \
     ""                   using  1:%el1% lt 1 lc 7 lw 3 title "Forced by NAM" with lines, \
     ""                   using  1:%el2% with lines lt 1 lc rgb "gray20" lw 3 title "Forced by GEFS mean", \
     ""                   using  1:%el3% with lines lt 2 lc rgb "gray20" lw 3 title "Forced by GEFS mean + std", \
     ""                   using  1:%el4% with lines lt 5 lc rgb "gray20" lw 3 title "Forced by GEFS mean - std", \
     ""                   using  1:%el5% with lines lt 1 lc rgb "midnight-blue" lw 3 title "Forced by SREF mean", \
     ""                   using  1:%el6% with lines lt 2 lc rgb "midnight-blue" lw 3 title "Forced by SREF mean + std", \
     ""                   using  1:%el7% with lines lt 5 lc rgb "midnight-blue" lw 3 title "Forced by SREF mean - std", \
     "%obsname%"  using  1:4 lc rgb "orange" title "Observed" with circles fill solid border lt 1, \
     "%filename%"  using  1:%el1%:%el2%  with filledcurves lc 5 title "Ensemble spread", \
     ""            using  1:%el1%:%el3%  with filledcurves lc 5 notitle, \
     ""            using  1:%el1%:%el4%  with filledcurves lc 5 notitle, \
     "" 	   using  1:%el1%:%el5%  with filledcurves lc 5 notitle, \
     ""  	   using  1:%el1%:%el6%  with filledcurves lc 5 notitle, \
     ""  	   using  1:%el1%:%el7%  with filledcurves lc 5 notitle, \
     ""  	   using  1:%el2%:%el3% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el2%:%el4% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el2%:%el5% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el2%:%el6% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el2%:%el7% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el3%:%el4% with filledcurves lc 5 notitle, \
     "" 	   using  1:%el3%:%el5% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el3%:%el6% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el3%:%el7% with filledcurves lc 5 notitle, \
     "" 	   using  1:%el4%:%el5% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el4%:%el6% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el4%:%el7% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el5%:%el6% with filledcurves lc 5 notitle, \
     ""  	   using  1:%el5%:%el7% with filledcurves lc 5 notitle, \
     ""            using  1:%el6%:%el7% with filledcurves lc 5 notitle, \
     ""               using  1:%el1%  lt 1 lc 7 lw 2 title "Forced by NAM"  with lines, \
     ""               using  1:%el2% lt 1 lc 1 lw 2 title "Forced by GEFS mean"  with lines, \
     ""               using  1:%el3% lt 1 lc 3 lw 2 title "Forced by GEFS mean + std"  with lines, \
     ""               using  1:%el4% lt 1 lc 4 lw 2 title "Forced by GEFS mean - std"  with lines, \
     ""               using  1:%el5% lt 4 lc 1 lw 4 title "Forced by SREF mean"  with lines, \
     ""               using  1:%el6% lt 4 lc 3 lw 4 title "Forced by SREF mean + std"  with lines, \
     ""               using  1:%el7% lt 4 lc 4 lw 4 title "Forced by SREF mean - std"  with lines, \
     "%vertical%"     using  1:4  lt 2 lc 7 lw 5 notitle "" with lines, \
     "%obsname%"      using  1:4 lc rgb "orange" notitle with circles fill solid border lt 1, \
