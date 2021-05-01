$fn=64;
outer_d = 5;
inner_d = 2;
height = 20;

difference()
{
    cylinder(d=outer_d, h=height);
    translate([0,0,-0.5])
    cylinder(d=inner_d, h=height+1);
}