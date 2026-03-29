#setdep @node|svisual@

#if @<abs(VDRAIN) <= 0.1>@   
#define _K0_      20.0
#endif
#define _Kmin_     1.0
#define _Kmax_    100.0

#if "@Type@" == "nMOS"
 #if @<GeMoleCh == 0.00>@
  #if @<abs(VDRAIN) > 0.1>@  
   #define _K0_     10.228
  #endif
  #define _V0_      1.07e7
  #define _Vmin_    1.07e7
  #define _Vmax_    3.00e7
 #elif @<GeMoleCh == 0.50>@
  #if @<abs(VDRAIN) > 0.1>@  
   #define _K0_      7.814
  #endif
  #define _V0_      0.29e7
  #define _Vmin_    0.29e7
  #define _Vmax_    2.00e7
 #elif @<GeMoleCh == 1.00>@
  #if @<abs(VDRAIN) > 0.1>@  
   #define _K0_      61.705
  #endif
  #define _V0_      0.65e7
  #define _Vmin_    0.65e7
  #define _Vmax_    5.00e7
 #endif
#elif "@Type@" == "pMOS"
 #if @<GeMoleCh == 0.00>@
  #if @<abs(VDRAIN) > 0.1>@  
   #define _K0_     8.129
  #endif
  #define _V0_      0.84e7
  #define _Vmin_    0.84e7
  #define _Vmax_    3.00e7
 #elif @<GeMoleCh == 0.50>@
  #if @<abs(VDRAIN) > 0.1>@  
   #define _K0_      14.287
  #endif
  #define _V0_      0.71e7
  #define _Vmin_    0.71e7
  #define _Vmax_    4.00e7
 #elif @<GeMoleCh == 1.00>@
  #if @<abs(VDRAIN) > 0.1>@  
   #define _K0_      14.697
  #endif
  #define _V0_      0.60e7
  #define _Vmin_    0.60e7
  #define _Vmax_    5.00e7
 #endif
#endif

#if "@Type@" == "nMOS"
#define _Kbal_    "k_e"
#define _HFmodel_ "HighFieldDependence_electron"
#elif "@Type@" == "pMOS"
#define _Kbal_    "k_h"
#define _HFmodel_ "HighFieldDependence_hole"
#endif

#if @<GeMoleCh == 0.00>@
#define _Vbal_    "vsat0(0)"
#elif @<GeMoleCh == 0.50>@
#define _Vbal_    "vsat0(5)"
#elif @<GeMoleCh == 1.00>@
#define _Vbal_    "vsat0(10)"
#endif

#define _WF_      @WF@
#define _Vd_      @VDRAIN@
#define _Vg0_     @VGATE@
#define _Vg1_     0

#if "@Type@" == "nMOS"
#define _QC_      eQuantumPotential
#define _QCo_     eQuantumPotential(AutoOrientation Density)
#define _CAR_     Electron

#elif "@Type@" == "pMOS"
#define _QC_      hQuantumPotential
#define _QCo_     hQuantumPotential(AutoOrientation Density)
#define _CAR_     Hole

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

CurrentPlot {
Material="SiliconGermanium" Model="BALMob" Parameter=_Kbal_
Material="SiliconGermanium" Model=_HFmodel_ Parameter=_Vbal_
}

#include "Math_des.cmd"

Solve {
*- Creating initial guess:
   Coupled(Iterations=100 LineSearchDamping=1e-4) { Poisson Contact }
   Coupled(Iterations=100 LineSearchDamping=1e-4) { Poisson _QC_ Contact }
   Coupled(Iterations=100) { Poisson _QC_ Contact }

   NewCurrentFile="IdVd_"
   Quasistationary (
      DoZero
      InitialStep=1e-2 Increment=1.5
      MinStep=1e-6 MaxStep=0.1
      Goal { Name="drain" Voltage= _Vd_ }
   ){ Coupled { Poisson _CAR_ _QC_ Contact } }

   *- Move to the nominal balistic mobility & vsat0 
#if @<abs(VDRAIN) > 0.1>@    
   NewCurrentFile=""
   Quasistationary (
      DoZero
      InitialStep=0.1 Increment=2.0
      MinStep=1e-6 MaxStep=0.2
      goal { Material="SiliconGermanium" Model="BALMob" Parameter=_Kbal_ Value= _K0_ }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }
   }
   
   *- Move to the minimum vsat0 
   Quasistationary (
      DoZero
      InitialStep=0.1 Increment=2.0
      MinStep=1e-6 MaxStep=0.2
      goal { Material="SiliconGermanium" Model=_HFmodel_ Parameter=_Vbal_ Value= _Vmin_ }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }
   }  
   *- Sweep from vsat0_min to vsat0_max
   NewCurrentFile="Id_Vcal_"
   Quasistationary (
      DoZero
      InitialStep=1e-3 Increment=1.2
      MinStep=1e-6 MaxStep=0.05
      goal { Material="SiliconGermanium" Model=_HFmodel_ Parameter=_Vbal_ Value= _Vmax_ }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }
   }    
    
#else

   *- Move to the minimum balistic mobility 
   Quasistationary (
      DoZero
      InitialStep=0.1 Increment=2.0
      MinStep=1e-6 MaxStep=0.5
      goal { Material="SiliconGermanium" Model="BALMob" Parameter=_Kbal_ Value= _Kmin_ }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }
   }   
   *- Sweep from Kmin to Kmax
   NewCurrentFile="Id_Kcal_"
   Quasistationary (
      DoZero
      InitialStep=0.1 Increment=2.0
      MinStep=1e-6 MaxStep=0.05
      goal { Material="SiliconGermanium" Model="BALMob" Parameter=_Kbal_ Value= _Kmax_ }
   ){ Coupled { Poisson _CAR_ _QC_ Contact }
   }         

#endif        
}


