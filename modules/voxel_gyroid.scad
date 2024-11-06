range = 360; //Range. 360 is one "section".
res = 12; //Resolution.  Range/resolution=cubes on a side
reps = 1; //Repetitions.  0 is just one, 1 is two in every direction, etc.

module voxel_gyroid(res=12, reps = 0) {
    union() {
        for(a=[0:reps], b=[0:reps], c=[0:reps]) translate([(range/res * a), (range/res * b), (range/res * c)]) {

            for(i=[0:res:range], j=[0:res:range], k=[0:res:range]){
                num = ((cos(i) * sin(j)) + (cos(j) * sin(k)) + (cos(k) * sin(i)));
                if ((num < 0.2) && (num > -0.2)) {
                    translate([(i/res),(j/res),(k/res)]) 
                        cube([1.05,1.05,1.05]); 
                }

            }
        }
    }
}
voxel_gyroid(res=12, reps=2);