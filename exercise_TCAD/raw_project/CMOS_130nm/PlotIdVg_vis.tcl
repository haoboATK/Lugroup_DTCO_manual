## Define SWB variables
#set Vtgm   x
#set VtiLin x
#set IdLin  x
#set SSlin  x
#set gmLin  x
#set VtiSat x
#set IdSat  x
#set Ioff   x
#set SSsat  x
#set gmSat  x
#----------------------------------------------------------------------#

set N     @node@
set i     @node:index@
set Lg    @Lgate@
set Vd    @Vdd@

if { [string match @Domain@ "NMOS"] } {
  set Type nMOS
  set Weff 1.0
} elseif { [string match @Domain@ "PMOS"] } {
  set Type pMOS
  set Weff  1.0
}
set ID "$Type"
set N   ${Type}_${N}

#- Automatic alternating color assignment tied to node index
#----------------------------------------------------------------------#
set COLORS  [list green blue red orange magenta violet brown]
set NCOLORS [llength $COLORS]
set color   [lindex  $COLORS [expr $i%$NCOLORS]]

#- Plotting IdVg
#----------------------------------------------------------------------#
echo "#########################################"
echo "Plotting Id-Vg (lin) curve"
echo "#########################################"
load_file IdVg_VdLin_@plot@ -name PLT_Lin($N)

if {[lsearch [list_plots] Plot_IdVg] == -1} {
	create_plot -1d -name Plot_IdVg
}
select_plots Plot_IdVg

set Vgs [get_variable_data "gate OuterVoltage" -dataset PLT_Lin($N)]
set Ids [get_variable_data "drain TotalCurrent" -dataset PLT_Lin($N)]
ext::AbsList out= absIds x= $Ids ;# Compute absolute value of drain currents
create_variable -name absId -dataset PLT_Lin($N) -values $absIds

create_curve -name IdVgLin($N) -dataset PLT_Lin($N) \
	-axisX "gate OuterVoltage" -axisY "absId"
	
if { $Type == "nMOS" } {	
set_curve_prop IdVgLin($N) -label "nIdLin" \
	-color $color -line_style solid -line_width 3 \
	-markers_type circle -markers_size 5 -show_markers
} else {
set_curve_prop IdVgLin($N) -label "pIdLin" \
	-color $color -line_style solid -line_width 3 \
	-markers_type circlef -markers_size 5 -show_markers
}

#----------------------------------------------------------------------#
echo "#########################################"
echo "Extracting parameters from Id-Vg (lin) curve"
echo "#########################################"

#- Defining current level for Vti extraction
#----------------------------------------------------------------------#
set Io    [expr 1.0e-7*$Weff/$Lg] 
if { $Type == "nMOS" } { set SIGN 1.0 } else { set SIGN -1.0 }

create_variable -name IdScLin -dataset PLT_Lin($N) -function "$SIGN/$Weff*<drain TotalCurrent:PLT_Lin($N)>"
set IdsScLin [get_variable_data "IdScLin" -dataset PLT_Lin($N)]

ext::ExtractVtgm     -out Vtgm   -name "Vtgm"   -v $Vgs -i $absIds 
ext::ExtractVti      -out VtiLin -name "VtiLin" -v $Vgs -i $absIds   -io $Io 
ext::ExtractExtremum -out IdLin  -name "IdLin"  -x $Vgs -y $IdsScLin -type "max"
ext::ExtractSS       -out SS     -name "SSlin"  -v $Vgs -i $absIds   -vo [expr $SIGN*1e-2]
ext::ExtractGm       -out gm     -name "gmLin"  -v $Vgs -i $absIds 


echo "#########################################"
echo "Plotting Id-Vg (sat) curve"
echo "#########################################"
load_file IdVg_VdSat_@plot@ -name PLT_Sat($N)

if {[lsearch [list_plots] Plot_IdVg] == -1} {
	create_plot -1d -name Plot_IdVg
}
select_plots Plot_IdVg

set Vgs [get_variable_data "gate OuterVoltage" -dataset PLT_Sat($N)]
set Ids [get_variable_data "drain TotalCurrent" -dataset PLT_Sat($N)]
ext::AbsList out= absIds x= $Ids ;# Compute absolute value of drain currents
create_variable -name absId -dataset PLT_Sat($N) -values $absIds


create_curve -name IdVgSat($N) -dataset PLT_Sat($N) \
	-axisX "gate OuterVoltage" -axisY "absId"
	
if { $Type == "nMOS" } {
set_curve_prop IdVgSat($N) -label "nIdSat" \
	-color $color -line_style dash -line_width 3 \
	-markers_type square -markers_size 5 -show_markers
} else {
set_curve_prop IdVgSat($N) -label "pIdSat" \
	-color $color -line_style dash -line_width 3 \
	-markers_type squaref -markers_size 5 -show_markers	
}

## Axis	 Specification
set_plot_prop -title "I<sub>d</sub>-V<sub>gs</sub> Curve" -title_font_size 16 -show_legend
set_axis_prop -axis x -title {Gate Voltage [V]} \
	-title_font_size 16 -scale_font_size 14 -type linear 
set_axis_prop -axis y -title {Drain Current [A/<greek>m</greek>m]} \
	-title_font_size 16 -scale_font_size 14 -type log
set_legend_prop -font_size 12 -location bottom_right -font_att bold


#----------------------------------------------------------------------#
echo "#########################################"
echo "Extracting parameters from Id-Vg (sat) curve"
echo "#########################################"

#- Defining current level for Vti extraction
#----------------------------------------------------------------------#
set Io    [expr 1.0e-7*$Weff/$Lg] 
if { $Type == "nMOS" } { set SIGN 1.0 } else { set SIGN -1.0 }

create_variable -name IdScSat -dataset PLT_Sat($N) -function "$SIGN/$Weff*<drain TotalCurrent:PLT_Sat($N)>"
set IdsScSat [get_variable_data "IdScSat" -dataset PLT_Sat($N)]
 
ext::ExtractVti      -out VtiSat -name "VtiSat" -v $Vgs -i $absIds   -io $Io 
ext::ExtractExtremum -out IdSat  -name "IdSat"  -x $Vgs -y $IdsScSat -type "max"
ext::ExtractIoff     -out Ioff   -name "Ioff"   -v $Vgs -i $IdsScSat -vo [expr $SIGN*1e-4]
ext::ExtractSS       -out SS     -name "SSsat"  -v $Vgs -i $absIds   -vo [expr $SIGN*1e-2]
ext::ExtractGm       -out gm     -name "gmSat"  -v $Vgs -i $absIds

