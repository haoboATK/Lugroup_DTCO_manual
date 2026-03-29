proc mc_integrate {args} {
  set txlist  [lindex $args 0]
  set tylist  [lindex $args 1]
  set txmin   [lindex $args 2]
  set txmax   [lindex $args 3]
  set tx0     [lindex $args 4]
  set ty0     [lindex $args 5]

#puts $txlist
#puts $tylist
#puts $txmin
#puts $txmax

  set nxlist  [list ]
  set nylist  [list ]
  lappend nxlist  $tx0
  lappend nylist  $ty0
  foreach x $txlist y $tylist {
    if { $x >= $txmin && $x <= $txmax } {
#puts "$x  $y"
      lappend nxlist $x
      lappend nylist $y
    }
  }
#puts $nxlist
#puts $nylist

  set ret 0
  foreach x1 [lrange $nxlist 0 end-1] y1 [lrange $nylist 0 end-1] x2 [lrange $nxlist 1 end] y2 [lrange $nylist 1 end] {
    if { $x1 != $x2 } {
      set ret [expr $ret+($y1+$y2)/2.*($x2-$x1)]
    }
  }

  return $ret
}

proc mc_integrateX {args} {
  set txlist  [lindex $args 0]
  set tylist  [lindex $args 1]
  set txmin   [lindex $args 2]
  set txmax   [lindex $args 3]
  set tx0     [lindex $args 4]
  set ty0     [lindex $args 5]

  set nxlist  [list ]
  set nylist  [list ]
  lappend nxlist  $tx0
  lappend nylist  $ty0
  foreach x $txlist y $tylist {
    if { $x >= $txmin && $x <= $txmax } {
      lappend nxlist $x
      lappend nylist $y
    }
  }

  set ret 0
  foreach x1 [lrange $nxlist 0 end-1] y1 [lrange $nylist 0 end-1] x2 [lrange $nxlist 1 end] y2 [lrange $nylist 1 end] {
    if { $x1 != $x2 } {
      set ret [expr $ret+($y1*$x1+$y2*$x2)/2.*($x2-$x1)]
    }
  }

  return $ret
}


