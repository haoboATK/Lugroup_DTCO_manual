

#### 2025.11.20 : this version has been remarked,  and delete params####
### watch out, the script of sdevice couldnt run by command #####
### dele: _WF2_ , _Vd_ , _Vg_  ###

#define _Type_ nMOS   
#define _SHFinPa_ 0
#define _SWFinPa_ 0
#define _SLFinPa_ 0
#define _cDir_     110   
#define _cDir_     100   
#define _L_        0.015
#define _Wtop_     0.005
#define _Wbottom_  0.005
#define _H_        0.03
#define _Threads_  4
#define _WF_       4.6
#define _GeMoleCh_ 0.5

#if "_Type_" == "nMOS"
#define _QC_      eQuantumPotential
#define _QCo_     eQuantumPotential(AutoOrientation Density)
#define _CAR_     Electron
##define _WF2_     @<WF+dVT+dVT2>@
#define _QCa_     Aniso(eQuantumPotential(Direction(SimulationSystem)=(0,0,1)))
#define _mobi_    Mobility( efactor(kanda sfactor=SBmob(Type=0) ApplyToMobilityComponents ) eSaturationFactor = 0.20 )
#elif "_Type_" == "pMOS"
#define _QC_      hQuantumPotential
#define _QCo_     hQuantumPotential(AutoOrientation Density)
#define _CAR_     Hole
##define _WF2_     @<WF-dVT-dVT2>@
#define _QCa_     Aniso(hQuantumPotential(Direction(SimulationSystem)=(0,0,1)))
#define _mobi_    Mobility( hfactor(kanda sfactor=SBmob(Type=1) ApplyToMobilityComponents ) hSaturationFactor = 0.27)
#endif
#if "_cDir_" == "110"
#define _RelChDir_    RelChDir110
#elif "_cDir_" == "100"
#define _RelChDir_   -RelChDir110
#endif

File {
  Grid=   "n@previous@_mc_fps.tdr"
  Piezo=  "n@previous@_mc_fps.tdr"  # Piezoelectric
  Plot=   "@tdrdat@" # define the output files name styles
  Current="@plot@"
  Output= "@log@"
  Parameter=   "@parameter@"
  PMIPath="."
}


Thermode {
  { Name="gate"       Temperature=300 }
  { Name="drain"      Temperature=300 }
  { Name="source"     Temperature=300 }
  { Name="substrate"  Temperature=300 }
}

Electrode {
  { Name="gate"        Voltage=0}
  { Name="drain"       Voltage=0.0   Resist=@<100.0*1.0/0.024>@ } 
  { Name="source"      Voltage=0.0   Resist=@<100.0*1.0/0.024>@ } 
  { Name="substrate"   Voltage=0.0 } 
}

Physics {
EffectiveIntrinsicDensity( BandGapNarrowing( OldSlotBoom ) NoFermi )
  Mobility (
    DopingDependence( BALMob( Lch=@<_L_*1e3>@ ) ) # sencodary
    Enormal( RPS InterfaceCharge(SurfaceName="S1") )
    ThinLayer(IALMob( AutoOrientation ))
    HighFieldSaturation
  )
  Recombination ( SRH(DopingDep) Auger Band2Band ( Model = Hurkx ) )

  # sencodary_piezpelectronic
  Piezo(
    Stress=(_SHFinPa_, _SWFinPa_, _SLFinPa_, 0.0, 0.0, 0.0)
    Model(
          DeformationPotential(ekp hkp minimum)
          DOS(eMass hMass)
          _mobi_
    )
  )
}
Physics(Region="ChFin") { 
 _QCo_ 
 _QCa_ 
}
Physics(Region="ChStop") { 
 _QCo_ 
 _QCa_ 
}

# sencodary
Physics(Region="SDE.1") { 
 _QCo_ 
 _QCa_ 
}
# sencodary
Physics(Region="SDE.2") { 
 _QCo_ 
 _QCa_ 
}

# sencodary
Physics(Region="SDepi.1") { 
 _QCo_ 
 _QCa_ 
}
# sencodary
Physics(Region="SDepi.2") { 
 _QCo_ 
 _QCa_ 
}
*** For TiNitride, turned off The stress models (the deformation potential model).
Physics(Material="TiNitride") { 
  Piezo( Stress=(0,0,0,0,0,0) ) 
}
Physics(MaterialInterface="HfO2/InterfacialOxide") {
  Traps (
    (FixedCharge Conc=1.0e12 Level EnergyMid=0.0 fromMidBandGap)
    (FixedCharge Conc=-1.0e12 Level EnergyMid=0.0 fromMidBandGap)
  )
}








