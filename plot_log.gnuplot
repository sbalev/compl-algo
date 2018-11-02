set terminal png font "Helvetica, 10"
set output 'rt_log.png'
set xlabel 'n'
set ylabel 'temps (s)'
set key left top
set tics font ",8"

set xrange [10:10e7]
set logscale xy

set rmargin 8

f1(x) = c1*x**3
f2(x) = c2*x**2
f3(x) = c3*x*log10(x)
f4(x) = c4*x
fit f1(x) 'data1.dat' using 1:2 via c1
fit f2(x) 'data2.dat' using 1:3 via c2
fit f3(x) 'data3.dat' using 1:4 via c3
fit f4(x) 'data3.dat' using 1:5 via c4

set label "seconde" at 1.2e8, 1 font ",8"
set label "minute" at 1.2e8, 60 font ",8"
set label "heure" at 1.2e8, 60*60 font ",8"
set label "jour" at 1.2e8, 60*60*24 font ",8"
set label "mois" at 1.2e8, 60*60*24*30 font ",8"
set label "année" at 1.2e8, 60*60*24*365 font ",8"
set label "siècle" at 1.2e8, 60*60*24*365*100 font ",8"

plot f1(x) title 'algo1',\
     f2(x) title 'algo2',\
     f3(x) title 'algo3',\
     f4(x) title 'algo4',\
     1 lc rgb '#cacaca' notitle,\
     60 lc rgb '#cacaca' notitle,\
     60*60 lc rgb '#cacaca' notitle,\
     60*60*24 lc rgb '#cacaca' notitle,\
     60*60*24*30 lc rgb '#cacaca' notitle,\
     60*60*24*365 lc rgb '#cacaca' notitle,\
     60*60*24*365*100 lc rgb '#cacaca' notitle
