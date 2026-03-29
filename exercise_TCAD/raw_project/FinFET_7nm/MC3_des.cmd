#setdep @node|qcClassDD3@

#define _Vd_      @VDRAIN@
#define _Vg0_     @VGATE@
#if @< abs(VDRAIN)>0.5 >@
#define _Vg1_     @<0.5*VT0>@
#else
#define _Vg1_     @<0.75*VT0>@
#endif

#if "@Type@" == "nMOS"
#define _QC_      eQuantumPotential
#define _QCo_     eQuantumPotential(AutoOrientation Density)
#define _CAR_     Electron
#define _CT_      electrons
#define _WF_      @<WF+dVT>@

#elif "@Type@" == "pMOS"
#define _QC_      hQuantumPotential
#define _QCo_     hQuantumPotential(AutoOrientation Density)
#define _CAR_     Hole
#define _CT_      holes
#define _WF_      @<WF-dVT>@

#else
puts "Type is incorrect... @Type@"
#endif

#if "@cDir@" == "110"
#define _RelChDir_    RelChDir110

#elif "@cDir@" == "100"
#define _RelChDir_   -RelChDir110

#endif

#include "Init_des.cmd"

MonteCarlo {
  ReadInStress
  HighKModus = 2
  NintHighK = 2.0e12
#if "@Type@" == "nMOS"
  SO1Factor = 0.01
  SO2Factor = 0.01
  SO3Factor = 0.01
  RCSHighKFactor = 0.03
#else
  SO1Factor = 0.03
  SO2Factor = 0.03
  SO3Factor = 0.03
  RCSHighKFactor = 0.08
#endif
  CarrierType = _CT_
*  MCElementJump = 0.05
  SurfScattRatio = @SurfScatt@
  xGe = @<GeMoleCh*100.0>@
*  MCStrain = (0.0,0.0,0.0,0.0,0.0,0.0)
  CurrentErrorBar = 2.5
  MinCurrentComput = 8
  DrainContact = "drain"
*  SelfConsistent(FrozenQF)
  SelfConsistent(Coupled{Poisson Contact})
*  Window = Cuboid[ (-1.0,-1.5,-1.0) (@<2.0*H>@, 1.5, 1.0) ]
  Window = Cuboid[ (-1.0,-1.5,-1.0) (2.0, 1.5, 1.0) ]
#if @< abs(VDRAIN)>0.1 >@
  FinalTime = @<(40.0e-6*L*25)/100*10>@
#else
  FinalTime = @<(40.0e-6*L*25)/100*6>@
#endif
 Plot { Range=(0,@<40.0e-6*L*25>@) intervals = 100 }
}

#include "Physics_des.cmd"

#include "Plot_des.cmd"

#include "Math_des.cmd"

solve {
         Coupled(Iterations=100 LineSearchDamping=1e-4){ poisson }
         Coupled(Iterations=100 LineSearchDamping=1e-4){ poisson _QC_ }
*         Coupled(Iterations=100 LineSearchDamping=1e-4){ poisson _CAR_ }        
         montecarlo
         plot(fileprefix="n@node@_mc" overwrite)
}

