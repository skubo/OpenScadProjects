width=280;
depth=278;
height=278;
edgeradius=5;
thickness=4;
bottom=1;
holegap=4;
hole=(width - holegap)/20;
holetop=40;
$fn=64;

difference()
{
    roundFlatCube(edgeradius, width, depth, height);
    translate([thickness/2,thickness/2,bottom])
    roundCube(edgeradius-thickness/2, width-thickness, depth-thickness, height);
    translate([width/2, 10, height - holetop ])
    rotate([90,0,0])
    cylinder(r=hole, h=100);

/*    translate([0,0,-10])
    for (y=[hole*2:hole*2 + holegap:width-hole*2])
    {
        for (i=[hole*2:hole*2 + holegap:width-hole*2])
        {
            translate([i,y,0])
            cylinder(r=hole, h=100);
        }
    }*/
}
/*
roundedCornerThingee(edgeradius, height+bottom);

translate([width,0,0])
rotate(90)
roundedCornerThingee(edgeradius, height+bottom);

translate([width,height,0])
rotate(180)
roundedCornerThingee(edgeradius, height+bottom);

translate([0,height,0])
rotate(-90)
roundedCornerThingee(edgeradius, height+bottom);

translate([width/2,0,0])
roundedThingee(edgeradius/2, height+bottom);

translate([width,height/2,0])
rotate(90)
roundedThingee(edgeradius/2, height+bottom);

translate([0,height/2,0])
rotate(-90)
roundedThingee(edgeradius/2, height+bottom);

translate([width/2,height,0])
rotate(180)
roundedThingee(edgeradius/2, height+bottom);
*/
module roundedThingee(r, h)
{
    translate([-r,0,0])
    {
    translate([r,r,0])
    cylinder(r=r, h=h);
    difference()
    {
    translate([r,0,0])
    cube([2*r,r,h]);
    translate([3*r,r,-1])
    cylinder(r=r,h=h+2);
    }
    difference()
    {
    translate([-r,0,0])
    cube([2*r,r,h]);
    translate([-r,r,-1])
    cylinder(r=r, h=h+2);
    }
}
}

module roundedCornerThingee(r, h)
{
    translate([r,r,0])
    cylinder(r=r, h=h);
    difference()
    {
    translate([r,0,0])
    cube([2*r,r,h]);
    translate([3*r,r,-1])
    cylinder(r=r,h=h+2);
    }
    difference()
    {
    translate([0,r,0])
    cube([r,2*r,h]);
    translate([r,3*r,-1])
    cylinder(r=r,h=h+2);
    }
}

module roundCube(r, w, d, h)
{
    hull()
    {
        translate([r,r,r])
        sphere(r);
        translate([w-r,r,r])
        sphere(r);
        translate([w-r,d-r,r])
        sphere(r);
        translate([r,d-r,r])
        sphere(r);
        translate([r,r,h])
        cylinder(r=r);
        translate([w-r,r,h])
        cylinder(r=r);
        translate([w-r,d-r,h])
        cylinder(r=r);
        translate([r,d-r,h])
        cylinder(r=r);
    }
}

module roundFlatCube(r, w, d, h)
{
    hull()
    {
        translate([r,r,0])
        cylinder(r=r);
        translate([w-r,r,0])
        cylinder(r=r);
        translate([w-r,d-r,0])
        cylinder(r=r);
        translate([r,d-r,0])
        cylinder(r=r);
        translate([r,r,h])
        cylinder(r=r);
        translate([w-r,r,h])
        cylinder(r=r);
        translate([w-r,d-r,h])
        cylinder(r=r);
        translate([r,d-r,h])
        cylinder(r=r);
    }
}