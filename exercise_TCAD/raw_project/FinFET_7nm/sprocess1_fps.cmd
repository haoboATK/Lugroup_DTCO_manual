#setdep @node|sprocess@

math coord.ucs
AdvancedCalibration 2015.06
AdvancedCalibrationMechanics
SiGe_and_Stress_Effect 1 1 1 0

# Set mechanical parameters
source mechParams.fps


pdbSet Mechanics EtchDepoRelax 0
pdbSet Grid MGoals Keep3DBrep 0

pdbSet Math flow 3D ILS.tolrel     1e-15
pdbSet Math flow 3D ILS.refine.sts 1

#-pdbSet Grid AddGasMesh 1

#-pdbSet Silicon SiliconGermanium.ConversionConc 1

# Set math section - ParDiso for mechanics and multi-thread simulation
#-math  flow  dim=3 pardiso numThreads=4
math  numThreads=4
# Start with mgoal mode
sde off
#-----------------------------------------------------
# Structure parameters, [um]
set Wt       @Wtop@                 ;# Fin top width
set Wb       @Wbottom@              ;# Fin bottom width
set W        @<0.5*(Wtop+Wbottom)>@ ;# Fin average width
set H        @H@                    ;# Fin height
set bHepi    0.017                  ;# SD Epi Shape
set mHepi    0.004                  ;# SD Epi Shape
set tHepi    0.011                  ;# SD Epi Shape
set bLepi    0.003                  ;# SD Epi Shape
set mLepi    0.015                  ;# SD Epi Shape
set tLepi    0.008                  ;# SD Epi Shape
set L        @L@                    ;# Channel length
set Tox      0.0017                 ;# Total physical thickness of gate insulator
#-set Tiox     0.0006                 ;# Gate interlayer oxide thickness
set Tiox     @tox@                 ;# Gate interlayer oxide thickness
set Thfo2    0.0011                 ;# Gate high-k thickness
set Lsp0     0.005                  ;# Nitride spacer foot from gate to epi S/D
set Lsp1     0.007                 ;# Nitride spacer foot from gate to contact
#-set Ppitch   0.044                  ;# Poly pitch
set Ppitch   @<0.029+L>@                  ;# Poly pitch
set Tgate    0.032                  ;# Poly height
set Tsti     0.100                  ;# STI trench depth
set Tbuf     0.500                  ;# Relaxed SiGe depth
set Tsub     1.0                    ;# Substrate depth
set Tcesl    0.015                  ;# Nitride on top of gate
set Tild     0.080                  ;# ILD on top of Nitride
set Tnisi    0.005                  ;# NiSi thickness
set Fpitch   0.024                  ;# Fin pitch
set Lm0b     0.015                  ;# Contact length
set Lm0t     0.018                  ;# Contact length
set PY       0.050                  ;# Gate extension

set Fangle   55.0                   ;# SD facet angle

# Doping parameters, [/cm3]
set Nch      1.0e15                 ;# channel doping
set Nsd      2.0e20                 ;# SD doping
set Nstop    2.0e18                  ;# channel stop doping
#if "@Type@" == "nMOS"
set Dch      "Boron"
set Dsd      "Arsenic"
set Dstop    "Boron"
set Esd      0.004
set dGe      0.001
set GeMoleCh @GeMoleCh@
# Stress/strain input - SD SiGe Mole Fraction
set GeMoleSD @GeMoleSD@
set iSMG    -1.0                    ;# pMOS metal gate stress [GPa]
#else
set Dch      "Phosphorus"
set Dsd      "Boron"
set Dstop    "Arsenic"
set Esd      0.004
set dGe      0.001
set GeMoleCh @GeMoleCh@
# Stress/strain input - SD SiGe Mole Fraction
set GeMoleSD @GeMoleSD@
set iSMG     1.0                    ;# pMOS metal gate stress [GPa]
#endif
set iSsti    1.0                    ;# STI stress [GPa]
set iScont   1.0                    ;# Contact/M0 stress [GPa]

set GeMoleSRB @GeMoleSRB@

#-----------------------------------------------------
# Derived dimensions
set AX0     0.0
set AX1    [expr (0.5*$Ppitch)]

set Xmin    $AX0
set Xmax    $AX1
set Ymin    0.0
set Ymax    [expr (0.5*$Fpitch)]

set PX0     [expr (-0.5*$L)]
set PX1     [expr (0.5*$L)]
set PY0     [expr (-0.5*$Fpitch-$PY)]
set PY1     [expr (0.5*$Fpitch+$PY)]

