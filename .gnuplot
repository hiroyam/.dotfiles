reset

# set terminal x11 enhanced font ',10' persist
set terminal pngcairo size 640,360 enhanced font 'DejaVuSansMono,8'
set output "plot.png"

set label "gnuplot" at screen 0.987,0.99 rotate by -90 font ",6" textcolor rgb "#808080"

set border 3 back lc rgb '#808080' lt 1
set tics nomirror

set grid back lc rgb '#808080' lt 0 lw 1

set key outside center right reverse Left

# set title  "" font ",10"
# set xlabel ""
# set ylabel ""

# line styles
set style line 1 lc rgb '#A6CEE3' lw 2 pt 6 ps 1 # light blue
set style line 2 lc rgb '#1F78B4' lw 2 pt 6 ps 1 # dark blue
set style line 3 lc rgb '#B2DF8A' lw 2 pt 6 ps 1 # light green
set style line 4 lc rgb '#33A02C' lw 2 pt 6 ps 1 # dark green
set style line 5 lc rgb '#FB9A99' lw 2 pt 6 ps 1 # light red
set style line 6 lc rgb '#E31A1C' lw 2 pt 6 ps 1 # dark red
set style line 7 lc rgb '#FDBF6F' lw 2 pt 6 ps 1 # light orange
set style line 8 lc rgb '#FF7F00' lw 2 pt 6 ps 1 # dark orange
set style line 9 lc rgb '#666666' lw 2 pt 6 ps 1 # gray

# # line styles
# set style line 1 lc rgb '#A6CEE3' lw 2 pt 6 ps 1 # light blue
# set style line 2 lc rgb '#1F78B4' lw 2 pt 6 ps 1 # dark blue
# set style line 3 lc rgb '#B2DF8A' lw 2 pt 6 ps 1 # light green
# set style line 4 lc rgb '#33A02C' lw 2 pt 6 ps 1 # dark green
# set style line 5 lc rgb '#FB9A99' lw 2 pt 6 ps 1 # light red
# set style line 6 lc rgb '#E31A1C' lw 2 pt 6 ps 1 # dark red
# set style line 7 lc rgb '#FDBF6F' lw 2 pt 6 ps 1 # light orange
# set style line 8 lc rgb '#FF7F00' lw 2 pt 6 ps 1 # dark orange
# set style line 9 lc rgb '#666666' lw 2 pt 6 ps 1 # gray

# # matlab palette
# set palette maxcolors 8
set cbtics scale 0
set palette defined ( 0 "#000090",\
                      1 "#000fff",\
                      2 "#0090ff",\
                      3 "#0fffee",\
                      4 "#90ff70",\
                      5 "#ffee00",\
                      6 "#ff7000",\
                      7 "#ee0000",\
                      8 "#7f0000")

set object rectangle from screen -0.1,-0.1 to screen 1.1,1.1 fillstyle solid border fillcolor rgb "#EEEEEE" behind
set object rectangle from graph  0,0       to graph  1,1     fillstyle solid border fillcolor rgb "#333333" behind
# set object rectangle from screen -0.1,-0.1 to screen 1.1,1.1 fillstyle solid border fillcolor rgb "#FFFFFF" behind
# set object rectangle from graph  0,0       to graph  1,1     fillstyle solid border fillcolor rgb "#FFFFFF" behind



# sample

# plot \
# "NONE" using 1:2 w filledcurves above y1=0 fill transparent solid 0.2 ls 2 notitle, \
# "NONE" w l ls 2

# set mytics 2
# set grid xtics ytics mytics lc rgb "red", lc rgb "red", lc rgb "gray"
