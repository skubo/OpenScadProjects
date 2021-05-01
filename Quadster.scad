rail_len = 300;
rail_wid = 15;
rail_hei = 8;
quad_distance = 90;
number_of_quads = rail_len / quad_distance;
nupsi_offset = 6;
nupsi = rail_wid - nupsi_offset;
stecker_hei = rail_hei / 2;
stem_hei=100;
arm_dist = 10;
quer_len = 80;

show_rail_left=true;
show_rail_right=true;
show_stecker=true;
show_stand=true;

if (show_rail_right)
{
    // bottom rail right
    difference()
    {
        cube([rail_len, rail_wid, rail_hei]);
        for (dist = [0 : 1 : number_of_quads])
        {
            translate([nupsi_offset/2 + (dist * quad_distance) -0.1,(nupsi_offset - 0.2)/2,-1])
            cube([nupsi+0.2,nupsi+0.2,rail_hei+2]);

            translate([quad_distance/2 + (dist * quad_distance) - 0.2 , nupsi_offset + 0.01, -1])
            cube([nupsi+1.2, nupsi+0.2, stecker_hei+1.2]);
        }
        translate([rail_len - nupsi -0.2, (nupsi_offset - 0.2)/2 , -1])
        cube([nupsi+1.2, nupsi + 0.2, stecker_hei+1.2]);
    }
    translate([-nupsi, nupsi_offset/2, 0])
    cube([nupsi, nupsi, stecker_hei]);
}

if (show_rail_left)
{
    // bottom rail left
    translate([0,quer_len+2*(rail_wid + nupsi/2),0])
    {
    difference()
    {
        cube([rail_len, rail_wid, rail_hei]);
        for (dist = [0 : 1 : number_of_quads])
        {
            translate([nupsi_offset/2 + (dist * quad_distance) +0.2,(nupsi_offset +0.2)/2,-1])
            cube([nupsi,nupsi,rail_hei+2]);

            translate([quad_distance/2 + (dist * quad_distance) +0.2 , - 0.01, -1])
            cube([nupsi+1, nupsi, stecker_hei+1.2]);
        }
        translate([rail_len - nupsi -0.2, (nupsi_offset - 0.2)/2 , -1])
        cube([nupsi+1, nupsi +0.2, stecker_hei+1.2]);
    }
    translate([-nupsi, nupsi_offset/2, 0])
    cube([nupsi, nupsi, stecker_hei]);
    }
}

if (show_stecker)
{
    // querbalken
    translate([quad_distance/2 + quad_distance +0.2,rail_wid/2 + 2*nupsi,0])
    {
        cube([rail_wid, quer_len, rail_hei]);
        translate([nupsi_offset/2, -nupsi, 0])
        cube([nupsi, nupsi, stecker_hei]);
        translate([nupsi_offset/2, quer_len, 0])
        cube([nupsi, nupsi, stecker_hei]);
    }
}

if (show_stand)
{
    // stand
    translate([nupsi_offset/2, nupsi_offset/2,0])
    cube([nupsi,nupsi,rail_hei]);
    translate([0,0,rail_hei])
    cube([rail_wid, rail_wid, stem_hei]);

    translate([-(rail_wid/2 + arm_dist/2),0,rail_hei + stem_hei])
    rotate([0,3,0])
    cube([rail_wid, rail_wid, stem_hei]);
    translate([(rail_wid + arm_dist)/2,0,rail_hei + stem_hei])
    rotate([0,7,0])
    cube([rail_wid, rail_wid, stem_hei]);
    translate([-(rail_wid + arm_dist)/2,0,stem_hei+rail_hei - rail_wid])
    cube([rail_wid *2 + arm_dist, rail_wid, rail_wid]);
}