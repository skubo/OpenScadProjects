plate=false;
pole=true;
startplate=false;
$fn=64;

nupsi_diameter = 9;
nupsi_height = 7;

stand_diameter=15;
stand_height=60;
stand_center_offset=60;

plate_width=156;
plate_depth=66;
plate_height=2;
plate_radius=7.5;

gap = 0.2;

// pole
if (pole==true)
{
    translate([0,0,stand_height])
    cylinder(r=nupsi_diameter/2,nupsi_height);
    difference()
    {
        cylinder(r=stand_diameter/2,stand_height);
        translate([0,0,-gap])
        cylinder(r=nupsi_diameter/2 + gap,nupsi_height);
    }
}

if (plate==true)
{
    difference()
    {
        hull()
        {
            cylinder(r=plate_radius,plate_height);
            translate([plate_width,0,0])
            cylinder(r=plate_radius,plate_height);
            translate([plate_width,plate_depth,0])
            cylinder(r=plate_radius,plate_height);
            translate([0,plate_depth,0])
            cylinder(r=plate_radius,plate_height);
        }
        if (startplate==false)
        {
            translate([0,0,-gap])
            cylinder(r=nupsi_diameter/2 + gap,nupsi_height);
            translate([0,plate_depth,-gap])
            cylinder(r=nupsi_diameter/2 + gap,nupsi_height);
            translate([plate_width,plate_depth,-gap])
            cylinder(r=nupsi_diameter/2 + gap,nupsi_height);
            translate([plate_width, 0,-gap])
            cylinder(r=nupsi_diameter/2 + gap,nupsi_height);
        }
    }

    if (startplate==true)
    {
        translate([0,0,plate_height])
        cylinder(r=nupsi_diameter/2,nupsi_height);
        translate([0,plate_depth,plate_height])
        cylinder(r=nupsi_diameter/2,nupsi_height);
        translate([plate_width,plate_depth,plate_height])
        cylinder(r=nupsi_diameter/2,nupsi_height);
        translate([plate_width,0,plate_height])
        cylinder(r=nupsi_diameter/2,nupsi_height);
    }
}