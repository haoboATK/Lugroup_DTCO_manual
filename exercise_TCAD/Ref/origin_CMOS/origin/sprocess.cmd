
# ----------------------
# header: Initialization and Layout Input
# ----------------------

#header
set Type  NMOS
icwb filename= "CMOS130_lyt.mac" scale= 1e-3
fset Domains [icwb list domains]
icwb domain= "NMOS"

# ----------------------
# Query Basic Geometry Information
# ----------------------

fset DIM [icwb dimension]

# ----------------------
# Query Bounding Box (BBox)
# ----------------------

fset Ymin [icwb bbox left ]      ;# Left boundary
fset Ymax [icwb bbox right]      ;# Right boundary
fset Zmin [icwb bbox back ]      ;# Back boundary
fset Zmax [icwb bbox front]      ;# Front boundary
fset LYmin [icwb bbox ymin]      ;# Minimum Y value of layout bbox
fset LYmax [icwb bbox ymax]      ;# Maximum Y value of layout bbox

# ----------------------
# Compute Midpoint and Define Node
# ----------------------

fset Ymid [expr ($Ymax-$Ymin)/2.0]
set CNode @node@
#endheader

# ----------------------
# Generate Masks
# ----------------------

icwb.create.all.masks info=1

# ----------------------
# Design Rules
# ----------------------

fset PolyPitch 0.32
fset Tpoly     0.16
fset IsoPitch  0.345
fset Lg  0.06
fset PolyReox 0.005
fset gox 0.0015
fset SiRecess 0.005
fset Lsp 0.035
fset Tsub 0.2
fset Nat_oxide 0.002
fset Metal1 0.15
fset Divot 0.01
fset STI_depth 0.45
fset STI_tilt 87.0
fset VIA_tilt 82.0
fset CoSi_thick 0.020

##Process_Parameters_begin##
fset param_1_dose      1
fset param_1_energy    1
fset param_2_time      1
fset param_2_temp      1
fset param_3_time      1
fset param_3_temp      1
fset param_4_time      1
fset param_4_temp      1
fset param_4_rate      1
fset param_5_dose      1
fset param_5_energy    1
fset param_5_tilt      1
fset param_6_dose      1
fset param_6_energy    1
fset param_7_time      1
fset param_7_temp      1
fset param_8_dose      1
fset param_8_energy    1
fset param_9_time      1
fset param_9_temp      1
fset param_10_time     1
fset param_10_temp     1
fset param_11_time     1
fset param_11_temp     1
##Process_Parameters_end##

fset Lg2 $Lg/2.0

# ----------------------
# Simulation Control Parameters
# ----------------------

fset fp    1.0
fset MinNormalSize 0.0005
fset NormalGrowthRatio 2.0

# ----------------------
# Parallel Simulation Strategy
# ----------------------

math numThreads= 8
math coord.ucs


# ----------------------
# Start Simulation
# ----------------------

line x location= -0.1                   
line x location= 0.0 tag= top           
line x location= 0.1                    
line x location= $Tsub tag= bottom      
line y location= $Ymin   spacing= 100.0 tag= left   
line y location= $Ymid   spacing= 100.0 tag= right  
region Silicon substrate xlo= top xhi= bottom ylo= left yhi= right

### parameter_region_begin_ininital ###
init Silicon field= Boron concentration= 1.0e15 wafer.orient= {0 0 1} flat.orient= {1 1 0} slice.angle= 45 !DelayFullD
### parameter_region end_ininital ####

refinebox interface.materials= {Silicon PolySilicon Oxide}
AdvancedCalibration

# ----------------------
# PDB (Process DataBase) Settings
# ----------------------

pdbSet InfoDefault 1
pdbSet Diffuse minT 500.0 
pdbSet Mechanics StressHistory 1
pdbSet Mechanics EtchDepoRelax 0
pdbSet ImplantData ResistSkip 1     
pdbSet ImplantData LeftBoundary Reflect  
pdbSet ImplantData RightBoundary Reflect 
pdbSet ImplantData BackBoundary Reflect  
pdbSet ImplantData FrontBoundary Reflect 

# ----------------------
# Meshing Strategy
# ----------------------

grid set.min.normal.size= $MinNormalSize/$fp \
     set.normal.growth.ratio.2d= $NormalGrowthRatio \
     set.max.points= 10000000 set.max.neighbor.ratio= 1e6                 

# ----------------------
# Initial Structure
# ----------------------

struct tdr= 1 !Gas   
puts "Save initial"          

# ----------------------
# Shallow Trench Isolation (STI)
# ----------------------

