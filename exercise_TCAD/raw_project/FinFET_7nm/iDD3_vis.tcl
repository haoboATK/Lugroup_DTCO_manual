#setdep @node|DD3@

#define _OffLevel_ 1
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

#set VTL          0.0
#set VTS          0.0
#set IDLIN_uA     x
#set IDSAT_uA     x
#set IOFF_nA      x

#if _OffLevel_
#set WF50pA      0.0
#set WF100pA     0.0
#set WF1nA       0.0
#set WF10nA      0.0
#set WF100nA     0.0
#endif

#----------------------------------------------------------------------#
load_library extract
lib::SetInfoDef 1
#----------------------------------------------------------------------#

set plot IdVg_@plot@

load_file "$plot" -name iv
puts "load_file = $plot"

set Vgs [get_variable_data "gate OuterVoltage" -dataset iv]
set Ids [get_variable_data "drain TotalCurrent" -dataset iv]
ext::AbsList out= absIds x= $Ids ;# Compute absolute value of drain currents
create_variable -name absId -dataset iv -values $absIds

#- Extraction
#----------------------------------------------------------------------#
echo "#########################################"
echo "Extracting parameters from Id-Vgs curve"
echo "#########################################"

#- Defining current level for Vti extraction
#----------------------------------------------------------------------#
set Io    @<100e-9/L>@ ; # [A/um]
puts  "Io: VT Current Level = $Io "
#if "@Type@" == "pMOS"
set Vo   -1.0e-4 
#else
set Vo    1.0e-4 
#endif

#if @< abs(VDRAIN)<0.1 >@

ext::ExtractVti       out= Vti    name= "VTL"       v= $Vgs i= $absIds  io= $Io         f= %.3f
#-ext::ExtractValue     out= Vti    name= "VTL"       x= $absIds y= $Vgs  xo= $Io         f= %.3f
ext::ExtractExtremum  out= Idmax  name= "noprint"   x= $Vgs y= $absIds  extremum= "max" f= %.1f
puts "DOE: IDLIN_uA [format %.1f [expr ($Idmax * 1e6)]]"

echo "VTL (Vg at Io= [format %.3e $Io] A/um) is [format %.3f $Vti] V"
echo "Max IdLin is [format %.3e $Idmax] A/um"

#else

ext::ExtractVti       out= Vti    name= "VTS"       v= $Vgs i= $absIds  io= $Io           f= %.3f
#-ext::ExtractValue     out= Vti    name= "VTS"       x= $absIds y= $Vgs  xo= $Io         f= %.3f
ext::ExtractExtremum  out= Idmax  name= "noprint"   x= $Vgs y= $absIds  extremum= "max"   f= %.1f
ext::ExtractIoff      out= Ioff   name= "noprint"   v= $Vgs i= $absIds  vo= $Vo log10= 0  f= %.2e
puts "DOE: IDSAT_uA [format %.1f [expr ($Idmax * 1e6)]]"
if { $Ioff != "x" } {
puts "DOE: IOFF_nA [format %.2e [expr ($Ioff * 1e9)]]"
}

if { $Vti != "x" } {
echo "VTS (Vg at Io= [format %.3e $Io] A/um) is [format %.3f $Vti] V"
}
echo "Max IdSat is [format %.3e $Idmax] A/um"
if { $Ioff != "x" } {
puts "Ioff is [format %.3e $Ioff] A/um"
}

#if _OffLevel_
ext::ExtractVti       out= Vti50pA    name= "noprint"       v= $Vgs i= $absIds  io= 50e-12           f= %.3f
ext::ExtractVti       out= Vti100pA   name= "noprint"       v= $Vgs i= $absIds  io= 100e-12          f= %.3f
ext::ExtractVti       out= Vti1nA     name= "noprint"       v= $Vgs i= $absIds  io= 1e-9             f= %.3f
ext::ExtractVti       out= Vti10nA    name= "noprint"       v= $Vgs i= $absIds  io= 10e-9            f= %.3f
ext::ExtractVti       out= Vti100nA   name= "noprint"       v= $Vgs i= $absIds  io= 100e-9           f= %.3f
if { $Vti50pA != "x" } {
puts "DOE: WF50pA  [format %.3f [expr (@WF@ - $Vti50pA)]]"
}
if { $Vti100pA != "x" } {
puts "DOE: WF100pA  [format %.3f [expr (@WF@ - $Vti100pA)]]"
}
if { $Vti1nA != "x" } {
puts "DOE: WF1nA   [format %.3f [expr (@WF@ - $Vti1nA)]]"
}
if { $Vti10nA != "x" } {
puts "DOE: WF10nA   [format %.3f [expr (@WF@ - $Vti10nA)]]"
}
if { $Vti100nA != "x" } {
puts "DOE: WF100nA [format %.3f [expr (@WF@ - $Vti100nA)]]"
}
#endif

#endif

##################################################

exit
