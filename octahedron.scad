use <modules/rhombic_dodecahedron.scad>;

$fn = 8;

module counter_weight_base(max_length, unit_size, edge_size , core_count) {
    union(){
   for (x = [-max_length:1:max_length]) {
       for (y = [-max_length:1:max_length]) {
          for (z = [-max_length:1:max_length]) {
             if ((x+y+z)%2 == 0) {
                if (abs(x)+abs(y)+abs(z) <= core_count &&
                    !(abs(x) == max_length -2 && y == 0 && z == 0) &&
                    !(x == 0 && abs(y) == max_length -2 && z == 0) &&
                    !(x == 0 && y == 0 && abs(z) == max_length -2)
                ){
                   translate([x*unit_size, y*unit_size, z*unit_size]) rhombic_dodecahedron_solid(unit_size);
                }else if (
               (abs(x) + abs(y) + abs(z) <= max_length) &&
                abs(x) + abs(y) < max_length && 
                abs(x) + abs(z) < max_length && 
                abs(y) + abs(z) < max_length && 
                 !(x == 0 && abs(y) == max_length -2 && z == 0) &&
                    !(x == 0 && y == 0 && abs(z) == max_length -2)
             ){
                                        translate([x*unit_size, y*unit_size, z*unit_size]) rhombic_dodecahedron_lattice(unit_size, edge_size);
;
             }
         }
         }
     }
 }
 }
}

module counter_weight(max_length, unit_size, edge_size, core_count){
    union() {
           counter_weight_base(max_length, unit_size, edge_size, core_count);
    }
        
}

counter_weight(6, 3, 1.5, 4);
