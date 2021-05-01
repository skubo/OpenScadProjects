$fn=64;

diam = 5;
dist= 10;
height = 5;

hull(){
    cylinder(h=height, d=diam, center=true);

    translate([dist,0,0])
    cylinder(h=height, d=diam, center=true);
}
translate([dist/2,dist/2,-2])
cylinder(h=2, d=dist*2, center=true);
