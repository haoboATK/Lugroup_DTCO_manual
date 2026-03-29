#setdep @node|ClassDDmodToxWf@

#----------------------------------------------------------------------#

set DATE [exec date]
set WORK [exec pwd]
puts " "
puts "--------------------------------------------------- "
puts "   SVISUAL variable extraction: "
puts "--------------------------------------------------- "
puts " "
puts "Date      : $DATE "
puts "Directory : $WORK "
puts " "

#if "@Type@" == "nMOS"
#define _CD_   eDensity
#else
#define _CD_   hDensity
#endif

#set dVT2         0.0

#----------------------------------------------------------------------#
load_library extract
lib::SetInfoDef 1
#----------------------------------------------------------------------#

#- Extraction
#----------------------------------------------------------------------#
echo "#########################################"
echo "Extracting parameters from Q-Vgs curve"
echo "#########################################"

set plot IdVg_n@node|DD@_des.plt

load_file "$plot" -name qvqm
puts "load_file (DensityGradient) = $plot"

set Vgqm [get_variable_data "gate OuterVoltage" -dataset qvqm]
set Qgqm [get_variable_data "IntegrChFin _CD_"  -dataset qvqm]

ext::ExtractValue  out= NRef2  name= "noprint"  x= $Vgqm  y= $Qgqm  xo= @VGATE@  f= %.1f
puts  "S: Charge  NRef2  = [format "%.3e" $NRef2] "


set plot IdVg_@plot@

load_file "$plot" -name qv
puts "load_file = $plot"

set Vg [get_variable_data "gate OuterVoltage" -dataset qv]
set Qg [get_variable_data "IntegrChFin _CD_"  -dataset qv]

#-ext::ExtractVti    out= VT2    name= "noprint"  v= $Vg    i= $Qg    io= $NRef2   f= %.3f
ext::ExtractValue  out= VT2    name= "noprint"  x= $Qg    y= $Vg    xo= $NRef2   f= %.3f

if { $VT2 != "x" } {

set VT2  [ format "%.4f" [ expr abs($VT2) ] ]

set dVT2 [expr abs($VT2-abs(@VGATE@))]

} else {

ext::ExtractValue  out= NRef2  name= "noprint"  x= $Vg  y= $Qg  xo= @VGATE@  f= %.1f

ext::ExtractValue  out= VT2    name= "noprint"  x= $Qgqm    y= $Vgqm    xo= $NRef2   f= %.3f

set VT2  [ format "%.4f" [ expr abs($VT2) ] ]

set dVT2 [expr (-1*abs($VT2-abs(@VGATE@)))]

}

set dVT2 [ format "%.4f" [ expr $dVT2  ] ]

puts  "S: Threshold   voltage VT2        = $VT2  Volts"
puts  "S: Threshold voltage change dVT2  = $dVT2  Volts"

puts "DOE: dVT2 $dVT2"


##################################################

exit


