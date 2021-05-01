$fn=64;
length=22;
diameter=10;
corner_r=3;
wall=0.4;
elements=10;

corner_angle=90;
gap=0.2;

cube_tube(corner_r, length, diameter, wall, elements);

//translate([-20, -wall-2*gap,-wall-gap])
//corner_connector(corner_r, diameter, wall, corner_angle, gap);

module cube_tube(r, l, d, w, e)
{
    difference()
    {
        for (i = [0:1:e-1])
        {
            translate([i*(l + r*2),0,0])
            hollow_rounded_cube(r, l, d, w);
        } 
        translate([-r - 0.01, r/2, r/2])
        semi_rounded_cube(r/2, (l+r*2)*e + 0.02, d-r+wall/2);
        
    }
    difference()
    {
        translate([-r, r/2, r/2])
        semi_rounded_cube(r/2, (l+r*2)*e, d-r+wall/2);
        translate([-r -10, r/2, r/2])
        semi_rounded_cube(r/2 - wall, (l+r*2)*e + 20, d-r);
    }
}
module hollow_rounded_cube(r, l, d, w)
{
    difference()
    {
        rounded_cube(r, l, d);
        translate([w,0,0]);
        rounded_cube(r-w, l-w*2, d-w*2);
    }
}
module rounded_cube(r, l, d)
{
    hull()
    {
        hull()
        {
            hull()
            {
                sphere(r=r);
                translate([l,0,0])
                sphere(r=r);
            }
            hull()
            {
                translate([0,d,0])
                sphere(r=r);
                translate([l,d,0])
                sphere(r=r);
            }
        }
        translate([0,0,d])
        hull()
        {
            hull()
            {
                sphere(r=r);
                translate([l,0,0])
                sphere(r=r);
            }
            hull()
            {
                translate([0,d,0])
                sphere(r=r);
                translate([l,d,0])
                sphere(r=r);
            }
        }
    }
}

module semi_rounded_cube(r, l, d)
{
    rotate([0,90,0])
    translate([-d,0,0])
    linear_extrude(l)
    hull()
    {
        circle(r=r);
        translate([0,d,0])
        circle(r=r);
        translate([d,0,0])
        circle(r=r);
        translate([d,d,0])
        circle(r=r);
    }
}

module rounded_corner(r, d)
{
    rotate(a=[0,-90,90])
    rotate_extrude(angle=90, convexity=12)
    translate([d, 0]) 
    hull()
    {
        circle(r=r);
        translate([0,d,0])
        circle(r=r);
        translate([d,0,0])
        circle(r=r);
        translate([d,d,0])
        circle(r=r);
    }
}

// g: gap
module corner_connector(r, d, w, a, g)
{
    out_d=d+2*w+2*g;
    in_d=d+2*g;

    difference()
    {
        corner(r, out_d, in_d, d,a);
        translate([0.01,w+g,w])
        rounded_cube(r, out_d*2+r, in_d);
        rotate(a=[0,a,0])
        translate([-d,w,w])
        rounded_cube(r, out_d*2+r, in_d);
    }
}

module corner(r, out_d, in_d, d, a)
{
    rounded_cube(r, out_d*2, out_d);
    rotate(a=[0,a,0])
    translate([-d,0,0])
    rounded_cube(r, out_d*2, out_d);
}
