include <config.scad>;

$fn=180;
angle=45;

top_height=tan(angle)*(width/2-edge_radius - (bead_hole_radius+ edge_radius));
bottom_height=tan(angle)*(width/2-edge_radius - string_hole_radius);
center_offset=((height/2-top_height) + (-height/2 + bottom_height))/2;
module body() {
    module body_profile() {
        union(){
            minkowski() {
                polygon([[bead_hole_radius+edge_radius, height/2-edge_radius], [width/2-edge_radius, height/2-top_height-edge_radius], [bead_hole_radius+edge_radius, height/2-top_height-edge_radius]]);
                circle(edge_radius);
            }
            minkowski() {
                polygon([[string_hole_radius, -height/2+edge_radius], [width/2-edge_radius, -height/2 + bottom_height+edge_radius], [string_hole_radius, -height/2 + bottom_height+edge_radius]]);
                circle(edge_radius);
            }
            translate([width/4, center_offset, 0]) square([width/2, (height-top_height-bottom_height-2*edge_radius)], center=true);
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
echo(center_offset);
