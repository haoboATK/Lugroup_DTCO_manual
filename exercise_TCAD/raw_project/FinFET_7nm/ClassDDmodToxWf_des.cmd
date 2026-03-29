#setdep @node|iClassDDmodTox@


#define _Vd_      @VDRAIN@
#define _Vg_      @VGATE@
#define _Vg0_     0.0
#define _Vg1_     @VGATE@

#define _QC_      
#define _QCo_     
#define _CAR_     

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

   NewCurrentFile="IdVg_"
   Quasistationary (
      DoZero
      InitialStep=1e-2 Increment=1.5
      MinStep=1e-6 MaxStep=0.05
      Goal { Name="gate" Voltage= _Vg1_  }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }
      CurrentPlot( Time=(Range=(0 1) Intervals=50) )
   }
}

