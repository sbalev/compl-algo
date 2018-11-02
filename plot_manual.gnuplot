set terminal png font "Helvetica, 10"
set output 'rt_manual.png'
set xlabel 'n'
set ylabel 'temps (s)'
set key left top
set tics font ",8"

set xrange [10:10e7]
set logscale xy

f1(x) = c1*x**3
f4(x) = c4*x

fit f1(x) 'data1.dat' using 1:2 via c1
fit f4(x) 'data3.dat' using 1:5 via c4

plot f1(x) title 'algo1',\
     f4(x) title 'algo4',\
     5*x title 'algo 4 à la main'
