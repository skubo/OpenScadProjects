$fn=64;

w=100;
d=80;
h=100;
t = 3;

difference()
{
    box(5,w,d,h);
    translate([t,t,t])
    box(3,w-2*t,d-2*t,h);

    translate([48,d-20,75])
    rotate([90,0,0])
    {
        cylinder(r=15, h=d*2);
        translate([27,-18,0])
        cylinder(r=15, h=d*2);
        translate([19,-48,0])
        cylinder(r=15, h=d*2);
        translate([-13,-49,0])
        cylinder(r=15, h=d*2);
        translate([-25,-20,0])
        cylinder(r=15, h=d*2);
        translate([1,-26,0])
        cylinder(r=8, h=d*2);
    }

    translate([-10,5,10])
    rotate([90,20,90])
    box(2,3,80,h+50);

    translate([-10,15,10])
    rotate([90,20,90])
    box(2,3,80,h+50);

    translate([-10,25,10])
    rotate([90,20,90])
    box(2,3,80,h+50);

    translate([-10,35,10])
    rotate([90,20,90])
    box(2,3,80,h+50);

    translate([-10,45,10])
    rotate([90,20,90])
    box(2,3,80,h+50);

    translate([-10,9,47.5])
    rotate([90,20,90])
    box(2,3,40,h+50);

    translate([-10,7.5,71])
    rotate([90,20,90])
    box(2,3,15,h+50);

    translate([-10,55,10])
    rotate([90,20,90])
    box(2,3,40,h+50);

    translate([-10,65,10])
    rotate([90,20,90])
    box(2,3,15,h+50);

    translate([7.5,90,50])
    rotate([90,45,0])
    box(3,60,60,60);
}

module box(r,w,d,h)
{
    hull()
    {
        translate([0,0,0])
        sphere(r = r);
        translate([w,0,0])
        sphere(r = r);
        translate([0,d,0])
        sphere(r = r);
        translate([w,d,0])
        sphere(r = r);

        translate([0,0,h])
        cylinder(r = r, h=1);
        translate([w,0,h])
        cylinder(r = r, h=1);
        translate([0,d,h])
        cylinder(r = r, h=1);
        translate([w,d,h])
        cylinder(r = r, h=1);
    }
}
