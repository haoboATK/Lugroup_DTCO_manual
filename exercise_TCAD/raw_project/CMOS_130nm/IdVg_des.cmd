#if @IdVg@ == 0
#noexec
#endif

#-- NMOS Specification
#if [string match "NMOS" @Domain@]
#define _Device_ nmos
#define _CAR_    Electron
#define _IALM_   IALMob(AutoOrientation)
#define _DG_     eQuantumPotential
#define _QC_     eQuantumPotential(AutoOrientation density)

#define _Vdd_    @Vdd@	
#define _VdLin_  0.05
#define _VdSat_  @Vdd@

#-- PMOS Specfication
#elif [string match "PMOS" @Domain@]
#define _Device_ pmos
#define _CAR_    Hole
#define _IALM_   IALMob(AutoOrientation PhononCombination=2)
#define _DG_     hQuantumPotential
#define _QC_     hQuantumPotential(AutoOrientation density)

#define _Vdd_    @<-1*Vdd>@
#define _VdLin_  -0.05
#define _VdSat_  @<-1*Vdd>@

#endif


File {
  Grid      = "n@previous@_fps.tdr"
  
  Parameter = "@parameter@"
  Plot      = "@tdrdat@"
  Current   = "@plot@"
  Output    = "@log@"
  
}

Electrode {
  { Name="source"    Voltage=0.0 }
  { Name="drain"     Voltage=0.0 }
  { Name="gate"      Voltage=0.0 }
  { Name="substrate" Voltage=0.0 }
}

Physics {Fermi}

Physics (Material= Silicon) {
	_QC_
	Mobility (
	  Enormal (_IALM_) 
	  HighFieldSaturation
	)
      Recombination(SRH)
      EffectiveIntrinsicDensity(OldSlotboom)
      
}


Plot{
  eDensity hDensity
  TotalCurrent/Vector eCurrent/Vector hCurrent/Vector
  eMobility hMobility
  eVelocity hVelocity
  eQuasiFermi hQuasiFermi
  eTemperature Temperature * hTemperature
  ElectricField/Vector Potential SpaceCharge
  Doping DonorConcentration AcceptorConcentration
  SRH Band2Band * Auger
  AvalancheGeneration eAvalancheGeneration hAvalancheGeneration
  eGradQuasiFermi/Vector hGradQuasiFermi/Vector
  eEparallel hEparallel eENormal hENormal
  BandGap 
  BandGapNarrowing
  Affinity
  ConductionBand ValenceBand
  eBarrierTunneling hBarrierTunneling * BarrierTunneling
  eTrappedCharge  hTrappedCharge
  eGapStatesRecombination hGapStatesRecombination
  eDirectTunnel hDirectTunnel
  
}

Math {
  Extrapolate
  Derivatives
  RelErrControl
  Digits=5
  RHSmin=1e-10
  Notdamped=100
  Iterations=50
  DirectCurrent
  ExitOnFailure
  TensorGridAniso
  StressMobilityDependence= TensorFactor 
  * Please uncomment if you have 8 CPUs or more
  NumberOfThreads= 8
  
}

Solve {
  Coupled ( Iterations=100 LineSearchDamping=1e-8 ){ Poisson _DG_ }
  Coupled { Poisson _CAR_ _DG_ }
  Save ( FilePrefix="n@node@_init" )
  #-- Ramp drain to VdLin
  Quasistationary( 
    InitialStep=1e-2 Increment=1.5 
    MinStep=1e-6 MaxStep=0.5 
    Goal { Name="drain" Voltage=_VdLin_ } 
  ){ Coupled { Poisson _CAR_ _DG_ } }
  Save ( FilePrefix="n@node@_VdLin" )

  #-- Ramp drain to VdSat
  Load ( FilePreFix="n@node@_init" )
  Quasistationary( 
    InitialStep=1e-2 Increment=1.5 
    MinStep=1e-6 MaxStep=0.5 
    Goal { Name="drain" Voltage=_VdSat_ } 
  ){ Coupled { Poisson _CAR_ _DG_ } }
  Save ( FilePrefix="n@node@_VdSat" )

  #-- Vg sweep for Vd=VdLin
  NewCurrentFile="IdVg_VdLin_" 
  Load ( FilePrefix = "n@node@_VdLin" )
  Quasistationary( 
    DoZero 
    InitialStep=1e-2 Increment=1.2 
    MinStep=1e-8 MaxStep=0.05 
    Goal { Name="gate" Voltage=_Vdd_ } 
  ){ Coupled { Poisson _CAR_ _DG_ } }

  #-- Vg sweep for Vd=VdSat
  NewCurrentFile="IdVg_VdSat_" 
  Load ( FilePrefix="n@node@_VdSat" )
  Quasistationary( 
    DoZero 
    InitialStep=1e-2 Increment=1.2 
    MinStep=1e-8 MaxStep=0.05 
    Goal { Name="gate" Voltage=_Vdd_ } 
  ){ Coupled { Poisson _CAR_ _DG_ } }
}

