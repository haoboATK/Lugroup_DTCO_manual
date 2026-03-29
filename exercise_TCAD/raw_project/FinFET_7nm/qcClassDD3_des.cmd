#setdep @node|iClassDDmodTox@ && @node|sprocess1@

#define _Vd_      @VDRAIN@
#define _Vg_      @VGATE@
#if @DDIdVg@== 1 && "@Type@" == "nMOS"
#define _Vg0_    -0.01
#define _Vg1_     @VGATE@
#elif @DDIdVg@== 1 && "@Type@" == "pMOS"
#define _Vg0_     0.01
#define _Vg1_     @VGATE@
#else
#define _Vg0_     @VGATE@
#define _Vg1_     0.0
#endif

#if "@Type@" == "nMOS"
#define _QC_      eQuantumPotential
#define _QCo_     eQuantumPotential(AutoOrientation Density)
#define _CAR_     Electron
#define _WF2_     @<WF+dVT+dVT2>@

#elif "@Type@" == "pMOS"
#define _QC_      hQuantumPotential
#define _QCo_     hQuantumPotential(AutoOrientation Density)
#define _CAR_     Hole
#define _WF2_     @<WF-dVT-dVT2>@

#else
puts "Type is incorrect... @Type@"
#endif

#if "@cDir@" == "110"
#define _RelChDir_    RelChDir110

#elif "@cDir@" == "100"
#define _RelChDir_   -RelChDir110

#endif

#include "Init_des.cmd"

#include "Physics_des.cmd"

#include "Plot_des.cmd"

#include "Math_des.cmd"

Solve {
*- Creating initial guess:
   Coupled(Iterations=100 LineSearchDamping=1e-4) { Poisson _QC_ Contact }
   Coupled(Iterations=100) { Poisson _QC_ Contact }

   NewCurrentFile="IdVd_"
   Quasistationary (
      DoZero
      InitialStep=1e-2 Increment=1.5
      MinStep=1e-6 MaxStep=0.1
      Goal { Name="drain" Voltage= _Vd_ }
   ){ Coupled { Poisson _CAR_ _QC_ Contact } }

#if @DDIdVg@ == 1
   NewCurrentFile="IdVg_"
   Quasistationary (
      DoZero
      InitialStep=1e-2 Increment=1.5
      MinStep=1e-6 MaxStep=0.2
      Goal { Name="gate" Voltage= @VT0@  }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }
   }
   Quasistationary (
*      DoZero
      InitialStep=5e-2 Increment=1.5
      MinStep=1e-6 MaxStep=0.2
      Goal { Name="gate" Voltage= _Vg1_  }
      Goal { Material="TiNitride" Model="Bandgap" Parameter="WorkFunction" Value= _WF2_ }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }
   }
#endif
}

