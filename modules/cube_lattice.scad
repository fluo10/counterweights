module cube_solid(unit_size, edge_radius, center) {
    module cube_solid_default(unit_size, edge_radius) {
        union() {
            hull() {
                sphere(edge_radius);
                translate([0, 0, unit_size]) sphere(edge_radius);
                translate([0, unit_size, 0]) sphere(edge_radius);
                translate([0, unit_size, unit_size]) sphere(edge_radius);
                translate([unit_size, 0, 0])sphere(edge_radius);
                translate([unit_size, 0, unit_size]) sphere(edge_radius);
                translate([unit_size, unit_size, 0]) sphere(edge_radius);
                translate([unit_size, unit_size, unit_size]) sphere(edge_radius);
            }
        }
    }
    if (center) {
        translate([-unit_size/2, -unit_size/2, -unit_size/2]) cube_solid_default(unit_size, edge_radius);
    } else {
        cube_solid_default(unit_size, edge_radius);
    }
}

module cube_lattice (unit_size, edge_radius, center) {
    module cube_lattice_not_center(unit_zie, edge_radius) {
        union(){
            hull(){
                sphere(edge_radius);
                translate([0, 0, unit_size]) sphere(edge_radius);
            };
            hull(){
                sphere(edge_radius);
                translate([0, unit_size, 0]) sphere(edge_radius);
            };
            hull(){
                sphere(edge_radius);
                translate([unit_size, 0 ,0]) sphere(edge_radius);
            };
            hull(){
                translate([0, 0, unit_size]) sphere(edge_radius);
                translate([0, unit_size, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([0, 0, unit_size]) sphere(edge_radius);
                translate([unit_size, 0, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([0, unit_size, ,0]) sphere(edge_radius);
                translate([0, unit_size, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([0, unit_size, 0]) sphere(edge_radius);
                translate([unit_size, unit_size, 0]) sphere(edge_radius);
            };
            
            hull(){
                translate([unit_size, 0, 0]) sphere(edge_radius);
                translate([unit_size, 0, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([unit_size, 0, 0]) sphere(edge_radius);
                translate([unit_size, unit_size, 0]) sphere(edge_radius);
            };
            hull(){
                translate([0, unit_size, unit_size]) sphere(edge_radius);
                translate([unit_size, unit_size, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([unit_size, 0, unit_size]) sphere(edge_radius);
                translate([unit_size, unit_size, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([unit_size, unit_size, 0]) sphere(edge_radius);
                translate([unit_size, unit_size, unit_size]) sphere(edge_radius);
            };      
        }
    }
    if (center) {
        translate([-unit_size/2, -unit_size/2, -unit_size/2]) cube_lattice_not_center(unit_size, edge_radius);
    } else {
        cube_lattice_not_center(unit_size, edge_radius);
    }
}
module cube_lattice_slit_top (unit_size, edge_radius, center) {
    module cube_lattice_slit_top_not_center(unit_zie, edge_radius) {
        union(){
            hull(){
                sphere(edge_radius);
                translate([0, 0, unit_size]) sphere(edge_radius);
            };
            hull(){
                sphere(edge_radius);
                translate([0, unit_size, 0]) sphere(edge_radius);
            };
            hull(){
                sphere(edge_radius);
                translate([unit_size, 0 ,0]) sphere(edge_radius);
            };
            hull(){
                translate([0, 0, unit_size]) sphere(edge_radius);
                translate([0, unit_size, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([0, 0, unit_size]) sphere(edge_radius);
                translate([unit_size/2, 0, 0]) sphere(edge_radius);
            };        
            hull(){
                translate([unit_size, 0, unit_size]) sphere(edge_radius);
                translate([unit_size/2, 0, 0]) sphere(edge_radius);
            };

            hull(){
                translate([0, unit_size, ,0]) sphere(edge_radius);
                translate([0, unit_size, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([0, unit_size, 0]) sphere(edge_radius);
                translate([unit_size, unit_size, 0]) sphere(edge_radius);
            };
            
            hull(){
                translate([unit_size, 0, 0]) sphere(edge_radius);
                translate([unit_size, 0, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([unit_size, 0, 0]) sphere(edge_radius);
                translate([unit_size, unit_size, 0]) sphere(edge_radius);
            };
            hull(){
                translate([0, unit_size, unit_size]) sphere(edge_radius);
                translate([unit_size/2, unit_size, 0]) sphere(edge_radius);
            };
            hull(){
                translate([unit_size, unit_size, unit_size]) sphere(edge_radius);
                translate([unit_size/2, unit_size, 0]) sphere(edge_radius);
            };
            hull(){
                translate([unit_size, 0, unit_size]) sphere(edge_radius);
                translate([unit_size, unit_size, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([unit_size, unit_size, 0]) sphere(edge_radius);
                translate([unit_size, unit_size, unit_size]) sphere(edge_radius);
            }; 
        }
    }
    if (center) {
        translate([-unit_size/2, -unit_size/2, -unit_size/2]) cube_lattice_slit_top_not_center(unit_size, edge_radius);
    } else {
        cube_lattice_slit_top_not_center(unit_size, edge_radius);
    }
}
module cube_lattice_slit_bottom (unit_size, edge_radius, center) {
    rotate([180, 0, 0]) cube_lattice_slit_top(unit_size, edge_radius, center);
}
module cube_lattice_slit_front (unit_size, edge_radius, center) {
    rotate([270, 0, 0]) cube_lattice_slit_top(unit_size, edge_radius, center);
}
module cube_lattice_slit_back (unit_size, edge_radius, center) {
    rotate([90, 0, 0]) cube_lattice_slit_top(unit_size, edge_radius, center);

}
module cube_lattice_round_front_top (unit_size, edge_radius, center) {
    module cube_lattice_slit_top_not_center(unit_zie, edge_radius) {
        union(){
            hull(){
                sphere(edge_radius);
                translate([0, 0, unit_size]) sphere(edge_radius);
            };
            hull(){
                sphere(edge_radius);
                translate([0, unit_size, 0]) sphere(edge_radius);
            };
            hull(){
                sphere(edge_radius);
                translate([unit_size, 0 ,0]) sphere(edge_radius);
            };
            hull(){
                translate([0, 0, unit_size]) sphere(edge_radius);
                translate([unit_size, 0, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([0, unit_size, 0]) sphere(edge_radius);
                translate([unit_size, unit_size, 0]) sphere(edge_radius);
            };
            
            hull(){
                translate([unit_size, 0, 0]) sphere(edge_radius);
                translate([unit_size, 0, unit_size]) sphere(edge_radius);
            };
            hull(){
                translate([unit_size, 0, 0]) sphere(edge_radius);
                translate([unit_size, unit_size, 0]) sphere(edge_radius);
            };
            rotate([0, 270, 0]) rotate_extrude(angle=90) translate([unit_size, 0, 0]) circle(r=edge_radius);
            translate([unit_size, 0, 0]) rotate([0, 270, 0]) rotate_extrude(angle=90) translate([unit_size, 0, 0]) circle(r=edge_radius);
        }
    }
    if (center) {
        translate([-unit_size/2, -unit_size/2, -unit_size/2]) cube_lattice_slit_top_not_center(unit_size, edge_radius);
    } else {
        cube_lattice_slit_top_not_center(unit_size, edge_radius);
    }
}
module cube_lattice_round_front_bottom (unit_size, edge_radius, center) {
    rotate([270, 0, 0]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
module cube_lattice_round_back_bottom (unit_size, edge_radius, center) {
    rotate([180, 0, 0]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
module cube_lattice_round_back_top (unit_size, edge_radius, center) {
    rotate([90, 0, 0]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
module cube_lattice_round_right_top (unit_size, edge_radius, center) {
    rotate([0, 0, 270]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
module cube_lattice_round_right_bottom (unit_size, edge_radius, center) {
    rotate([270, 0, 270]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
module cube_lattice_round_left_bottom (unit_size, edge_radius, center) {
    rotate([180, 0, 270]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
module cube_lattice_round_left_top (unit_size, edge_radius, center) {
    rotate([90, 0, 270]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
module cube_lattice_round_front_right (unit_size, edge_radius, center) {
    rotate([0, 90, 0]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
module cube_lattice_round_back_right (unit_size, edge_radius, center) {
    rotate([90, 90, 0]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
module cube_lattice_round_front_left (unit_size, edge_radius, center) {
    rotate([270, 90, 0]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
module cube_lattice_round_back_left (unit_size, edge_radius, center) {
    rotate([180, 90, 0]) cube_lattice_round_front_top(unit_size, edge_radius, center);
}
cube_lattice(1, 0.2, true);
//cube_lattice_slit_front_bottom(1,0.2, true);
translate([0,0,1]) cube_lattice_slit_top(1,0.2, true);
translate([0,1,0]) cube_lattice_slit_front(1,0.2, true);
translate([0,0,-1]) cube_lattice_slit_bottom(1,0.2, true);
translate([0,-1,0]) cube_lattice_slit_back(1,0.2, true);

translate([-5, 0, 0]) cube_solid(1, 0.2, true);

translate([5, 0, 0]){
    translate([0, 1, 1]) cube_lattice_round_front_top(1, 0.2, true);
    translate([0, 1, -1]) cube_lattice_round_front_bottom(1, 0.2, true);
    translate([0, -1, 1]) cube_lattice_round_back_top(1, 0.2, true);
    translate([0, -1, -1]) cube_lattice_round_back_bottom(1, 0.2, true);
    translate([-1, 0, 1]) cube_lattice_round_left_top(1, 0.2, true);
    translate([-1, 0, -1]) cube_lattice_round_left_bottom(1, 0.2, true);
    translate([1, -0, 1]) cube_lattice_round_right_top(1, 0.2, true);
    translate([1, -0, -1]) cube_lattice_round_right_bottom(1, 0.2, true);
    translate([-1, 1, 0]) cube_lattice_round_front_left(1, 0.2, true);
    translate([-1, -1, 0]) cube_lattice_round_back_left(1, 0.2, true);
    translate([1, 1, 0]) cube_lattice_round_front_right(1, 0.2, true);
    translate([1, -1, 0]) cube_lattice_round_back_right(1, 0.2, true);
}
