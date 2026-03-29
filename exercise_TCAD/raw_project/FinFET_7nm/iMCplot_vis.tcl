#setdep @node|MC3@ && @node|MC3:+1@ && @node|MC3:+2@ && @node|MC3:+3@ && @node|MC3:+4@ && @node|MC3:+5@

#if "@Type@" == "nMOS"
#define _Title_      NFinFET
#define _Lloc_       top_left
#define _Xmin_       4.25
#define _Xmax_       4.65
#define _Ymin_       50
#define _Ymax_       250
#define _Y2min_      0
#define _Y2max_      800
#else
#define _Title_      PFinFET
#define _Lloc_       top_left
#define _Xmin_       4.4
#define _Xmax_       4.8
#define _Ymin_       100
#define _Ymax_       250
#define _Y2min_      0
#define _Y2max_      1000
#endif

#----------------------------------------------------------------------#
load_library extract
lib::SetInfoDef 1
#----------------------------------------------------------------------#
set N @node@
set TargetType @Type@
set Types   [list @Type:+1@ @Type:+3@ @Type:+5@]

set xGes     [list @<100*GeMoleCh>@ @<100*GeMoleCh:+2>@ @<100*GeMoleCh:+4>@]
set IlinDDs   [list @IDLIN_uA@ @IDLIN_uA:+2@ @IDLIN_uA:+4@]
set IsatDDs   [list @IDSAT_uA:+1@ @IDSAT_uA:+3@ @IDSAT_uA:+5@]
set IoffDDs   [list @IOFF_nA:+1@ @IOFF_nA:+3@ @IOFF_nA:+5@]
set IlinMCs   [list @IDLIN_3DMC_uA@ @IDLIN_3DMC_uA:+2@ @IDLIN_3DMC_uA:+4@]
set IsatMCs   [list @IDSAT_3DMC_uA:+1@ @IDSAT_3DMC_uA:+3@ @IDSAT_3DMC_uA:+5@]

set Conditions(Target,1) $TargetType
set Conditions(Values,1) $Types

create_plot -1d -name Plot_Id
select_plots Plot_Id
set_plot_prop -show_title -show_legend \
        -title _Title_ -title_font_size 26 -title_font_att bold

set Conditions(Target,1) $TargetType
set Conditions(Values,1) $Types

echo "Plotting IdLinDD Vs xGe"
ext::FilterTable out= xGeIlinDD x= $xGes y= $IlinDDs conditions= Conditions ncond= 1
create_variable -name xGe -dataset IlinDDxGe -values $xGeIlinDD(X)
create_variable -name IlinDD -dataset IlinDDxGe -values $xGeIlinDD(Y)
create_curve -name IlinDD -dataset IlinDDxGe -axisX "xGe" -axisY "IlinDD"
set_curve_prop IlinDD -label "Ilin - DD" -color blue -line_style solid -line_width 3

echo "Plotting IdLinMC Vs xGe"
ext::FilterTable out= xGeIlinMC x= $xGes y= $IlinMCs conditions= Conditions ncond= 1
create_variable -name xGe -dataset IlinMCxGe -values $xGeIlinMC(X)
create_variable -name IlinMC -dataset IlinMCxGe -values $xGeIlinMC(Y)
create_curve -name IlinMC -dataset IlinMCxGe -axisX "xGe" -axisY "IlinMC"
set_curve_prop IlinMC -label "Ilin - MC" -color green -line_style solid -line_width 3 \
               -hide_line -show_markers -markers_type diamond -markers_size 10
        
echo "Plotting IdSatDD Vs xGe"
ext::FilterTable out= xGeIsatDD x= $xGes y= $IsatDDs conditions= Conditions ncond= 1
create_variable -name xGe -dataset IsatDDxGe -values $xGeIsatDD(X)
create_variable -name IsatDD -dataset IsatDDxGe -values $xGeIsatDD(Y)
create_curve -name IsatDD -dataset IsatDDxGe -axisX "xGe" -axisY "IsatDD"
set_curve_prop IsatDD -label "Isat - DD" -color red -line_style solid -line_width 3

echo "Plotting IdSatMC Vs xGe"
ext::FilterTable out= xGeIsatMC x= $xGes y= $IsatMCs conditions= Conditions ncond= 1
create_variable -name xGe -dataset IsatMCxGe -values $xGeIsatMC(X)
create_variable -name IsatMC -dataset IsatMCxGe -values $xGeIsatMC(Y)
create_curve -name IsatMC -dataset IsatMCxGe -axisX "xGe" -axisY "IsatMC"
set_curve_prop IsatMC -label "Isat - MC" -color magenta -line_style solid -line_width 3 \
               -hide_line -show_markers -markers_type square -markers_size 10

echo "Plotting IoffDD Vs xGe"
ext::FilterTable out= xGeIoffDD x= $xGes y= $IoffDDs conditions= Conditions ncond= 1
create_variable -name xGe -dataset IoffDDxGe -values $xGeIoffDD(X)
create_variable -name IoffDD -dataset IoffDDxGe -values $xGeIoffDD(Y)
create_curve -name IoffDD -dataset IoffDDxGe -axisX "xGe" -axisY2 "IoffDD"
set_curve_prop IoffDD -label "Ioff - DD" -color black -line_style dash -line_width 3 \
               -show_line -show_markers -markers_type circle -markers_size 10
                
set_axis_prop -axis x -title {Channel Ge Mole Fraction [%]} -title_font_size 24 -scale_font_size 22 -type linear
set_axis_prop -axis y -title {Drain Lin and Sat Currents [<greek>m</greek>A/<greek>m</greek>m]} \
        -title_font_size 24 -scale_font_size 22 -type linear 
set_axis_prop -axis y2 -title {Drain Off Current [nA/<greek>m</greek>m]} \
        -title_font_size 24 -scale_font_size 22 -type log -scale_format scientific
set_legend_prop -font_size 22 -color_fg white -location _Lloc_

windows_style -style max
set_window_full -on
set_window_size 750x700
#-move_plot -position {1.5 0.5} -absolute
#-export_view zFig_IdDDMC_xGe_@Type@.tif -format tif -overwrite
export_view zFig_n@node@_IdDDMC_xGe_@Type@.eps -format eps -overwrite  -resolution 1000x1000
export_view zFig_n@node@_IdDDMC_xGe_@Type@.png -format png -overwrite  -resolution 1000x1000
# puts "Please re-position legend manually and export to EPS with CTRL-E!"