set SP0X0   [expr ($PX0-$Lsp0)]
set SP0X1   [expr ($PX1+$Lsp0)]
set SP0Y0   [expr ($PY0-$Lsp0)]
set SP0Y1   [expr ($PY1+$Lsp0)]
set SP1X0   [expr ($PX0-$Lsp1)]
set SP1X1   [expr ($PX1+$Lsp1)]
set SP1Y0   [expr ($PY0-$Lsp1)]
set SP1Y1   [expr ($PY1+$Lsp1)]

set M0X0    [expr (0.5*$Ppitch-0.5*$Lm0t)]
set M0X1    [expr (0.5*$Ppitch+0.5*$Lm0t)]
set M0Y0    [expr (-1.0*$Fpitch)]
set M0Y1    [expr ( 1.0*$Fpitch)]

set Hgate   [expr (-1.0*($Tgate+$Tox))]
set Hcesl   [expr ($Hgate-$Tcesl)]
set Hild    [expr ($Hcesl-$Tild)]

#if @<Wbottom == Wtop>@
set Afin    90.0
set Afin0   90.0
#else
set Afin    [expr (180.0/3.14159265*atan($H/(0.5*($Wb-$Wt))))]
set Afin0   [expr (180.0/3.14159265*atan($H/(0.5*($Wb-$Wt))))]
#endif

#-----------------------------------------------------

#-----------------------------------------------------

#---------------------------------------------------------------------#
#   SIMULATION CONTROLL
set debug         1
set DoStrain      1
set DoDiff        1
set DoRound       1
set Type          @Type@


#---------------------------------------------------------------------#
#   USER-DEFINED PROCEDURES

source user_proc.fps

proc WriteBND {} {
        global count

        if { $count < 10} {
           struct tdr.bnd=n@node@_0${count}
        } else {
           struct tdr.bnd=n@node@_${count}
        }
        set count [expr $count+1]
}
set count 1

#
#---------------------------------------------------------------------#

 
line y loc=$Ymin   tag=back
line y loc=$Ymax   tag=front

line z loc=$Xmin   tag=left
line z loc=$Xmax   tag=right

line x loc=-0.15
line x loc=0       tag=top
line x loc=$H
line x loc=$Tsub   tag=bottom


init tdr=n@node|sprocess@_profile_q

deposit  Gas    type=fill  coord=-0.56
if { $debug } { WriteBND }

#----- Save TDR file -----
#-struct tdr=n@node@_0 !gas interfaces alt.maternames

transform reflect back

#----- Contact for sdevice simulation -----
contact bottom name=substrate Silicon
contact point replace region=GateMetal.1  name=gate
contact point replace region=M0.1         name=source
contact point replace region=M0.2         name=drain
if { $debug } { WriteBND }


#--Change refinement strategy and remesh-------------------------------
##---------------Remeshing for device simulation--------##
# clear the process simulation mesh
refinebox clear
refinebox !keep.lines
refinebox clear.interface.mats
line clear

pdbSet Grid MGoals Keep3DBrep 0

# Set very high values for adaptive meshing parameters
pdbSet Grid AdaptiveField Refine.Abs.Error 1e37
pdbSet Grid AdaptiveField Refine.Rel.Error 1e10
pdbSet Grid AdaptiveField Refine.Target.Length 100.0

# Set high quality delaunay meshes
pdbSet Grid sMesh 1
pdbSet Grid SnMesh DelaunayTolerance 5.0e-2
pdbSet Grid SnMesh CoplanarityAngle 179

# Set the interface spacing
mgoals accuracy=1e-6
pdbSet Grid SnMesh max.box.angle.3d 179
grid Adaptive set.Delaunay.type= boxmethod \
     set.min.normal.size= 0.01 \
     set.normal.growth.ratio.3d= 8.0 \
     set.max.points= 500000 \
     set.max.neighbor.ratio= 1e6
     
# Which interfaces are to have interface meshes
refinebox interface.materials= {Silicon SiFin GATEox TopGATEox Oxide HfO2}


#####----- Mesh refinement -----#####
set Ymax    [expr (0.5*$Fpitch+$PY+0.010)]
set Ymin    [expr (-1.0*$Ymax)]
set Xmax    $AX1
set Xmin    [expr (-1.0*$Xmax)]

if { $L < [expr (2.0*$W)] } { set dx [expr (2.0*$W)]
} else { set dx $L }
##DFISE          -Z   Y    X
refinebox name=eAll \
          min= "-2.0         $Ymin              $Xmin" \
          max= " $Tsub       $Ymax              $Xmax" \
          xrefine= 0.1*$Tsub yrefine= 2.0*$W    zrefine= $dx

set tYmin  [expr (-1.0*$Wb)]
set tYmax  [expr ( 1.0*$Wb)]
if { 0.01 < [expr (0.5*$L)] } { set dx [expr (0.5*$L)]
} else { set dx 0.01 }
##DFISE          -Z   Y    X
refinebox name=eSTI \
          min= "-0.05        $tYmin             $Xmin" \
          max= " 0.12        $tYmax             $Xmax" \
          xrefine= 0.01      yrefine= 0.01      zrefine= $dx

