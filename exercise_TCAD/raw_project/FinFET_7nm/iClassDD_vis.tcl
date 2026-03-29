#setdep @node|DD@
#setdep @node|ClassDD@

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

#set EPSOXNEW x
#set TOPEPSOXNEW x

#if "@Type@" == "nMOS"
#define _CD_   eDensity
#else
#define _CD_   hDensity
#endif

#----------------------------------------------------------------------#
load_library extract
lib::SetInfoDef 1
#----------------------------------------------------------------------#

source util.tcl

#- Extraction
#----------------------------------------------------------------------#
echo "#########################################"
echo "Extracting parameters from Q-X curve"
echo "#########################################"

####### Density Gradient #######
set plot n@node|DD@_000001_nonlocal.plt

load_file "$plot" -name qm
puts "load_file = $plot"

# Charge centroid for sidewall

set X [get_variable_data "Pos(@<1e-8*floor(0.5*H*1e8+0.5)>@,0) Distance" -dataset qm]
set Q [get_variable_data "Pos(@<1e-8*floor(0.5*H*1e8+0.5)>@,0) _CD_"  -dataset qm]

set tX0    0.0
ext::ExtractValue  out= tDen0  name= "noprint"  x= $X  y= $Q  xo= $tX0  f= %.3e
set tiDen  [mc_integrate  $X $Q  0.0 @<0.5*0.5*(Wtop+Wbottom)>@ $tX0 $tDen0] 
set tiDenX [mc_integrateX $X $Q  0.0 @<0.5*0.5*(Wtop+Wbottom)>@ $tX0 $tDen0] 

# xqm is computed from the high bias curve
set xqm  [expr ($tiDenX/$tiDen*1e3)]
puts  "Xqm = $xqm"

# Charge centroid for top

set X [get_variable_data "Pos(0,0) Distance" -dataset qm]
set Q [get_variable_data "Pos(0,0) _CD_"  -dataset qm]

set tX0    0.0
ext::ExtractValue  out= tDen0  name= "noprint"  x= $X  y= $Q  xo= $tX0  f= %.3e
set tiDen  [mc_integrate  $X $Q  0.0 @<0.5*0.5*(Wtop+Wbottom)>@ $tX0 $tDen0] 
set tiDenX [mc_integrateX $X $Q  0.0 @<0.5*0.5*(Wtop+Wbottom)>@ $tX0 $tDen0] 

# xqm is computed from the high bias curve
set topxqm  [expr ($tiDenX/$tiDen*1e3)]
puts  "topXqm = $topxqm"

##################################################

####### Classic #######
set plot n@node|ClassDD@_000001_nonlocal.plt

load_file "$plot" -name cl
puts "load_file = $plot"

# Charge centroid for sidewall

set X [get_variable_data "Pos(@<1e-8*floor(0.5*H*1e8+0.5)>@,0) Distance" -dataset cl]
set Q [get_variable_data "Pos(@<1e-8*floor(0.5*H*1e8+0.5)>@,0) _CD_"  -dataset cl]

set tX0    0.0
ext::ExtractValue  out= tDen0  name= "noprint"  x= $X  y= $Q  xo= $tX0  f= %.3e
set tiDen  [mc_integrate  $X $Q  0.0 @<0.5*0.5*(Wtop+Wbottom)>@ $tX0 $tDen0] 
set tiDenX [mc_integrateX $X $Q  0.0 @<0.5*0.5*(Wtop+Wbottom)>@ $tX0 $tDen0] 

# xqm is computed from the high bias curve
set xcl  [expr ($tiDenX/$tiDen*1e3)]
puts  "Xcl = $xcl"

# Charge centroid for top

set X [get_variable_data "Pos(0,0) Distance" -dataset cl]
set Q [get_variable_data "Pos(0,0) _CD_"  -dataset cl]

set tX0    0.0
ext::ExtractValue  out= tDen0  name= "noprint"  x= $X  y= $Q  xo= $tX0  f= %.3e
set tiDen  [mc_integrate  $X $Q  0.0 @<0.5*0.5*(Wtop+Wbottom)>@ $tX0 $tDen0] 
set tiDenX [mc_integrateX $X $Q  0.0 @<0.5*0.5*(Wtop+Wbottom)>@ $tX0 $tDen0] 

# xqm is computed from the high bias curve
set topxcl  [expr ($tiDenX/$tiDen*1e3)]
puts  "topXcl = $topxcl"

##################################################


# extract the computed values to the GENESISe family table
set epsnew [expr @<tox*1.e3>@/(@<tox*1.e3>@/3.9+($xqm-$xcl)/11.7)]

puts "DOE: EPSOXNEW [ format %.3f $epsnew ]"
puts  "New oxide epsilon  = $epsnew"
puts  "\n"

# extract the computed values to the GENESISe family table
set topepsnew [expr @<tox*1.e3>@/(@<tox*1.e3>@/3.9+($topxqm-$topxcl)/11.7)]

puts "DOE: TOPEPSOXNEW [ format %.3f $topepsnew ]"
puts  "New top oxide epsilon  = $topepsnew"
puts  "\n"

exit

