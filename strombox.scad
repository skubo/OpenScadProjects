$fn=64;
h=40;
l=120;
w=60;
wall=3;
screw=1.5;
r=5;

xt60h=9;
xt60w=16;
xt60d=24;

meter_w=46;
meter_l=27;

mount_l=53;
mount_w=39;
mount_inset=18;
r2=r;

deckel=true;

if (!deckel)
{
    translate([mount_inset,w/2-mount_w/2,wall])
    difference()
    {
        cylinder(r=r2,h=wall*2);
        translate([0,0,-1])
        cylinder(r=screw,h=wall*2+2);
    }
    translate([mount_inset+mount_l,w/2-mount_w/2,wall])
    difference()
    {
        cylinder(r=r2,h=wall*2);
        cylinder(r=screw,h=wall*2+2);
    }
    translate([mount_inset,w/2+mount_w/2,wall])
    difference()
    {
        cylinder(r=r2,h=wall*2);
        cylinder(r=screw,h=wall*2+2);
    }
    translate([mount_inset+mount_l,w/2+mount_w/2,wall])
    difference()
    {
        cylinder(r=r2,h=wall*2);
        cylinder(r=screw,h=wall*2+2);
    }
}
difference()
{
    translate([0,0,0])
    {
        if (!deckel)
        {
           translate([r2,r2,0])
            cylinder(r=r2, h=h);
            translate([r2,w-r2,0])
            cylinder(r=r2, h=h);
            translate([l-r2,r2,0])
            cylinder(r=r2, h=h);
            translate([l-r2,w-r2,0])
            cylinder(r=r2, h=h);
            difference()
            {
                roundbox(r,h,w,l);
                translate([wall,wall,wall])
                roundbox(r-1, h, w-wall*2,l-wall*2);
            }
        }
        
        if (deckel)
        {
            difference()
            {
                translate([0,0,wall*2+h*2])
                roundbox(r, wall, w,l);
                translate([l-meter_l-15, w/2-meter_w/2,h*2])
                cube([meter_l, meter_w,30]);
            }
        }
    }
        translate([r2,r2,wall+h/2])
        cylinder(r=screw, h=1000);
        translate([l-r2,r2,wall+h/2])
        cylinder(r=screw, h=1000);
        translate([r2,w-r2,wall+h/2])
        cylinder(r=screw, h=1000);
        translate([l-r2,w-r2,wall+h/2])
        cylinder(r=screw, h=1000);

    if (!deckel)
    {
        translate([l-xt60d+0.01, w/2,wall])
        cube([xt60d,xt60w,xt60h]);
        
        translate([-1,w/2-5,6+wall])
        rotate([0,90,0])
        cylinder(r=6,h=3*wall);
    }
}

if (!deckel)
{
    difference()
    {
        translate([l-xt60d+0.01-2, w/2-2,wall])
        cube([xt60d+2-wall,xt60w+4,3]);

        translate([l-xt60d+0.01, w/2,wall])
        cube([xt60d,xt60w,xt60h]);
    }
}
if (deckel)
{
    stempel=h-xt60h-wall;
    translate([l-3*wall-2*wall, w/2-2,h+2*wall])
    translate([wall-0.2,2,xt60h+wall])
    cube([3*wall,xt60w, stempel]);
}
module roundbox(rad, height,width,length)
{
    hull()
    {
        
        translate([rad,rad,0])
        cylinder(r=rad, h=height);

        translate([length-rad,rad,0])
        cylinder(r=rad, h=height);

        translate([rad,width-rad,0])
        cylinder(r=rad, h=height);

        translate([length-rad,width-rad,0])
        cylinder(r=rad, h=height);
        
    }
}

