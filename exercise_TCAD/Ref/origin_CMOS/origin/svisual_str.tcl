# Get all .tdr files in current directory
set TDRs [lsort -dictionary [glob *.tdr]]

# Safety check
if {[llength $TDRs] == 0} {
    puts "No TDR files found"
    exit
}

# Loop over all .tdr files
foreach f $TDRs {
    set fname [file rootname [file tail $f]]
    puts "Processing $f ..."
    # Load tdr as dataset
    load_file $f -name $fname
    # Create plot directly from dataset
    create_plot -dataset $fname  -name "Plot_$fname"
}

set all_plots [list_plots]

set firstPlot [lindex $all_plots 5]

set Corres_fname [string range $firstPlot 5 end] 

link_plots $all_plots
select_plots $firstPlot
set_material_prop {Interface} -plot $firstPlot -off

set_plot_prop -plot $firstPlot -hide_axes
set_plot_prop -plot $firstPlot -hide_legend
set_plot_prop -plot $firstPlot -not_axes_interchanged
set_plot_prop -plot $firstPlot -hide_title
set_axis_prop -plot $firstPlot -axis x -range {-0.230631  0.231813}
set_axis_prop -plot $firstPlot -axis y -range {-0.0547421 0.207447}

set_field_prop -plot $firstPlot -geom $Corres_fname NetActive -show_bands
set_field_prop -plot $firstPlot -geom $Corres_fname NetActive -max 1e+22 -max_fixed
set_field_prop -plot $firstPlot -geom $Corres_fname NetActive -min -1e+19 -min_fixed
set_field_prop -plot $firstPlot -geom $Corres_fname NetActive -levels 50

zoom_plot -plot $firstPlot -factor 1.0
export_view n.png -plots $all_plots -format png -overwrite -resolution 1236x733
exit
