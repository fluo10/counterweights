bead_radius=4;
bead_slit_radius=1;
bead_slit_depth=1.5;
bead_hole_radius=1;
$fn=16;
module bead_base() {
    sphere(bead_radius);
}
module bead_hole() {
    cylinder(h=bead_radius*2, r=bead_hole_radius, center=true);
}
module bead_slit() {
    rotate_extrude(){
        translate([bead_radius-bead_slit_depth+bead_slit_radius, 0, 0]) circle(bead_slit_radius);
        translate([bead_radius-bead_slit_depth + 2*bead_slit_radius, 0, 0]) square(bead_slit_radius*2, center=true);
    }
    
}

module bead(){
    difference() {
        bead_base();
        union() {
            bead_hole();
            bead_slit();
        }
    }
}
bead();
        