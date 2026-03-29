#setdep @node|DD3cal@

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

#set K            x
#set vsat0        x

#if "@Type@" == "nMOS"
#define _Kbal_    k_e
#define _HFmodel_ HighFieldDependence_electron
#elif "@Type@" == "pMOS"
#define _Kbal_    k_h
#define _HFmodel_ HighFieldDependence_hole
#endif

#if @<GeMoleCh == 0.00>@
#define _Vbal_    vsat0(0)
#elif @<GeMoleCh == 0.50>@
#define _Vbal_    vsat0(5)
#elif @<GeMoleCh == 1.00>@
#define _Vbal_    vsat0(10)
#endif

#----------------------------------------------------------------------#
load_library extract
lib::SetInfoDef 1
#----------------------------------------------------------------------#

#if @< abs(VDRAIN)<0.1 >@
set IdTarget      @<1.0e-6*IDLIN_3DMC_uA>@
set plot          Id_Kcal_@plot@
#else
set IdTarget      @<1.0e-6*IDSAT_3DMC_uA>@
set plot          Id_Vcal_@plot@
#endif

load_file "$plot" -name itv
puts "load_file = $plot"

#if @< abs(VDRAIN)<0.1 >@
set T   [get_variable_data "Device=,File=ParameterFile,Material=SiliconGermanium,Model=BALMob,Parameter=_Kbal_" -dataset itv]
#else
set T   [get_variable_data "Device=,File=ParameterFile,Material=SiliconGermanium,Model=_HFmodel_,Parameter=_Vbal_" -dataset itv]
#endif
set Ids [get_variable_data "drain TotalCurrent" -dataset itv]
ext::AbsList out= absIds x= $Ids ;# Compute absolute value of drain currents
create_variable -name absId -dataset itv -values $absIds

#- Extraction
ext::ExtractValue  out= TX  name= "noprint"  x= $absIds  y= $T  xo= $IdTarget

if { $TX != "x" } {
#if @< abs(VDRAIN)<0.1 >@
puts "DOE: K  [format %.3f $TX]"
#else
puts "DOE: vsat0  [format %.3e $TX]"
#endif
}

##################################################

exit