set tAY0  [expr (-0.5*$Wb-0.005)]
set tAY1  [expr ( 0.5*$Wb+0.005)]
if { 0.004 < [expr (0.2*$L)] } { set dx [expr (0.2*$L)]
} else { set dx 0.004 }
##DFISE          -Z   Y    X
refinebox name=eActive \
          min= "-0.012       $tAY0              $Xmin" \
          max= " $H+0.010    $tAY1              $Xmax" \
          xrefine= 0.005     yrefine= 0.005     zrefine= $dx

##DFISE          -Z   Y    X
refinebox name=eSDs \
          min= "-0.012       $tAY0              $Xmin" \
          max= " $H+0.010    $tAY1              $PX0" \
          xrefine= 0.004     yrefine= 0.001     zrefine= 0.004
refinebox name=eSDd \
          min= "-0.012       $tAY0              $PX1" \
          max= " $H+0.010    $tAY1              $Xmax" \
          xrefine= 0.004     yrefine= 0.001     zrefine= 0.004

set tAY0  [expr (-0.5*$Wb-0.002)]
set tAY1  [expr ( 0.5*$Wb+0.002)]
##DFISE          -Z   Y    X
refinebox name=e0Active \
          min= "-0.004       $tAY0              $SP1X0-0.000" \
          max= " $H+0.010    $tAY1              $SP1X1+0.000" \
          xrefine= 0.001     yrefine= 0.002     zrefine= 0.1*$L

set tAY0  [expr (-0.5*$Wb-0.001)]
set tAY1  [expr ( 0.5*$Wb+0.001)]
##DFISE          -Z   Y    X
refinebox name=eChannel \
          min= "-0.001       $tAY0              $PX0-0.000" \
          max= " $H+0.001    $tAY1              $PX1+0.000" \
          xrefine= 0.001     yrefine= 0.002     zrefine= 0.05*$L
          
set tAY0  [expr (-0.5*$Wb-0.002)]
set tAY1  [expr ( 0.5*$Wb+0.002)]
set tz0  [expr ($H-0.005)]
set tz1  [expr ($H+0.015)]
if { 0.004 < [expr (0.2*$L)] } { set dx [expr (0.2*$L)]
} else { set dx 0.004 }
refinebox name=SDj0 \
          min= " $tz0        $tAY0              $Xmin" \
          max= " $tz1        $tAY1              $Xmax" \
          xrefine= 0.001     yrefine= 0.002     zrefine= $dx
          
set tAY0  [expr (-0.5*$Wb-0.002)]
set tAY1  [expr ( 0.5*$Wb+0.002)]
set tz0  [expr ($H-0.002)]
set tz1  [expr ($H+0.005)]
if { 0.004 < [expr (0.2*$L)] } { set dx [expr (0.2*$L)]
} else { set dx 0.004 }
refinebox name=SDj \
          min= " $tz0        $tAY0              $Xmin" \
          max= " $tz1        $tAY1              $Xmax" \
          xrefine= 0.0005     yrefine= 0.002     zrefine= $dx

set tAY0  [expr (-0.5*$Wb-0.000)]
set tAY1  [expr ( 0.5*$Wb+0.000)]
set tx00  [expr ($PX0-0.007)]
set tx01  [expr ($PX0+0.003)]
set tx10  [expr ($PX1-0.003)]
set tx11  [expr ($PX1+0.007)]
refinebox name=jSDs \
          min= " 0.000       $tAY0              $tx00" \
          max= " $H+0.002    $tAY1              $tx01" \
          xrefine= 0.001     yrefine= 0.002     zrefine= 0.0005
refinebox name=jSDd \
          min= " 0.000       $tAY0              $tx10" \
          max= " $H+0.002    $tAY1              $tx11" \
          xrefine= 0.001     yrefine= 0.002     zrefine= 0.0005

refinebox name= Channel\
   min= "-0.001    $tAY0  $SP1X0" \
   max= "$H+0.001  $tAY1  $SP1X1"  \
   min.normal.size= 5e-4 normal.growth.ratio= 1.5 \
   interface.mat.pairs= {SiFin GATEox SiFin TopGATEox} all add
   
pdbSet InfoDefault 1

refinebox remesh info=2

transform reflect left

#-grid remesh


SetTDRList   {Stress StressEL Dopants xMoleFraction} !Solutions
#----- Save TDR file -----
struct tdr=n@node@_mc !gas interfaces alt.maternames
      
#-strip Nitride
#-contact point replace region=GateMetal  name=gate
#-struct tdr=n@node@_mcX !gas interfaces alt.maternames

exit




