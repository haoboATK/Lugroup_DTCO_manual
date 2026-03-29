#setdep @node|sprocess@

#define _StressDebug_ 0

#set SlFin_Pa    x
#set SwFin_Pa    x
#set ShFin_Pa    x

load_file n@node|-1@_e_fps.tdr
create_plot -dataset n@node|-1@_e_fps
select_plots {Plot_n@node|-1@_e_fps}

set x0 @<-0.5*L>@ 
set x1 @<0.5*L>@ 
set y0 @<-0.5*Wbottom>@ 
set y1 @<0.5*Wbottom>@ 
set z0 @<-1.0*H>@ 
set z1 0.0

set tSxx [integrate_field -field StressEL-XX -regions {ChFin} -window {0 @<-0.5*Wbottom>@ @<-0.5*L>@ @H@ @<0.5*Wbottom>@ @<0.5*L>@}]
set tSyy [integrate_field -field StressEL-YY -regions {ChFin} -window {0 @<-0.5*Wbottom>@ @<-0.5*L>@ @H@ @<0.5*Wbottom>@ @<0.5*L>@}]
set tSzz [integrate_field -field StressEL-ZZ -regions {ChFin} -window {0 @<-0.5*Wbottom>@ @<-0.5*L>@ @H@ @<0.5*Wbottom>@ @<0.5*L>@}]

set tV [integrate_field -returndomain -regions {ChFin} -window {0 @<-0.5*Wbottom>@ @<-0.5*L>@ @H@ @<0.5*Wbottom>@ @<0.5*L>@}]

puts "DOE: SlFin_Pa [format %.3e [expr ($tSzz/$tV/1.0e0)]]"
puts "DOE: SwFin_Pa [format %.3e [expr ($tSyy/$tV/1.0e0)]]"
puts "DOE: ShFin_Pa [format %.3e [expr ($tSxx/$tV/1.0e0)]]"

remove_plots {Plot_n@node|-1@_e_fps}


#if _StressDebug_

#set SlFin_SRB_Pa		x
#set SlFin_SDetch_Pa		x
#set SlFin_Doping_Pa		x
#set SlFin_GateRemoval_Pa	x
#set SlFin_MG_Pa		x
#set SlFin_profile_q_Pa		x

set Steps [list "SRB" "SDetch" "Doping" "GateRemoval" "MG" "profile_q"]

foreach s $Steps {

load_file n@node|-1@_${s}_fps.tdr
create_plot -dataset n@node|-1@_${s}_fps
select_plots [list Plot_n@node|-1@_${s}_fps]

set tSxx [integrate_field -field StressEL-XX -regions {ChFin} -window {0 @<-0.5*Wbottom>@ @<-0.5*L>@ @H@ @<0.5*Wbottom>@ @<0.5*L>@}]
set tSyy [integrate_field -field StressEL-YY -regions {ChFin} -window {0 @<-0.5*Wbottom>@ @<-0.5*L>@ @H@ @<0.5*Wbottom>@ @<0.5*L>@}]
set tSzz [integrate_field -field StressEL-ZZ -regions {ChFin} -window {0 @<-0.5*Wbottom>@ @<-0.5*L>@ @H@ @<0.5*Wbottom>@ @<0.5*L>@}]

create_field -name Unity -function "(<X>*0.0)+1.0" -show
set tV [integrate_field -field Unity -regions {ChFin} -window {0 @<-0.5*Wbottom>@ @<-0.5*L>@ @H@ @<0.5*Wbottom>@ @<0.5*L>@}]

puts "DOE: SlFin_${s}_Pa [format %.2e [expr ($tSzz/$tV/1.0e0)]]"
#puts "DOE: SwFin_${s}_Pa [format %.2e [expr ($tSyy/$tV/1.0e0)]]"
#puts "DOE: ShFin_${s}_Pa [format %.2e [expr ($tSxx/$tV/1.0e0)]]"

remove_plots [list Plot_n@node|-1@_${s}_fps]
}

#endif
