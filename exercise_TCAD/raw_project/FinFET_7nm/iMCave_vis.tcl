#setdep @node|MC3@ && @node|MC3:+1@ && @node|MC3:+2@ && @node|MC3:+3@ && @node|MC3:+4@ && @node|MC3:+5@

#if "@Type@" == "pMOS"
#define _title_ PFinFET
#define _inv_   -inverted
#else
#define _title_ NFinFET
#define _inv_   
#endif

set Nodes    [list @node|MC3@ @node|MC3:+2@ @node|MC3:+4@]
set NodesS   [list @node|MC3:+1@ @node|MC3:+3@ @node|MC3:+5@]
set Colors   [list blue red green]
set Style    dash
set StyleS   solid
set Labels   [list "Si - Lin" "Si<sub>0.5</sub>Ge<sub>0.5</sub> - Lin" "Ge - Lin"]
set LabelsS  [list "Si - Sat" "Si<sub>0.5</sub>Ge<sub>0.5</sub> - Sat" "Ge - Sat"]
set Markers  [list diamondf squaref circlef]
set MarkersS [list diamond square circle]

create_plot -1d -name Plot_MCt
select_plots Plot_MCt
set_plot_prop -show_title -title _title_ -title_font_size 26  -title_font_att bold -show_legend 

foreach N $Nodes Color $Colors Label $Labels Marker $Markers {
  load_file n${N}_mc.sparta_average.plt -name PLT($N)
  
  create_curve -name In($N) -dataset PLT($N) -axisX "number" -axisY "particle MCdrain"
  set_curve_prop In($N) -label $Label -color $Color -line_style $Style -line_width 3 \
  -markers_type $Marker -markers_size 7 -show_markers 
}

foreach N $NodesS Color $Colors Label $LabelsS Marker $MarkersS {
  load_file n${N}_mc.sparta_average.plt -name PLT($N)
  
  create_curve -name In($N) -dataset PLT($N) -axisX "number" -axisY "particle MCdrain"
  set_curve_prop In($N) -label $Label -color $Color -line_style $StyleS -line_width 3 \
  -markers_type $Marker -markers_size 7 -show_markers 
}

set_axis_prop -axis x -title {Number of Iterations} \
        -title_font_size 24 -scale_font_size 22 -type linear 
#-        -range {_Xmin_ _Xmax_} -manual_spacing -spacing 5 -nof_minor_ticks 6 
set_axis_prop -axis y -title {Average Drain Current [A/<greek>m</greek>m]} \
        -title_font_size 24 -scale_font_size 22 -type linear \
#-        -range {_Ymin_ _Ymax_} -manual_spacing -spacing 2e-5 -hide_minor_ticks \
         -scale_format scientific -scale_precision 1 _inv_
              
set_legend_prop -font_size 20 -color_fg white -position {0.55 0.84}

windows_style -style max
set_window_full -on
set_window_size 750x700
#-move_plot -position {1.5 0.5} -absolute
#-export_view zFig_In.tif -format tif -overwrite
export_view zFig_n@node@_In.eps -format eps -overwrite  -resolution 1000x1000
export_view zFig_n@node@_In.png -format png -overwrite  -resolution 1000x1000
# puts "Please re-position legend manually and export to EPS with CTRL-E!"