#split @STI@
deposit material= {Oxide}   type= anisotropic  rate= {1.0} time= 0.01
deposit material= {Nitride} type= anisotropic  rate= {1.0} time= 0.1
photo mask= Active_n thickness= 0.2
etch material= {Nitride} type= anisotropic rate= {0.1} time= 1.1
strip Photoresist
etch material= {Oxide} type= anisotropic rate= {0.01} time= 1.1
etch material= {Silicon} type= trapezoidal rate= $STI_depth time= 1.0 angle= $STI_tilt
temp_ramp name= liner time= 5  temp= 600.0 ramprate= 0.6667
temp_ramp name= liner time= 10 temp= 800.0 hold
temp_ramp name= liner time= 5  temp= 800.0 ramprate= -0.6667
diffuse stress.relax temp_ramp= liner info= 1
strip nitride
strip oxide
etch    material= {Silicon} type= isotropic rate= {0.005} time= 1.0
deposit material= {Silicon} type= isotropic rate= {0.005} time= 1.0
deposit material= {Oxide} type= fill  coord= -0.002
refinebox name= Vt mask= Active_p \
extend= 0.015 extrusion.min= -0.001 extrusion.max= 1.5 \
xrefine= "0.005 0.02/$fp" yrefine= "$PolyPitch/(25.0*$fp)" zrefine= "$IsoPitch/(20.0*$fp)"
grid remesh
struct tdr= 2 !Gas   
puts "Save STI"

# ----------------------
# Well Formation & Vt Adjustment Implant + Anneal
# ----------------------

#split @Well_Vt@
photo mask= pWELL_n thickness= 1.0

### parameter_region_begin_impants_Well_Vt_1 ###
implant Boron dose=[expr $param_1_dose * 1.0e12] energy=[expr $param_1_energy*250] tilt=0.0
implant Boron dose=[expr $param_1_dose * 1.0e12] energy=[expr $param_1_energy*200] tilt=0.0
implant Boron dose=[expr $param_1_dose * 1.0e12] energy=[expr $param_1_energy*100] tilt=0.0
implant Boron dose=[expr $param_1_dose * 5.0e12] energy=[expr $param_1_energy* 80] tilt=0.0
implant Boron dose=[expr $param_1_dose * 5.0e12] energy=[expr $param_1_energy* 40] tilt=0.0
implant Boron dose=[expr $param_1_dose * 6.0e12] energy=[expr $param_1_energy* 20] tilt=0.0
implant Boron dose=[expr $param_1_dose * 6.0e12] energy=[expr $param_1_energy* 10] tilt=0.0
### parameter_region_end_impants_Well_Vt_1 ###

strip Photoresist

### parameter_region_begin_diffusion_Well_Vt_2 ###
temp_ramp name= well time= 0.03  temp= 600.0  ramprate= 250.0
temp_ramp name= well time=[expr  $param_2_time*0.333] temp= [expr  $param_2_temp*1050.0] ramprate= 0.0
temp_ramp name= well time= 0.083 temp= [expr  $param_2_temp*1050.0] ramprate= -90.0
### parameter_region_end_diffusion_Well_Vt_2 ###

diffuse stress.relax temp_ramp= well
etch material= {Oxide} type= anisotropic  rate= {(0.001+$Divot)*0.8} time= 1.0 
etch material= {Oxide} type= isotropic    rate= {(0.001+$Divot)*0.2} time= 1.0
struct tdr= 3 !Gas   
puts "Save Well&Vt"

# ----------------------
# Poly-Silicon (Gate Stack)
# ----------------------

#split @Poly@
deposit material= {Oxide} type= isotropic rate= $gox time= 1.0

### parameter_region_begin_diffusion_poly_3 ###
temp_ramp name= gateox time= 24    temp= 600.0 ramprate= 0.0972
temp_ramp name= gateox time= [expr $param_3_time*20]    temp= [expr $param_3_temp*740.0] ramprate= 0.0
temp_ramp name= gateox time= 0.093 temp= [expr $param_3_temp*740.0] ramprate= -25.0
### parameter_region_end_diffusion_poly_3 ###

diffuse stress.relax temp_ramp= gateox
deposit material= {Poly} type= isotropic  thickness= $Tpoly
photo mask= POLY_n thickness= 0.2
etch  material= {Poly} type= anisotropic rate= $Tpoly+$gox time= 1.0
strip Photoresist
etch    material= {Poly} type= isotropic rate= {0.005} time= 1.0
deposit material= {Poly} type= isotropic rate= {0.005} time= 1.0 selective.materials= {Poly}
etch material= {Oxide} type= anisotropic rate= $gox time= 1.0
etch material= {Silicon} type= trapezoidal rate= $SiRecess time= 1.0 angle= 45.0
deposit material= {Oxide} type= isotropic rate= {1.0} time= $PolyReox

