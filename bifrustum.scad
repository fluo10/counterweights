include <config.scad>;

$fn=180;
center_offset=height*bead_hole_radius/(bead_hole_radius+string_hole_radius)-height/2;
module body() {
    module body_profile() {
        union(){
            minkowski() {
                polygon([[bead_hole_radius+edge_radius, height/2-edge_radius], [width/2-edge_radius, center_offset], [bead_hole_radius+edge_radius, center_offset]]);
                circle(edge_radius);
            }
            minkowski() {
                polygon([[string_hole_radius, -height/2+edge_radius], [width/2-edge_radius, center_offset], [string_hole_radius, center_offset]]);
                circle(edge_radius);
            }
        }
    }

    module hole_profile() {
        translate([bearing_hole_radius/2, 0, 0]) square([bearing_hole_radius, width], center=true);
       translate([bearing_radius/2, height/2-bead_hole_depth/2, 0])square([bearing_radius, bead_hole_depth], center=true);
      translate([bead_hole_groove_radius/2, height/2-bead_hole_depth-bead_hole_groove_depth/2, 0]) square([bead_hole_groove_radius, bead_hole_groove_depth], center=true);   
    }
    rotate_extrude() difference(){
        body_profile();
        //hole_profile();
        hole_profile();
    }
}

body();
