#setdep @node|DD@ && @node|DD:+1@ && @node|DD:+2@

load_file n@node|DD@_des.tdr
create_plot -dataset n@node|DD@_des
select_plots {Plot_n@node|DD@_des}

load_file n@node|DD:+1@_des.tdr
create_plot -dataset n@node|DD:+1@_des
select_plots {Plot_n@node|DD:+1@_des}

load_file n@node|DD:+2@_des.tdr
create_plot -dataset n@node|DD:+2@_des
select_plots {Plot_n@node|DD:+2@_des}

link_plots {Plot_n@node|DD@_des Plot_n@node|DD:+1@_des Plot_n@node|DD:+2@_des} 
windows_style -style horizontal

set_field_prop -plot Plot_n@node|DD:+2@_des -geom n@node|DD:+2@_des \
               xMoleFraction -show_bands
               
set_material_prop {SiliconGermanium Interface DepletionRegion TiNitride \
                   InterfacialOxide HfO2 Nitride JunctionLine Oxide Contact} \
                  -plot Plot_n@node|DD:+2@_des -geom n@node|DD:+2@_des -hide_field

set_material_prop {SiliconGermanium} -plot Plot_n@node|DD:+2@_des -geom n@node|DD:+2@_des -show_field
                  
#-set_plot_prop -plot Plot_n@node|DD:+2@_des -hide_legend

set_legend_prop -plot Plot_n@node|DD:+2@_des -position {0.50 0.29} -size {0.2 0.33} \
                -label_font_factor 4.0 -color_fg white -show_background
                               
set_plot_prop -hide_legend
#-set_plot_prop -show_legend

set_field_prop -plot Plot_n@node|DD:+2@_des -geom n@node|DD:+2@_des xMoleFraction -min 0.0 -min_fixed
set_field_prop -plot Plot_n@node|DD:+2@_des -geom n@node|DD:+2@_des xMoleFraction -max 1.0 -min_fixed

set_window_full -on

zoom_plot -plot Plot_n@node|DD:+2@_des -window {-0.01 -0.011 0.01 0.013}
#-move_plot -position {0.00 -0.09}

export_view zFig_n@node@_Xcut_xGe.png -format png -overwrite -resolution 1000x1000
export_view zFig_n@node@_Xcut_xGe.eps -format eps -overwrite -resolution 1000x1000






