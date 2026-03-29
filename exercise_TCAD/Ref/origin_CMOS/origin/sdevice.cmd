
sdevice_init {
	File {
	  Grid      = "11_fps.tdr"
	  Parameter = "sdevice"
	  Current   = "sdevice"
	  Output    = "sdevice"
	}

	Electrode {
	  { Name="source"    Voltage=0.0 }
	  { Name="drain"     Voltage=0.0 }
	  { Name="gate"      Voltage=0.0 }
	  { Name="substrate" Voltage=0.0 }
	}

	Physics {Fermi}

	Physics (Material= Silicon) {
		eQuantumPotential(AutoOrientation density)
		Mobility (
		  Enormal (IALMob(AutoOrientation)) 
		  HighFieldSaturation
		)
	      Recombination(SRH)
	      EffectiveIntrinsicDensity(OldSlotboom)
	      
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
}

sdevice_solve {
	Solve {
	  Coupled ( Iterations=100 LineSearchDamping=1e-8 ){ Poisson eQuantumPotential }
	  Coupled { Poisson Electron eQuantumPotential }
	}
}

# =========================
#   Tcl Block: Substrate Bias Sweep
# =========================
set num 20
set VG 1.4
set VD 1.4

for {set i 1} {$i <= $num} {incr i} {
	set VG_expr  [expr $VG/$num*$i]
	sdevice_solve "
			Solve {
				Quasistationary(
				  InitialStep=1e-1 Increment=1.2
				  Minstep=1e-5 MaxStep=0.1
				  Goal{ Name=\"gate\" Voltage= $VG_expr }
				){ Coupled{ Poisson Electron eQuantumPotential }} 
				Save( FilePrefix=\"VGg_${i}\" )
			      }
	             "
}

# =========================
#   Tcl Block: drain Bias Sweep
# =========================

for {set i 1} {$i <= $num} {incr i} {
	set VG_expr [expr $VG/$num*$i]
	sdevice_solve "
			Solve {
				NewCurrentFile= \"VG_${i}\"
				Load( FilePrefix=\"VGg_${i}\" )
				Quasistationary(
				  DoZero
				  InitialStep=1e-1 Increment=1.2
				  Minstep=1e-5 MaxStep=0.1
				  Goal{ Name=\"drain\" Voltage= $VD}
				){ Coupled{ Poisson Electron eQuantumPotential }
				   CurrentPlot(Time=(Range= (0 1) intervals= 20))
				 }
			      }
		      " 
}	

for {set i 1} {$i <= $num} {incr i} {
    set proj_name "proj_$i"
    set curve_name "mycurve_$i"

    proj_load "VG_${i}sdevice_des.plt" $proj_name
    cv_create $curve_name "$proj_name drain OuterVoltage" "$proj_name drain TotalCurrent"
    cv_write csv "VG_${i}.csv" $curve_name
    cv_delete $curve_name

}


# save final plot file
sdevice_finish

exit

