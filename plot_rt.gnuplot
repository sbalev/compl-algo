set terminal png font "Helvetica, 10"
set output 'rt_10M.png'
set xlabel 'n'
set ylabel 'temps (s)'
set key left top
set tics font ",8"

set yrange [0:6]

set style data points

plot 'data3.dat' using 1:2 title 'algo1',\
     'data3.dat' using 1:3 title 'algo2',\
     'data3.dat' using 1:4 title 'algo3',\
     'data3.dat' using 1:5 title 'algo4'
