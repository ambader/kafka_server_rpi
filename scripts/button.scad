
module top_hull(){
    color("blue", 0.6)
    difference(){
    cylinder(h=38, r = 19, center = false,$fn=60);
    translate([0,0,30])
    cylinder(h=11, r = 16, center = false,$fn=6);
    cylinder(h=200, r = 14.5, center = true,$fn=150);
}}

module sup_ring(){
    difference(){
    cylinder(h=5, r = 19, center = true,$fn=150);
    cylinder(h=8, r = 14, center = true,$fn=150);
    }}


module pillar_stand_sub(positions,
    length=70, rear_height=15, rear_width=45, scaling_factor=0.5, rounded=false) {
    color("red", 0.6)
    // center part
    rotate([0,0,90*positions])
        translate([0,12,0])
        linear_extrude(height=length,center=false,scale=scaling_factor)
        resize([rear_height,rear_width])
        circle(d=rear_height);
    
    if (rounded) {
        // rear part
        translate([length/2,0,0])
            resize([rear_height,rear_width,rear_height])
            sphere(d=rear_height);
        
        // front part
        translate([-length/2,0,0])
            scale(scaling_factor)
            resize([rear_height,rear_width,rear_height])
            sphere(d=rear_height);
    }    
}

module pillar_stand(positions){
    translate([0,0,0])
    pillar_stand_sub(positions,
    length=78, rear_height=20, rear_width=65, scaling_factor=0.2, rounded=false);
}

module pillar_stands(){
    for (i= [1,2,3,4])
    pillar_stand(i);
}

module pillar(){
    difference(){
    pillar_stands();
    cylinder(h=200, r = 16, center = true,$fn=6);
    translate([0,0,-1])
    cylinder(h=41, r1 = 30,
    r2 = 20, center = false,$fn=6);
    rotate([0,0,90])
    translate([0,0,-1])
    cylinder(h=41, r1 = 30,
    r2 = 20, center = false,$fn=6);
}
}


translate([0,0,40])sup_ring();
translate([0,0,40])top_hull();
pillar();
