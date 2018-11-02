set terminal png font "Helvetica, 10"
set output 'rt_jc.png'
set xlabel 'n'
set ylabel 'temps (s)'
set key left top
set tics font ",8"

set xrange [0:100000]
set yrange [0:8]

set style data points

f1(x) = cj*x**2
f2(x) = cc*x**2

fit f1(x) 'data2.dat' using 1:3 via cj
fit f2(x) 'data_c.dat' using 1:2 via cc

plot 'data2.dat' using 1:3 title 'algo2 Java',\
     'data_c.dat' using 1:2 title 'algo2 C',\
     f1(x) title '1.7e-10 n^2', f2(x) title '7.1e-10 n^2'
