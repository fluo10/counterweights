module rhombic_dodecahedron_solid(unit_size){

    polyhedron(
        points = [
            [0, 0, -unit_size],                         //0
            [0, 0, unit_size],                          //1
            [0, -unit_size, 0],                         //2
            [0, unit_size, 0],                          //3
            [-unit_size, 0, 0],                         //4
            [unit_size, 0, 0],                          //5
            [-unit_size/2, -unit_size/2, -unit_size/2],  //6
            [-unit_size/2, -unit_size/2, unit_size/2],   //7
            [-unit_size/2, unit_size/2, -unit_size/2],   //8
            [-unit_size/2, unit_size/2, unit_size/2],    //9
            [unit_size/2, -unit_size/2, -unit_size/2],   //10
            [unit_size/2, -unit_size/2, unit_size/2],    //11
            [unit_size/2, unit_size/2, -unit_size/2],    //12
            [unit_size/2, unit_size/2, unit_size/2],    //13
       ],
        faces = [
            [0, 8, 4, 6], [0, 6, 2, 10], [0, 12, 3, 8], [0, 10, 5, 12],
            [2, 7, 1, 11], [1, 7, 4, 9], [1, 9, 3, 13], [1,13, 5, 11],
            [2, 6, 4,7], [4,8, 3,9], [3,12,  5,13], [5,10, 2, 11]
        ]
    );

}
module rhombic_dodecahedron_lattice(unit_size, edge_size){
    module edge(x1, y1, z1, x2, y2, z2) {
        for (i = [-1:2:1]) {
            for (j = [-1:2:1]) {
                for (k = [-1:2:1]) {
                     hull() {
                            translate([i*x1, j*y1, k*z1])
                            sphere(edge_size /2);
                            translate([i*x2, j*y2, k*z2])
                            sphere(edge_size/2);
                    } 
                }
            }
        }
    }
    union() {
    edge(unit_size/2, unit_size/2, unit_size/2, unit_size, 0, 0);
    edge(unit_size/2, unit_size/2, unit_size/2, 0, unit_size, 0);
    edge(unit_size/2, unit_size/2, unit_size/2, 0, 0, unit_size);
    };
}