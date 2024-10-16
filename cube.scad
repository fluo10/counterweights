use <modules/cube_lattice.scad>;
$fn=32;

module cube_counterweight_base(size, core_size, unit_size, edge_radius) {
    function is_slit(i, j, k) = abs(i) <= 0.5 && (size/2 - abs(j) <= 1.5 || size/2 - abs(k) <= 1.5);
    size2=size-1;
    function is_lattice_vertex(i, j, k) = abs(i) == size2/2 && abs(j) == size2/2 && abs(k) == size2/2;
    function is_lattice_edge(i, j, k) = !is_lattice_vertex(i, j, k) && (abs(i) == size2/2 && abs(j) == size2/2 ||abs(j) == size2/2 && abs(k) == size2/2 ||abs(k) == size2/2 && abs(i) == size2/2 );
    union(){
        for (i = [-size2/2:1:size2/2]){
            for (j = [-size2/2:1:size2/2]){
                for (k = [-size2/2:1:size2/2]){
                    translate([i*unit_size, j*unit_size, k*unit_size]) {
                        if((max(abs(i), abs(j), abs(k)) <= core_size/2) ){
                            cube_solid(unit_size,edge_radius, center=true);
                        } else if (is_slit(i, j, k)) {
                            if (j == size2/2) {
                               if (!(abs(k) == size2/2)) {
                                   cube_lattice_slit_front(unit_size, edge_radius, center=true);
                               }
                           } else if (j == -size2/2) {
                               if (!(abs(k) == size2/2)) {
                                   cube_lattice_slit_back(unit_size, edge_radius, center=true);
                               }
                           } else {
                                if (k == size2/2) {
                                   cube_lattice_slit_top(unit_size, edge_radius, center=true);
                               } else if (k == -size2/2) {
                                   cube_lattice_slit_bottom(unit_size, edge_radius, center=true);
                               }
                           }
                       } else if(!is_lattice_vertex(i, j, k)) {
                           if (i==-size2/2 && j == -size2/2 ) {
                               cube_lattice_round_back_left(unit_size, edge_radius, center=true);
                           } else if (i==-size2/2 && j== size2/2) {
                               cube_lattice_round_front_left(unit_size, edge_radius, center=true);
                           } else if (i==size2/2 && j== -size2/2) {
                               cube_lattice_round_back_right(unit_size, edge_radius, center=true);
                           } else if (i==size2/2 && j== size2/2) {
                               cube_lattice_round_front_right(unit_size, edge_radius, center=true);
                           } else if (j==-size2/2 && k == -size2/2 ) {
                               cube_lattice_round_back_bottom(unit_size, edge_radius, center=true);
                           } else if (j==-size2/2 && k== size2/2) {
                               cube_lattice_round_back_top(unit_size, edge_radius, center=true);
                           } else if (j==size2/2 && k== -size2/2) {
                               cube_lattice_round_front_bottom(unit_size, edge_radius, center=true);
                           } else if (j==size2/2 && k== size2/2) {
                               cube_lattice_round_front_top(unit_size, edge_radius, center=true);
                           } else if (i==-size2/2 && k == -size2/2 ) {
                               cube_lattice_round_left_bottom(unit_size, edge_radius, center=true);
                           } else if (i==-size2/2 && k== size2/2) {
                               cube_lattice_round_left_top(unit_size, edge_radius, center=true);
                           } else if (i==size2/2 && k== -size2/2) {
                               cube_lattice_round_right_bottom(unit_size, edge_radius, center=true);
                           } else if (i==size2/2 && k== size2/2) {
                               cube_lattice_round_right_top(unit_size, edge_radius, center=true);
                           } else {
                               cube_lattice(unit_size, edge_radius, true);
                           }
                        }
                    }
                }
            }
        }
    }
}

module cube_counterweight(size, core_size, unit_size, edge_radius) {
    difference() {
        cube_counterweight_base(size, core_size, unit_size, edge_radius);
    }
}

    
//cube_counterweight(5, 3, 4, 1);
cube_counterweight(7, 5, 3.2, 0.8);
//cube_counterweight_slit(9, 3.2, 0.8);