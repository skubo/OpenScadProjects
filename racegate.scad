wall = 0.6;
radius = 8;
width = 12;
height = 275;
coupler_height = 60;
coupler_buffer = 1;
fullwidth = width+radius*2 +wall*2;

winkel_hollow(width, height, radius, wall);
//translate([0,0,-1.5*wall])
//coupler(width, coupler_height, radius, wall, coupler_buffer);

module coupler(w, h, r, t, cb)
{
    cw = w + 3*t;
    rotate([90,0,0])
    difference()
    {
        tonne(cw+t, h, r+t);
        translate([0,t,-t])
        tonne(cw,h+2*t,r);
    }
    translate([0,-h/2-cb/2,-t])
    buffer(w,r,t,cb);
}

module buffer(w, r, t, cb)
{
    difference()
    {
        translate([0,0,t])
        rotate([90,0,0])
        tonne(w+3*t, cb, r+t);
        translate([0,t,3.5*t])
        rotate([90,0,0])
        tonne(w, cb+2*t, r);
    }
}

module winkel_hollow(w, h, r, t)
{
    difference()
    {
        winkel_solid(width+wall, height, radius+wall);
        translate([0,0,1.5*t])
        winkel_solid(width, height+t, radius);
    }
}

module winkel_solid (w, h, r)
{
    corner(w, r);

    rotate([90,0,0])
    tonne(w, h, r);

    rotate([0,-90,0])
    translate([w/2 + r, -w/2 - r,0])
    tonne(w, h, r);

}

module tonne (w, h, r)
{
    linear_extrude(h, convexity=2)
    {
        polygon(concat([[0,0],
                    [w/2,0],
                    [r+w/2, r],
                    [r+w/2, r+w],
                    [w/2, 2*r+w],
                    [-w/2, 2*r+w],
                    [-r-w/2, r+w],
                    [-w/2-r, r],
                    [-w/2, 0],
                    ]));
    }

}

module corner (w, r)
{
    rotate_extrude(angle=90, convexity=2)
    {
        polygon(concat([[0,0],
                        [w/2,0],
                        [r+w/2, r],
                        [r+w/2, r+w],
                        [w/2, 2*r+w],
                        [0, 2*r+w]]));
    }
}