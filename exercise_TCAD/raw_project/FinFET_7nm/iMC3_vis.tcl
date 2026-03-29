#setdep @node|MC3@

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

#set IDLIN_3DMC_uA     x
#set IDSAT_3DMC_uA     x
#set FourSigma3DMC     x

#----------------------------------------------------------------------#
load_library extract
lib::SetInfoDef 1
#----------------------------------------------------------------------#

set plot n@node|MC3@_mc.sparta_average.plt

load_file "$plot" -name in
puts "load_file = $plot"

set Nmc   [get_variable_data "number" -dataset in]
set Ids   [get_variable_data "particle MCdrain" -dataset in]
ext::AbsList out= absIds   x= $Ids ;# Compute absolute value of drain currents
set Ids4s [get_variable_data "particle MCdrain-Error" -dataset in]
ext::AbsList out= absIds4s x= $Ids4s ;# Compute absolute value of drain currents error

#- Extraction
#----------------------------------------------------------------------#
echo "#########################################"
echo "Extracting parameters from Id-N curve"
echo "#########################################"

#- Defining current level for Vti extraction
#----------------------------------------------------------------------#

ext::ExtractExtremum  out= ndrain name= "noprint"   x= $Nmc y= $Nmc     extremum= "max" f= %.0f

#if @< abs(VDRAIN)<0.1 >@

ext::ExtractValue     out= Id     name= "noprint"   x= $Nmc y= $absIds  xo= $ndrain     f= %.1f
puts "DOE: IDLIN_3DMC_uA [format %.1f [expr ($Id * 1e6)]]"

echo "IdLin_MC is [format %.3e $Id] A/um"

#else

ext::ExtractValue     out= Id     name= "noprint"   x= $Nmc y= $absIds  xo= $ndrain     f= %.1f
puts "DOE: IDSAT_3DMC_uA [format %.1f [expr ($Id * 1e6)]]"

echo "IdSat_MC is [format %.3e $Id] A/um"

#endif

#set FourSigma3DMC     x
ext::ExtractValue     out= dd     name= "noprint"   x= $Nmc y= $absIds4s  xo= $ndrain     f= %.1f
puts "DOE: FourSigma3DMC [format %.2f [expr (2 * $Id * $dd * 1e4)]]"

##################################################

exit
