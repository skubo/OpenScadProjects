corner_r=2.5;
inner_w=63;
inner_h=38;
inner_d=10;

buckle=25;
buckle_inset=4;
back_bulg=30;
bulg_inset_top=6;
buld_inset_bottom=12;
lens=36;
lens_d=23;
lens_inset_top=5;
lens_inset_bottom=8.5;

buttons_inset=13;
buttons_width=13;

sdcard_inset_top=7;
sdcard_width=19;

lenscover_cutout=21;
lenscover_inset=5.5;
lenscover_height=12;

airhole_r=2;
airhole_distance=7.5;
airhole_offset=1.5;

thickness = 3;

$fn=64;

difference()
{
    // outer hull
    rounded_rect(corner_r, inner_w + corner_r/2 - thickness/2 , inner_h + thickness, inner_d + thickness);

    // inner cut
    translate([-thickness/2,thickness/2, thickness/2])
    rounded_rect(corner_r, inner_w, inner_h, inner_d);

    // back bulg cutout
    translate([-thickness/2,thickness/2, thickness/2])
    translate([0,bulg_inset_top,-thickness])
    cube([inner_w-back_bulg, inner_h - bulg_inset_top - buld_inset_bottom, inner_d]);

    // buckle cutout
    translate([-thickness/2,thickness/2, thickness/2])
    translate([0,25.5,-thickness])
    cube([inner_w-buckle, inner_h - buckle_inset - 25, inner_d]);

    // front lens cutout
    translate([-thickness/2,thickness/2, thickness/2])
    translate([0,lens_inset_top,2*thickness])
    cube([inner_w-lens+thickness/2, inner_h - lens_inset_top - lens_inset_bottom, inner_d]);

    // buttons cutout
    translate([-thickness/2,thickness/2, thickness/2])
    translate([inner_w-buttons_inset-buttons_width+2*thickness,-inner_h+buttons_width + thickness,-inner_d/2 + thickness/2])
    cube([buttons_width, inner_h - lens_inset_top - lens_inset_bottom, inner_d]);

    // sd card cutout
    translate([-thickness/2,thickness/2, thickness/2])
    translate([inner_w-sdcard_inset_top,sdcard_inset_top ,-inner_d/2 + 2*thickness/2])
    cube([buttons_width, inner_h - lens_inset_top - lens_inset_bottom, inner_d]);
    
    // air holes
    translate([inner_w/2 + thickness/2, inner_h/2-airhole_offset,inner_d/2])
    {
        translate([0, -airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance, -airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance*2, -airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance*3, -airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        

        cylinder(r=airhole_r, h=50);
        translate([airhole_distance, 0,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance*2, 0,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance*3, 0,0])
        cylinder(r=airhole_r, h=50);

        translate([0, airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance, airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance*2, airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance*3, airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        
        translate([0, 2*airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance, 2*airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance*2, 2*airhole_distance,0])
        cylinder(r=airhole_r, h=50);
        translate([airhole_distance*3, 2*airhole_distance,0])
        cylinder(r=airhole_r, h=50);
    }
}

translate([-corner_r,0,inner_d+5.5])
rotate([0,90,0])
difference()
{
    rounded_box(corner_r, inner_d+thickness, inner_h+thickness, 4);
    translate([thickness/2,thickness/2,-1])
    rounded_box(corner_r, inner_d, inner_h, 7);
}

// lense cover
translate([0,thickness/2, 0])
translate([1,lenscover_inset-thickness/2,lenscover_height -0.5])
{
    difference()
    {
        rounded_box(corner_r, lenscover_cutout + thickness, lenscover_cutout + thickness, lenscover_height);
        translate([thickness/2,thickness/2, -thickness/2])
        rounded_box(corner_r, lenscover_cutout, lenscover_cutout, lenscover_height*2);
    }
}

// outer hull
module rounded_rect(rad, w, h, d)
{
    hull()
    {
        translate([rad,rad,rad])
        sphere(r=rad);
        translate([rad,rad,d])
        sphere(r=rad);
        translate([w,rad,rad])
        sphere(r=rad);
        translate([w,rad,d])
        sphere(r=rad);
        translate([w,h,rad])
        sphere(r=rad);
        translate([w,h,d])
        sphere(r=rad);
        translate([rad,h,rad])
        sphere(r=rad);
        translate([rad,h,d])
        sphere(r=rad);
    }
}

module rounded_box(rad, w, h, d)
{
    hull()
    {
        translate([rad,rad,rad])
        cylinder(r=rad);
        translate([rad,rad,d])
        cylinder(r=rad);
        translate([w,rad,rad])
        cylinder(r=rad);
        translate([w,rad,d])
        cylinder(r=rad);
        translate([w,h,rad])
        cylinder(r=rad);
        translate([w,h,d])
        cylinder(r=rad);
        translate([rad,h,rad])
        cylinder(r=rad);
        translate([rad,h,d])
        cylinder(r=rad);
    }
}
