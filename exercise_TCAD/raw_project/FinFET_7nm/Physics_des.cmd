#if @[ lsearch {qcClassDD3 MC3 DD3 DD3cal} @toolname@  ]@ >= 0
  #if "@Type@" == "nMOS"
#define _QCa_     Aniso(eQuantumPotential(Direction(SimulationSystem)=(0,0,1)))
  #else
#define _QCa_     Aniso(hQuantumPotential(Direction(SimulationSystem)=(0,0,1)))
  #endif
#endif

Physics {
#if @[ lsearch {DD3 DD3cal} @toolname@  ]@ >= 0
AreaFactor=@<2.0/0.024>@
#else
AreaFactor=@<1.0/0.024>@
#endif

  EffectiveIntrinsicDensity( BandGapNarrowing( OldSlotBoom ) NoFermi )
  Mobility (
#if @[ lsearch {qcClassDD3 MC3 DD3 DD3cal} @toolname@  ]@ >= 0
    DopingDependence( BALMob( Lch=@<L*1e3>@ ) )
#endif
    Enormal( RPS InterfaceCharge(SurfaceName="S1") )
    ThinLayer(IALMob( AutoOrientation ))
    HighFieldSaturation
  )
  Recombination ( SRH(DopingDep) Auger Band2Band ( Model = Hurkx ) )

#if @isStrain@
  Piezo(
#if @StressConst@ == 1 || @[ lsearch {MC3} @toolname@  ]@ >= 0
    Stress=(@ShFin_Pa@, @SwFin_Pa@, @SlFin_Pa@, 0.0, 0.0, 0.0)
#endif
    Model(
          DeformationPotential(ekp hkp minimum)
          DOS(eMass hMass)
#if "@Type@" == "nMOS"
          Mobility( efactor(kanda sfactor=SBmob(Type=0) ApplyToMobilityComponents )
                   eSaturationFactor = 0.20
          )
#else
          Mobility( hfactor(kanda sfactor=SBmob(Type=1) ApplyToMobilityComponents )
                   hSaturationFactor = 0.27
          )
#endif
    )
  )
#endif
}

#if @[ lsearch {DD3 DD3cal} @toolname@  ]@ >= 0
Physics(Region="ChFin") { 
 _QCo_ 
 _QCa_ 
}
Physics(Region="ChStop") { 
 _QCo_ 
 _QCa_ 
}
Physics(Region="SDE.1") { 
 _QCo_ 
 _QCa_ 
}
Physics(Region="SDE.2") { 
 _QCo_ 
 _QCa_ 
}
Physics(Region="SDepi.1") { 
 _QCo_ 
 _QCa_ 
}
Physics(Region="SDepi.2") { 
 _QCo_ 
 _QCa_ 
}
#elif @[ lsearch {qcClassDD3 MC3} @toolname@  ]@ >= 0
Physics(Region="ChStop") { 
 _QCo_ 
 _QCa_ 
}
Physics(Region="SDE.1") { 
 _QCo_ 
 _QCa_ 
}
Physics(Region="SDE.2") { 
 _QCo_ 
 _QCa_ 
}
Physics(Region="SDepi.1") { 
 _QCo_ 
 _QCa_ 
}
Physics(Region="SDepi.2") { 
 _QCo_ 
 _QCa_ 
}
#elif @[ lsearch {DD} @toolname@  ]@ >= 0
Physics(Region="ChFin") { _QCo_ }
Physics(Region="ChStop") { _QCo_ }
#endif

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

#if @[ lsearch {DD ClassDD} @toolname@  ]@ >= 0
Math(Material="InterfacialOxide") {NonLocal(-Transparent)}
Math(RegionInterface="Gateoxide1.2/ChFin") {
    NonLocal (
        Length=@<0.5*0.5*(Wtop+Wbottom)*1.e3*1.e-7>@
        Permeation=@<0.006/100.*1.e3*1.e-7>@
        Direction=(@<(0.5*(Wbottom-Wtop)/H)>@ -1 0)
        MaxAngle=1.e-5
        -Outside
    )
}
Math(RegionInterface="TopGateoxide1/ChFin") {
    NonLocal (
        Length=@<H*1.e3*1.e-7>@
        Permeation=@<0.006/100.*1.e3*1.e-7>@
        Direction=(1 0 0)
        MaxAngle=1.e-5
        -Outside
    )
}
#endif
