#setdep @node|sprocess@ && @node|sprocess:+1@ && @node|sprocess:+2@


load_file n@node|sprocess@_e_fps.tdr
create_plot -dataset n@node|sprocess@_e_fps
select_plots {Plot_n@node|sprocess@_e_fps}

load_file n@node|sprocess:+1@_e_fps.tdr
create_plot -dataset n@node|sprocess:+1@_e_fps
select_plots {Plot_n@node|sprocess:+1@_e_fps}

load_file n@node|sprocess:+2@_e_fps.tdr
create_plot -dataset n@node|sprocess:+2@_e_fps
select_plots {Plot_n@node|sprocess:+2@_e_fps}

link_plots {Plot_n@node|sprocess@_e_fps Plot_n@node|sprocess:+1@_e_fps Plot_n@node|sprocess:+2@_e_fps} 
windows_style -style horizontal

rotate_plot -x 10 -y 90 -z -60 -absolute
move_plot -position {0.00 0.26}
zoom_plot -plot Plot_n@node|sprocess:+2@_e_fps -window {0.42 0.61 0.58 0.75}
move_plot -position {0.00 -0.09}
#-set_plot_prop -plot Plot_n@node|sprocess:+2@_e_fps -hide_legend

set_field_prop -plot Plot_n@node|sprocess:+2@_e_fps -geom n@node|sprocess:+2@_e_fps \
               xMoleFraction -show_bands

set_material_prop {SiliconGermanium Interface RefinementBox TiNitride \
                   InterfacialOxide HfO2 LowK Nitride JunctionLine Oxide Contact} \
                  -plot Plot_n@node|sprocess:+2@_e_fps -geom n@node|sprocess:+2@_e_fps -hide_field

set_material_prop {SiliconGermanium} \
                  -plot Plot_n@node|sprocess:+2@_e_fps -geom n@node|sprocess:+2@_e_fps -show_field
                                 
set_legend_prop -plot Plot_n@node|sprocess:+2@_e_fps -position {0.50 0.29} -size {0.2 0.33} \
                -label_font_factor 4.0 -color_fg white -show_background
                               
set_plot_prop -hide_legend
#-set_plot_prop -show_legend

set_field_prop -plot Plot_n@node|sprocess:+2@_e_fps -geom n@node|sprocess:+2@_e_fps xMoleFraction -min 0.0 -min_fixed
set_field_prop -plot Plot_n@node|sprocess:+2@_e_fps -geom n@node|sprocess:+2@_e_fps xMoleFraction -max 1.0 -min_fixed

set_window_full -on
export_view zFig_n@node@_xGe.png -format png -overwrite -resolution 1000x1000
export_view zFig_n@node@_xGe.eps -format eps -overwrite -resolution 1000x1000




