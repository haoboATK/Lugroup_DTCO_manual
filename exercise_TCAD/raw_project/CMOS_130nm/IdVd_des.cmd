#if @IdVd@ == 0
#noexec
#endif

#-- NMOS Specification
#if [string match "NMOS" @Domain@]
#define _Device_ nmos
#define _CAR_    Electron
#define _cTemp_  eTemperature
#define _IALM_   IALMob(AutoOrientation)
#define _DG_     eQuantumPotential
#define _QC_     eQuantumPotential(AutoOrientation density)
#define _Vdd_    @Vdd@	

#-- PMOS Specfication
#elif [string match "PMOS" @Domain@]
#define _Device_ pmos
#define _CAR_    Hole
#define _cTemp_  hTemperature
#define _IALM_   IALMob(AutoOrientation PhononCombination=2)
#define _DG_     hQuantumPotential
#define _QC_     hQuantumPotential(AutoOrientation density)
#define _Vdd_    @<-1*Vdd>@
#endif


File {
  Grid      = "@tdr@"
  Piezo     = "@tdr@"
  Parameter = "@parameter@"
  Plot      = "@tdrdat@"
  Current   = "@plot@"
  Output    = "@log@"
  
}

Electrode {
   { Name= "source"    Voltage= 0.0 Resistor= 40 }
   { Name= "drain"     Voltage= 0.0 Resistor= 40 }
   { Name= "gate"      Voltage= 0.0 }
   { Name= "substrate" Voltage= 0.0 }
}


Physics {
   Fermi
   Hydrodynamic( _cTemp_ )   
}

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
  eTemperature hTemperature Temperature 
  ElectricField/Vector Potential SpaceCharge
  Doping DonorConcentration AcceptorConcentration
  SRH Band2Band 
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
  Digits= 5  
  Notdamped= 100
  Iterations= 50
  ExitOnFailure
  TensorGridAniso
  StressMobilityDependence = TensorFactor
  * Please uncomment if you have 8 CPUs or more
  Number_of_Threads= 8
   
}

Solve {
*- Creating initial guess:
   Coupled(Iterations= 1000 LineSearchDamping= 1e-8){ Poisson _DG_ } 
   Coupled { Poisson _CAR_ _DG_ }

#-- Ramp gate to Vdd/2
  Quasistationary( 
    InitialStep= 1e-2 Increment= 1.45
    MinStep= 1e-6 MaxStep= 0.05 
    Goal { Name= "gate" Voltage= @Vg1@ } 
  ){ Coupled { Poisson _CAR_ _DG_} }
  Save ( FilePrefix= "n@node@_Vg1" )

  #-- Ramp gate to Vdd 
  Quasistationary( 
    InitialStep= 1e-2 Increment= 1.45
    MinStep= 1e-6 MaxStep= 0.05 
    Goal { Name= "gate" Voltage= @Vg2@ } 
  ){ Coupled { Poisson _CAR_ _DG_ } }
  Save ( FilePrefix= "n@node@_Vg2" )

  #-- Vd sweep for Vg=Vdd/2
  NewCurrentFile= "IdVd_Vg1" 
  Load ( FilePrefix= "n@node@_Vg1" )
  Quasistationary( 
    DoZero 
    InitialStep= 1e-2 Increment= 1.45
    MinStep= 1e-8 MaxStep= 0.05 
    Goal { Name= "drain" Voltage= _Vdd_ } 
  ){ Coupled { Poisson _CAR_ _DG_ _cTemp_ } }

  #-- Vd sweep for Vg=Vdd
  NewCurrentFile= "IdVd_Vg2" 
  Load ( FilePrefix= "n@node@_Vg2" )
  Quasistationary( 
    DoZero 
    InitialStep= 1e-2 Increment= 1.45
    MinStep= 1e-8 MaxStep= 0.05
    Goal { Name= "drain" Voltage= _Vdd_ } 
  ){ Coupled { Poisson _CAR_ _DG_ _cTemp_ } }
  
}

