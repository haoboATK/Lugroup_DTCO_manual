
Math {

  CoordinateSystem { UCS }
  -CheckUndefinedModels
  Surface "S1" ( MaterialInterface="HfO2/InterfacialOxide")
  AutoOrientationSmoothingDistance = -1
  GeometricDistances

#if @[ lsearch {DD3 DD3cal} @toolname@  ]@ >= 0
  ThinLayer( Mirror = ( None Min None ) )
#endif

#if @[ lsearch {MC3} @toolname@  ]@ >= 0
  Extrapolate
  Derivative
  Method=PARDISO
  RhsMin = 1e-12
  Iterations=100 
  LineSearchDamping=1e-4
#else
  Extrapolate
  Derivative
  Method=ILS
  RhsMin = 1e-12
  Iterations=20

  ILSrc =
  "set(1){
    iterative(gmres(1000), tolrel=1e-10, tolunprec=1e-8, tolabs=0, maxit=200);
    preconditioning(ilut(0.001,-1),left);
    ordering ( symmetric=nd, nonsymmetric=mpsilst );
    options( compact=yes, linscale=0, refineresidual=8, verbose=0); };  "

#endif

  wallclock
  ExitOnFailure

  Number_of_Threads = @Threads@ 
#if @[ lsearch {MC3} @toolname@  ]@ >= 0
   ParallelLicense (Wait)
#endif

*  TensorGridAniso(Aniso)    
}

