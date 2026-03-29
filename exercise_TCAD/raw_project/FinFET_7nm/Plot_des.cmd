#if @[ lsearch {DD ClassDD} @toolname@  ]@ >= 0
NonLocalPlot((@<0.5*H>@ 0 0) (0 0 0)) { _CD_ }
#endif

CurrentPlot {
#if @[ lsearch {qcClassDD3 MC3 DD3 DD3cal} @toolname@  ]@ >= 0
  DonorConcentration(Integrate(Window[(0.0 @<-0.5*Wbottom>@ -0.0005) (@H@ @<0.5*Wbottom>@ 0.0005)]))
  AcceptorConcentration(Integrate(Window[(0.0 @<-0.5*Wbottom>@ -0.0005) (@H@ @<0.5*Wbottom>@ 0.0005)]))
  eDensity(Integrate(Window[(0.0 @<-0.5*Wbottom>@ -0.0005) (@H@ @<0.5*Wbottom>@ 0.0005)]))
  hDensity(Integrate(Window[(0.0 @<-0.5*Wbottom>@ -0.0005) (@H@ @<0.5*Wbottom>@ 0.0005)]))
  eDensity(Integrate(Window[(0.0 @<-0.5*Wbottom>@ @<-0.5*L+0.002>@) (@H@ @<0.5*Wbottom>@ @<-0.5*L+0.003>@)]))
  hDensity(Integrate(Window[(0.0 @<-0.5*Wbottom>@ @<-0.5*L+0.002>@) (@H@ @<0.5*Wbottom>@ @<-0.5*L+0.003>@)]))
#else
  eDensity(Integrate(Region=ChFin))
  hDensity(Integrate(Region=ChFin))
#endif
}

Plot {
#if @[ lsearch {DD ClassDD} @toolname@  ]@ >= 0
  Nonlocal
#endif
  eDensity hDensity eCurrent/Vector hCurrent/Vector TotalCurrent/Vector
  Potential Electricfield/Vector Doping SpaceCharge
  eMobility hMobility eVelocity/Vector hVelocity/Vector
*  DonorConcentration Acceptorconcentration
  BandGap Affinity BandGapNarrowing EffectiveBandGap EffectiveIntrinsicDensity
  ConductionBand ValenceBand
  eQuasiFermi hQuasiFermi eGradQuasiFermi/Vector hGradQuasiFermi/Vector
*  eEparallel hEparallel eTemperature hTemperature 
*  SRH Auger Avalanche TotalTrapConcentration
  eBand2BandGeneration hBand2BandGeneration Band2BandGeneration
*  eLifetime hLifetime
*  eTrappedCharge hTrappedCharge

#if @isStrain@
  StressXX StressYY StressZZ StressXY StressYZ StressXZ
  eMobilityStressFactorXX eMobilityStressFactorYY eMobilityStressFactorZZ
  eMobilityStressFactorYZ eMobilityStressFactorXZ eMobilityStressFactorXY
  hMobilityStressFactorXX hMobilityStressFactorYY hMobilityStressFactorZZ
  hMobilityStressFactorYZ hMobilityStressFactorXZ hMobilityStressFactorXY
  eTensorMobilityFactorXX eTensorMobilityFactorYY eTensorMobilityFactorZZ
  hTensorMobilityFactorXX hTensorMobilityFactorYY hTensorMobilityFactorZZ
#endif

#if @[ lsearch {DD3 DD3cmos DD} @toolname@  ]@ >= 0
  _QC_
#endif

  xMoleFraction
  LayerThickness NearestInterfaceOrientation
*  "EparallelToInterface"/Vector
*  "NormalToInterface"/Vector

#if @[ lsearch {MC3} @toolname@  ]@ >= 0
  MCField/Vector
  eMCDensity hMCDensity
  eMCEnergy hMCEnergy
  eMCVelocity/Vector hMCVelocity/Vector
  eMCCurrent/Vector hMCCurrent/Vector
#endif
}
