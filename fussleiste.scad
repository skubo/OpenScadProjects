$fn=64;
width=730;
height=6;
radius=22;
boden_breite=29;
loch_d=5;

kabel=5;

loch1=15;
loch2=192.5;
loch3=367.5;
loch4=543.5;
loch5=width- 14;

teil1=250;
teil2=500;

teil1_an=false;
teil2_an=true;
teil3_an=false;

difference()
{
    translate([radius,0,0])
    cylinder(r=radius, h=width);
    translate([height,-radius - height/2,-height])
    cube([radius*2,radius*2 + height, width+height*2]);

    translate([0,-1,0])
    {
        translate([0,0,loch1])
        bohrer();

        translate([0,0,loch2])
        bohrer();

        translate([0,-2,0])
        translate([0,0,loch3])
        bohrer();

        translate([0,0,loch4])
        bohrer();

        translate([0,0,loch5])
        bohrer();
    }

    translate([2,-50,loch1+5])
    cube([kabel,100,kabel]);

    if (teil1_an)
    {
        translate([-25,-25,teil1])
        cube([50,50,5000]);
    }
    if (teil2_an)
    {
        translate([-25,-25,teil2+2])
        cube([50,50,5000]);
        translate([-25,-25,-1])
        cube([50,50,teil1]);
    }
    if (teil3_an)
    {
        translate([-25,-25,-0.01])
        cube([50,50,teil2]);
    }
}


/*
translate([-boden_breite/2,-boden_breite/2,0])
cube([boden_breite,boden_breite,boden_breite]);
*/

module bohrer()
{
    rotate([0,90,0])
    translate([0,0,-height/2])
    cylinder(d=loch_d, h=height*2);
    
    kegelloch();
}

module kegelloch()
{
    rotate([0,90,0])
    cylinder(d1=8, d2=0, h=6);
}