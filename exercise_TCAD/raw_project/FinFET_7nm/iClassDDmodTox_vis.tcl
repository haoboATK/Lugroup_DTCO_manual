#setdep @node|ClassDDmodTox@

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

#set Ninv x
#set dVT  0.0
#set VT0  x

#----------------------------------------------------------------------#
load_library extract
lib::SetInfoDef 1
#----------------------------------------------------------------------#

#- Extraction
#----------------------------------------------------------------------#
echo "#########################################"
echo "Extracting parameters from Q-Vgs curve"
echo "#########################################"

set plot IdVg_@plot@

load_file "$plot" -name qv
puts "load_file = $plot"

set Vg [get_variable_data "gate OuterVoltage" -dataset qv]
set Qg [get_variable_data "IntegrChFin _CD_"  -dataset qv]

ext::DiffList      out= dydx   x= $Vg    y= $Qg    yLog= 0
ext::DiffList      out= d2ydx2 x= $Vg    y= $dydx  yLog= 0
ext::ExtractExtremum  out= Max   name= "noprint"  x= $Vg  y= $d2ydx2  extremum= "max"  f= %.2e
ext::ExtractVti       out= Vti   name= "noprint"  v= $Vg  i= $d2ydx2  io= $Max         f= %.4f
#-ext::ExtractValue     out= Vti   name= "noprint"  x= $d2ydx2  y= $Vg  xo= $Max         f= %.4f
set VTRef  [expr (0.5*$Vti)]
ext::ExtractValue     out= NRef  name= "noprint"  x= $Vg  y= $Qg      xo= $VTRef       f= %.2e
ext::ExtractVti       out= VTcl  name= "noprint"  v= $Vg  i= $Qg      io= $NRef        f= %.4f
#-ext::ExtractValue     out= VTcl  name= "noprint"  x= $Qg  y= $Vg      xo= $NRef        f= %.4f
set VTcl   [expr abs($VTcl)]

set VTRef  [ format "%.4f" [ expr $VTRef  ] ]
set NRef   [ format "%.3e" [ expr $NRef ] ]
set VTcl   [ format "%.4f" [ expr $VTcl  ] ]

puts  "S: Reference Threshold voltage VTRef  = $VTRef  Volts"
puts  "S: Charge   NRef                      = $NRef  Farad"
puts  "S: Threshold   voltage VTcl           = $VTcl  Volts"


set plot IdVg_n@node|DD@_des.plt

load_file "$plot" -name qvqm
puts "load_file (DensityGradient) = $plot"

set Vgqm [get_variable_data "gate OuterVoltage" -dataset qvqm]
set Qgqm [get_variable_data "IntegrChFin _CD_"  -dataset qvqm]

ext::ExtractValue  out= Ninv  name= "noprint"  x= $Vgqm  y= $Qgqm  xo= @VGATE@  f= %.1f
ext::ExtractVti    out= VT    name= "noprint"  v= $Vgqm  i= $Qgqm  io= $NRef        f= %.4f
#-ext::ExtractValue  out= VT    name= "noprint"  x= $Qgqm  y= $Vgqm  xo= $NRef        f= %.4f

set dVT [expr abs(abs($VT)-$VTcl)]

set Ninv [ format "%.3e" [ expr ($Ninv/@<(2*H+Wtop)>@*1.e-4) ] ]
set VT   [ format "%.4f" [ expr $VT  ] ]
set dVT  [ format "%.4f" [ expr $dVT  ] ]

puts  "S: Charge   Ninv                 = $Ninv  cm-2"
puts  "S: Threshold   voltage VT        = $VT  Volts"
puts  "S: Threshold voltage change dVT  = $dVT  Volts"

puts "DOE: Ninv $Ninv"
puts "DOE: dVT $dVT"

ext::DiffList      out= dydxqm   x= $Vgqm  y= $Qgqm    yLog= 0
ext::DiffList      out= d2ydx2qm x= $Vgqm  y= $dydxqm  yLog= 0
ext::ExtractExtremum  out= Maxqm name= "noprint"  x= $Vgqm  y= $d2ydx2qm  extremum= "max"  f= %.3f
ext::ExtractVti       out= VT0   name= "VT0"      v= $Vgqm  i= $d2ydx2qm  io= $Maxqm       f= %.4f
#-ext::ExtractValue     out= VT0   name= "VT0"      x= $d2ydx2qm  y= $Vgqm  xo= $Maxqm       f= %.4f

puts  "S: Threshold   voltage VT0  = $VT0  Volts"


##################################################

exit

