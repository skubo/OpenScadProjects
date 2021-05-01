// Drone RC motor mount
// with guide holes
$fn=64;

inner_d = 30;
outer_d = 50;
height = 10;
motor_lager_d = 10;

guide_d = 3.5;

difference()
{
    cube([outer_d, outer_d, height]);
    translate([outer_d/2, outer_d/2, -1])
    cylinder(d=inner_d, h=height*2, center=false);

    translate([-10,height/2,height/2])
    rotate([0,90,0])
    cylinder(d=guide_d, h=outer_d*2, center=false);

    translate([-10,outer_d - height/2,height/2])
    rotate([0,90,0])
    cylinder(d=guide_d, h=outer_d*2, center=false);

    translate([outer_d/2,height,-1])
    cube([inner_d, inner_d, height+2]);
}


translate([0,0,height])
cube([outer_d, height, height]);
translate([0,outer_d-height,height])
cube([outer_d, height, height]);

difference()
{
    translate([0,0,height*2])
    cube([outer_d, outer_d, height-4]);

    translate([outer_d/2, outer_d/2, 1.5*height])
    cylinder(d=motor_lager_d, h=height*2, center=false);

    translate([outer_d/2, outer_d/2, 1.5*height])
    rotate([0,0,45])
    {
        translate([8, 0, 0])
        cylinder(d=3, h=height*2, center=false);

        translate([0, 8, 0])
        cylinder(d=3, h=height*2, center=false);

        translate([0, -8, 0])
        cylinder(d=3, h=height*2, center=false);

        translate([-8, 0, 0])
        cylinder(d=3, h=height*2, center=false);
    }
}

