#if @IdVd@ == 0
#noexec
#endif

#--Define the output SWB variables#
#set Ron x

set N     @node@
set i     @node:index@
set Lg    @Lgate@
set Type  @Domain@
set Vg1   @Vg1@
set Vg2   @Vg2@
set Vdd   @Vdd@
set Vg [list @Vg1@ @Vg2@]

#- Automatic alternating color assignment tied to node index
#----------------------------------------------------------------------#
set COLORS  [list green blue red orange magenta violet brown]
set NCOLORS [llength $COLORS]
set color   [lindex  $COLORS [expr $i%$NCOLORS]]
#----------------------------------------------------------------------#

echo "##############################"
echo "plotting Id-Vd curves"
echo "##############################"

if {[lsearch [list_plots] Plot_IdVd] == -1} {
	create_plot -1d -name Plot_IdVd
}
select_plots Plot_IdVd


set IDVDs [lsort [glob IdVd_Vg?@plot@]]
set i 1
set j 0
foreach IDVD $IDVDs {
	load_file $IDVD -name PLT($N,$i) 
	set color   [lindex  $COLORS [expr $i%$NCOLORS]]
	
	set NAME ${Type}_Vg${i}_$N
	create_curve -name ${NAME}_tmp -dataset PLT($N,$i) \
		-axisX "drain OuterVoltage" -axisY "drain TotalCurrent"
	create_curve -name $NAME -function "abs(<${NAME}_tmp>)"	
	  
	remove_curves ${NAME}_tmp
	set_curve_prop $NAME -label "IdVd ($Type Lg=$Lg Vg= [lindex $Vg $j] V)" \
		-color $color -line_style solid -line_width 3
	incr i
	incr j
}
set i [expr $i-1]

## Axis	 Specification
set_plot_prop -title "I<sub>d</sub>-V<sub>ds</sub> Curve" -title_font_size 16 -show_legend
set_axis_prop -axis x -title {Drain Voltage [V]} \
	-title_font_size 16 -scale_font_size 14 -type linear 
set_axis_prop -axis y -title {Drain Current [A/<greek>m</greek>m]} \
	-title_font_size 16 -scale_font_size 14 -type linear
set_legend_prop -font_size 12 -location top_left -font_att bold

#----------------------------------------------------------------------#
#- Extraction
#----------------------------------------------------------------------#
set Vds [get_curve_data $NAME -plot Plot_IdVd -axisX]
set Ids [get_curve_data $NAME -plot Plot_IdVd -axisY]
if { $Type == "NMOS" } { set SIGN 1.0 } else { set SIGN -1.0 }

ext::ExtractRdiff -out Ron -name "Ron" -v $Vds -i $Ids -vo [expr 0.8*$SIGN*$Vdd]
echo "Ron is [format %.3f $Ron] Ohm um"


