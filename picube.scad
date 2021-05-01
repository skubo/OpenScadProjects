// The Pi Cube (with USB SSD internal drive)

$fn=64;

m3 = 3;

cube_dim = 150;
cube_corner_radius = 5;
cube_wall = 2;

foot_r = 12;
foot_thick = 2;
foot_h = 4;
foot_inset = 5;

grill_hole_len=10;

difference()
{
    rounded_cube(cube_corner_radius, cube_dim, cube_dim, cube_dim);
    translate([cube_wall, cube_wall, cube_wall])
    rounded_cube(cube_corner_radius-cube_wall, cube_dim-cube_wall*2, cube_dim-cube_wall*2,, cube_dim-cube_wall*2);
    
    translate([+cube_dim/2,+3*cube_dim/2,cube_dim/2])
    rotate([90,0,0])
    raute(grill_hole_len, m3, cube_dim*2);
}

f_i=foot_inset + cube_corner_radius+foot_r;

translate([f_i,f_i,-foot_h])
foot(foot_r, foot_r-foot_thick/2, m3, foot_thick,, foot_h);

translate([cube_dim-f_i,f_i,-foot_h])
foot(foot_r, foot_r-foot_thick/2, m3, foot_thick,, foot_h);

translate([f_i,cube_dim-f_i,-foot_h])
foot(foot_r, foot_r-foot_thick/2, m3, foot_thick,, foot_h);

translate([cube_dim-f_i,cube_dim-f_i,-foot_h])
foot(foot_r, foot_r-foot_thick/2, m3, foot_thick,, foot_h);

module raute(side_len, corner_r, h)
{
    rotate([0,0,45])
    hull()
    {
        translate([corner_r, corner_r, 0])
        cylinder(r=corner_r, h);
        
        translate([side_len-corner_r, corner_r, 0])
        cylinder(r=corner_r, h);

        translate([corner_r, side_len - corner_r, 0])
        cylinder(r=corner_r, h);

        translate([side_len-corner_r, side_len-corner_r, 0])
        cylinder(r=corner_r, h);
    }
}

module rounded_cube(radius, width, depth, height)
{
    hull()
    {
        translate([radius,radius,radius])
        sphere(r=radius);
        
        translate([width-radius,radius,radius])
        sphere(r=radius);

        translate([width-radius,depth-radius,radius])
        sphere(r=radius);

        translate([radius,radius,height-radius])
        sphere(r=radius);

        translate([radius,depth-radius,radius])
        sphere(r=radius);

        translate([width-radius,radius,height-radius])
        sphere(r=radius);

        translate([radius,depth-radius,height-radius])
        sphere(r=radius);

        translate([width-radius,depth-radius, height-radius])
        sphere(r=radius);
    }
}

module foot(outer_r, inner_r, screw_r, plate_h, foot_h)
{
    difference()
    {
        cylinder(h=foot_h, r=outer_r);
        translate([0,0,-plate_h])
        cylinder(h=foot_h, r=inner_r);
        translate([0,0,1])
        cylinder(h=foot_h, r=screw_r);
    }
}