File {
  * input files:
#if @[ lsearch {DD3 DD3cal} @toolname@  ]@ >= 0
  Grid=   "n@node|sprocess@_e_fps.tdr"
#elif @[ lsearch {qcClassDD3 MC3} @toolname@  ]@ >= 0
  Grid=   "n@node|sprocess1@_mc_fps.tdr"
#else
  Grid=   "n@node|xslice@_x_msh.tdr"
#endif

#if @StressConst@ == 0 && @isStrain@
#if @[ lsearch {DD3 DD3cal} @toolname@  ]@ >= 0
  Piezo=   "n@node|sprocess@_e_fps.tdr"
#elif @[ lsearch {qcClassDD3 MC3} @toolname@  ]@ >= 0
  Piezo=   "n@node|sprocess1@_mc_fps.tdr"
#else
  Piezo=   "n@node|xslice@_x_msh.tdr"
#endif
#endif

  * output files:
  Plot=   "n@node@_des.tdr"
  Current="@plot@"
  Output= "@log@"
  Parameter=   "@parameter@"
#if @[ lsearch {DD ClassDD} @toolname@  ]@ >= 0
  NonLocalPlot=   "n@node@_nonlocal.plt"
#elif @[ lsearch {qcClassDD3} @toolname@  ]@ >= 0
  Save=   "@save@"
#elif @[ lsearch {MC3} @toolname@  ]@ >= 0
  Load=  "n@node|qcClassDD3@_des.sav"
  MonteCarloOut = "n@node@_mc"
#endif
  PMIPath="."
}

Thermode {
  { Name="gate"       Temperature=300 }
#if @[ lsearch {DD3 DD3cal qcClassDD3 MC3} @toolname@  ]@ >= 0
  { Name="drain"      Temperature=300 }
  { Name="source"     Temperature=300 }
#endif
  { Name="substrate"  Temperature=300 }
}

Electrode {
  { Name="gate"        Voltage=_Vg0_ }
#if @[ lsearch {DD3 DD3cal} @toolname@  ]@ >= 0
  { Name="drain"       Voltage=0.0   Resist=@<100.0*2.0/0.024>@ } 
  { Name="source"      Voltage=0.0   Resist=@<100.0*2.0/0.024>@ } 
#endif
#if @[ lsearch {qcClassDD3} @toolname@  ]@ >= 0
  { Name="drain"       Voltage=0.0   Resist=@<100.0*1.0/0.024>@ } 
  { Name="source"      Voltage=0.0   Resist=@<100.0*1.0/0.024>@ } 
#endif
#if @[ lsearch {MC3} @toolname@  ]@ >= 0
  { Name="drain"       Voltage=@VDRAIN@  Resist=@<100.0*1.0/0.024>@ } 
  { Name="source"      Voltage=0.0   Resist=@<100.0*1.0/0.024>@ } 
#endif
  { Name="substrate"   Voltage=0.0 } 
}
