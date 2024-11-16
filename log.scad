bearing_radius=6.35;
bearing_hole_radius=3.175;
bearing_width= 4.762;

width=28;
height=28;
bead_radius=5;
bead_hole_depth=bead_radius*2+bearing_width;
bead_hole_groove_depth=1;
bead_hole_groove_radius=5;

module body() {
    sphere(width/2);
}

module hole() {
    module hole_profile() {
        translate([bearing_hole_radius/2, 0, 0]) square([bearing_hole_radius, width], center=true);
       translate([bearing_radius/2, height/2-bead_hole_depth/2, 0])square([bearing_radius, bead_hole_depth], center=true);
      translate([bead_hole_groove_radius/2, height/2-bead_hole_depth-bead_hole_groove_depth/2, 0]) square([bead_hole_groove_radius, bead_hole_groove_depth], center=true);   
    }
    rotate_extrude() hole_profile();
}

difference(){
    body();
    hole();
}