### parameter_region_begin_diffusion_poly_4 ###
temp_ramp name= polyreox time= [expr 0.0667/$param_4_rate] temp= 600.0 ramprate= [expr $param_4_rate*50.0]
temp_ramp name= polyreox time= 0.0667 temp= 800.0 ramprate= 25.0
temp_ramp name= polyreox time= [expr $param_4_time*0.0833] temp= [expr $param_4_temp*900.0] ramprate=  0.0
temp_ramp name= polyreox time= 0.0667 temp= [expr $param_4_temp*900.0] ramprate= -25.0
temp_ramp name= polyreox time= [expr 0.0667/$param_4_rate] temp= 600.0 ramprate= [expr $param_4_rate*-50.0]
### parameter_region_end_diffusion_poly_4 ###

diffuse stress.relax temp_ramp = polyreox
struct tdr= 4 !Gas  
puts "Save Poly"

# ----------------------
# Halo / Extension Implants
# ----------------------

#split @Halo_Ext@
refinebox name= HALO mask= Active_p \
 extend= 0.01 extrusion.min= -0.05 extrusion.max= 0.15 \
 xrefine= "0.004/$fp"  yrefine= "$PolyPitch/(100.0*$fp)" zrefine= "$IsoPitch/(60.0*$fp)" 
refinebox name= YEXT mask= Mesh_EXT_p \
 extend= 0.002 extrusion.min= -$gox extrusion.max= 0.035 \
 xrefine= "0.001/$fp"  yrefine= "0.0015/$fp" zrefine= "$IsoPitch/(60.0*$fp)" Silicon 
refinebox name= EXT_IF mask= Active_p \
 extend= 0.005 extrusion.min= -3*$gox extrusion.max= 0.006 \
 min.normal.size= 0.0002/$fp normal.growth.ratio= 1.5 \
 interface.materials = {Silicon Oxide PolySilicon Oxide} 
grid remesh
photo mask= pWELL_n thickness= 0.5

### parameter_region_begin_implant_Halo_Ext_5 ###
implant Boron dose= [expr $param_5_dose*8.0e12] energy= [expr $param_5_energy*25.0] tilt= [expr $param_5_tilt*30] rotation= 0   
implant Boron dose= [expr $param_5_dose*8.0e12] energy= [expr $param_5_energy*25.0] tilt= [expr $param_5_tilt*30] rotation= 90  
implant Boron dose= [expr $param_5_dose*8.0e12] energy= [expr $param_5_energy*25.0] tilt= [expr $param_5_tilt*30] rotation= 180 
implant Boron dose= [expr $param_5_dose*8.0e12] energy= [expr $param_5_energy*25.0] tilt= [expr $param_5_tilt*30] rotation= -90 
### parameter_region_end_implant_Halo_Ext_5 ###

### parameter_region_begin_implant_Halo_Ext_6 ###
implant Arsenic dose= [expr $param_6_dose*2.5e15] energy= [expr $param_6_energy*6.0] tilt= 0.0
### parameter_region_end_implant_Halo_Ext_6 ###

strip Photoresist

### parameter_region_begin_diffusion_Halo_Ext_7 ###
diffuse time= [expr $param_7_time*1.5]<s> temp= [expr $param_7_temp*1000]<C>
### parameter_region_end_diffusion_Halo_Ext_7 ###
struct tdr= 5 !Gas  
puts "save HALO_EXT"

# ----------------------
# Sidewall Spacer Formation
# ----------------------

#split @SD@
deposit material= {Nitride} type= isotropic  rate= {1.0} time= $Lsp
deposit material= {Oxide} type= isotropic  rate= {1.0} time= 1.2*$Lsp
etch material= { Nitride Oxide } type= anisotropic rate= { 1.5*$Lsp 1.5*$Lsp } time= 2.0
deposit material= {Oxide} type= isotropic  rate= $Nat_oxide time= 1.0 temperature= 500<C>
struct tdr= 6 !Gas  
puts "save SD"

# ----------------------
# HDD (High Dose Drain) Implants
# ----------------------

#split @HDD@
photo mask= pWELL_n thickness= 0.5

### parameter_region_begin_implant_HDD_8 ###
implant Arsenic dose= [expr $param_8_dose*5.5e15] energy= [expr $param_8_energy*55.0] tilt= 0.0 rotation= 0.0
### parameter_region_end_implant_HDD_8 ###

strip Photoresist

### parameter_region_begin_diffuse_HDD_9 ###
diffuse time= [expr $param_9_time*1.5]<s> temp= [expr $param_9_temp*1000]<C>
### parameter_region_end_diffuse_HDD_9 ###

struct tdr= 7 !Gas  
puts "save HDD"

# ----------------
# Silicide
# ----------------