*** NonLocalPlot and CurrentPlot  has been deleted ****

Plot {
  Nonlocal
  eDensity hDensity eCurrent/Vector hCurrent/Vector TotalCurrent/Vector
  Potential Electricfield/Vector Doping SpaceCharge
  eMobility hMobility eVelocity/Vector hVelocity/Vector
  BandGap Affinity BandGapNarrowing EffectiveBandGap EffectiveIntrinsicDensity
  ConductionBand ValenceBand
  eQuasiFermi hQuasiFermi eGradQuasiFermi/Vector hGradQuasiFermi/Vector
  eBand2BandGeneration hBand2BandGeneration Band2BandGeneration
  StressXX StressYY StressZZ StressXY StressYZ StressXZ
  eMobilityStressFactorXX eMobilityStressFactorYY eMobilityStressFactorZZ
  eMobilityStressFactorYZ eMobilityStressFactorXZ eMobilityStressFactorXY
  hMobilityStressFactorXX hMobilityStressFactorYY hMobilityStressFactorZZ
  hMobilityStressFactorYZ hMobilityStressFactorXZ hMobilityStressFactorXY
  eTensorMobilityFactorXX eTensorMobilityFactorYY eTensorMobilityFactorZZ
  hTensorMobilityFactorXX hTensorMobilityFactorYY hTensorMobilityFactorZZ
  _QC_
  xMoleFraction
  LayerThickness NearestInterfaceOrientation
}


Math(Material="InterfacialOxide") {NonLocal(-Transparent)}
Math(RegionInterface="Gateoxide1.2/ChFin") {
    NonLocal (
        Length=@<0.5*0.5*(_Wtop_+_Wbottom_)*1.e3*1.e-7>@
        Permeation=@<0.006/100.*1.e3*1.e-7>@
        Direction=(@<(0.5*(_Wbottom_-_Wtop_)/_H_)>@ -1 0)
        MaxAngle=1.e-5
        -Outside
    )
}
Math(RegionInterface="TopGateoxide1/ChFin") {
    NonLocal (
        Length=@<_H_*1.e3*1.e-7>@
        Permeation=@<0.006/100.*1.e3*1.e-7>@
        Direction=(1 0 0)
        MaxAngle=1.e-5
        -Outside
    )
}

Math {
  CoordinateSystem { UCS }
  -CheckUndefinedModels
  Surface "S1" ( MaterialInterface="HfO2/InterfacialOxide")
	  AutoOrientationSmoothingDistance = -1
	  GeometricDistances
	  ThinLayer( Mirror = ( None Min None ) )
  Extrapolate
  Derivative
  Method=ILS
  RhsMin = 1e-12
  Iterations=20
  ILSrc =
  "
  set(1){
    iterative(gmres(1000), tolrel=1e-10, tolunprec=1e-8, tolabs=0, maxit=200);
    preconditioning(ilut(0.001,-1),left);
    ordering ( symmetric=nd, nonsymmetric=mpsilst );
    options( compact=yes, linscale=0, refineresidual=8, verbose=0); };  
  "
  wallclock
  ExitOnFailure
  Number_of_Threads = _Threads_
}



Solve {
*- Creating initial guess:
   NewCurrentFile="tmp1"
   Coupled(Iterations=100 LineSearchDamping=1e-4) { Poisson _QC_ Contact }
   Coupled(Iterations=100) { Poisson _QC_ Contact }

   Quasistationary (
      InitialStep=1e-2 Increment=1.5
      MinStep=1e-6 MaxStep=0.2
      Goal { Name="drain" Voltage= 0.05  }
   ){ Coupled { Poisson _CAR_ _QC_ Contact } }
   Save( FilePrefix="tmp2_low" )
   Quasistationary (
      InitialStep=1e-2 Increment=1.5
      MinStep=1e-6 MaxStep=0.2
      Goal { Name="drain" Voltage= 0.7  }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }}
   Save( FilePrefix="tmp3_high" )

   Load ( FilePrefix= "tmp2_low" )
   NewCurrentFile="IdVg_low"
   Quasistationary (
      InitialStep=5e-2 Increment=1.5
      MinStep=1e-6 MaxStep=0.2
      Goal { Name="gate" Voltage= 0.7  }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }}
   
   Load ( FilePrefix= "tmp3_high" )
   NewCurrentFile="IdVg_high"
   Quasistationary (
      InitialStep=5e-2 Increment=1.5
      MinStep=1e-6 MaxStep=0.2
      Goal { Name="gate" Voltage= 0.7  }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }
   }
   system("rm -f tmp*") *remove the plot we dont need anymore
}