#split @Silicide@
etch material= {Oxide Nitride} type= isotropic  rate= {$Nat_oxide $Nat_oxide} time= 1.45 
etch material= {Silicon} type= isotropic rate= {0.008} time= 1.0 
### parameter_region_begin_diffuse_Silicide_10 ###
diffuse stress.relax time= [expr $param_10_time*60]<s>  temperature= 20<C> ramprate= [ expr (500.0*$param_10_temp - 20.0)/$param_10_time/60 ]<C/s> 
### parameter_region_end_diffuse_Silicide_10 ###

deposit material= {CobaltSilicide} type= isotropic rate= $CoSi_thick time= 1.0 temperature= 500 selective.materials= {Silicon}
deposit material= {Oxynitride} type= isotropic rate= 0.05 time= 1.0 steps= 6 temperature= 500
deposit material= {Oxide} type= fill coord= -$Metal1-0.1

### parameter_region_begin_diffuse_Silicide_11 ###
diffuse stress.relax time= [expr $param_11_time*60]<s>  temperature= 20<C> ramprate= [ expr (500.0*$param_11_temp - 20.0)/$param_11_time/60 ]<C/s> 
### parameter_region_end_diffuse_Silicide_11 ###

struct tdr= 8 !Gas  
puts "Silicide"

# ----------------
# Contact
# ----------------

#split @Contact@
photo mask= VIA1_p thickness= 0.5
etch material= { Oxide } type= trapezoidal thickness= 1.65*$Metal1 angle= $VIA_tilt
etch material= { Oxynitride } type= trapezoidal thickness= 1.65*$Metal1 angle= $VIA_tilt
strip Photoresist
deposit material= { Tungsten } type= fill coord= -$Metal1-0.1+0.001
refinebox name= Trench mask= VIA1_p \
extend= 0.0 extrusion.min= -2*$Metal1 extrusion.max= 0.001 \
min.normal.size= 0.001/$fp normal.growth.ratio= 2.0 \
interface.materials = {Oxide Tungsten Oxynitride Tungsten}


struct tdr= 9 !Gas 
puts "Contact"

# ----------------
# Contact
# ----------------

#split @DeviceMesh@

# Mesh Multiplication factor for device
fset fd 1.0
fset Xbot 0.5

# Truncate Top-bottom
strip Oxide
strip Tungsten
strip Aluminum
strip Oxynitride

##---------------Remeshing for device simulation--------##
# clear the process simulation mesh
refinebox clear
refinebox !keep.lines
line clear

pdbSet Grid AdaptiveField Refine.Abs.Error 1e37
pdbSet Grid AdaptiveField Refine.Rel.Error 1e10
pdbSet Grid AdaptiveField Refine.Target.Length 100.0

grid Adaptive set.Delaunay.type= boxmethod \
     set.max.points= 1000000 \
     set.max.neighbor.ratio= 1e6 \
     set.min.normal.size= 0.01/$fd \
     set.normal.growth.ratio.2d= 4.0

refinebox name= Device_Active mask= Active_p \
 	extend= 0.01 extrusion.min= -$Tpoly extrusion.max= 0.3 \
 	refine.fields= { NetActive } def.max.asinhdiff= 1.0 \
        refine.max.edge= " 0.01/$fd     $PolyPitch/(20*$fd)   $IsoPitch/(16.0*$fd)" \
        refine.min.edge= " 0.0025/$fd   $PolyPitch/(80*$fd)   $IsoPitch/(64.0*$fd)" \
        materials= {Silicon PolySilicon} adaptive
	
refinebox name= Device_Ext mask= Mesh_EXT_p \
 	extend= 0.01 extrusion.min= -0.01 extrusion.max= 0.04 \
 	xrefine= 0.002/$fd  yrefine= 0.002/$fd zrefine= $IsoPitch/(20.0*$fd) materials= {Silicon}

refinebox name= Device_IF mask= Active_p \
        extend= 0.005 extrusion.min= -0.01 extrusion.max= $Divot-0.002 \
        min.normal.size= 0.0002/$fd normal.growth.ratio= 1.2 \
        interface.mat.pairs= {Silicon Oxide PolySilicon Oxide} 
        	
grid remesh 

# Constant Poly Doping and Contact
term name=NetActive PolySilicon delete


set SilicideX -0.001
select z= "1.5e20" name= NetActive store PolySilicon



# Contacts
icwb.contact.mask layer.name= "GATE" name= gate box PolySilicon xlo= -$Tpoly-0.05 xhi=-$Tpoly+0.05 
icwb.contact.mask layer.name= "SOURCE" name= source point CobaltSilicide x= $SilicideX replace
contact bottom name= substrate Silicon

# Saving
struct tdr= 10 !Gas 

if { [catch { exec tdx --mirr-tdr -Y -ren source=drain 10_fps 11_fps} Err] !=0 } {
    LogFile $Err
}
exit
