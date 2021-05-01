// this is a tube based design, no idea if it'll fly or how sturdy it'll be

$fn=128; // 32 renders ok, 64 looks better, but takes minutes on my machine, 128 will take very very long

frame=false;
canopy=false;
standoff_canopy=true;
standoffs=false;

tube_r=3;
arm_d=70;
arm_w=37.5;
angle=145;
offset=0;
base_cut_off=38;
base_cut_r = 27;
base_thick = 3;

canopy_mount_d = 16;
canopy_screw = 3;
canopy_mount_off = 4;
canopy_mount_height = 5;
canopy_mount_spare = 55;
canopy_thick = 4;

nut_trap_h = 5.5;
motor_plate_thick = 3;

battery_strap_slut_l = 20;
battery_strap_slut_d = 2.5;

camera_r = 10.6;
camera_cutout_depth = 20;
camera_cutout_height = 13;
camera_prot_topcut = 30;
camera_prot_frontcut = 38;
camera_protection_distance = 1;
camera_protection_buckle_h = 7;
camera_mount_inset = 15;
camera_width=21;
camera_holder_r = 24;
camera_holder_y = 35;
camera_holder_z = 35;

antenna_hole=4;
antenna_thick=1.5;
antenna_h=10;
antenna_angle=45;
antenna_off_y=28;
antenna_off_z=26;

standoff_height=30;
standoff_r=2.5;

standoff_canopy_w= 20;
standoff_antenna_z = -2;
standoff_antenna_h = 15;
prop_5_1 = 129.5;

// prop sim
/*
translate([out_off, - out_off,10])
difference()
{
    cylinder(r=prop_5_1/2, h=3);
    translate([0,0,-0.5])
    cylinder(r=prop_5_1/2 - 10, h=4);
}*/

// camera sim
/*
translate([-21/2,20,8])
rotate([30,0,0])
cube([21,21,21]);
*/


if (standoff_canopy == true)
{
    if (standoffs == true)
    {
        translate([canopy_mount_d/2, arm_d/2 - canopy_mount_off, 0])
        cylinder(r=standoff_r, h=standoff_height);
        
        translate([-canopy_mount_d/2, arm_d/2 - canopy_mount_off, 0])
        cylinder(r=standoff_r, h=standoff_height);

        translate([-canopy_mount_d/2, - arm_d/2 + canopy_mount_off, 0])
        cylinder(r=standoff_r, h=standoff_height);

        translate([canopy_mount_d/2, - arm_d/2 + canopy_mount_off, 0])
        cylinder(r=standoff_r, h=standoff_height);
    }
    // lift z axis
    translate([0,0,standoff_height])
    {
        difference()
        {
            hull()
            {
                translate([canopy_mount_d/2, arm_d/2 - canopy_mount_off, 0])
                cylinder(r=standoff_r, h=base_thick);

                translate([canopy_mount_d/2 + 2* standoff_r, 
                            arm_d/2 - canopy_mount_off, 
                            0])
                cylinder(r=standoff_r, h=base_thick);
            }
            translate([canopy_mount_d/2, arm_d/2 - canopy_mount_off, -1])
            cylinder(r=1.5, h=7);

            translate([-canopy_mount_d/2, arm_d/2 - canopy_mount_off, -1])
            cylinder(r=1.5, h=7);
        }
        difference()
        {
            hull()
            {
                translate([-canopy_mount_d/2, arm_d/2 - canopy_mount_off, 0])
                cylinder(r=standoff_r, h=base_thick);

                translate([-(canopy_mount_d/2 + 2* standoff_r), 
                            arm_d/2 - canopy_mount_off, 
                            0])
                cylinder(r=standoff_r, h=base_thick);
            }
            translate([canopy_mount_d/2, arm_d/2 - canopy_mount_off, -1])
            cylinder(r=1.5, h=7);

            translate([-canopy_mount_d/2, arm_d/2 - canopy_mount_off, -1])
            cylinder(r=1.5, h=7);
        }
        hull()
        {
            translate([canopy_mount_d/2 + 2*standoff_r, 
                        arm_d/2 - canopy_mount_off + 3*standoff_r, 
                        0])
            cylinder(r=standoff_r, h=base_thick);

            translate([canopy_mount_d/2 + 2*standoff_r, 
                        -(arm_d/2 - canopy_mount_off + 3*standoff_r), 
                        0])
            cylinder(r=standoff_r, h=base_thick);
        }
        hull()
        {
            translate([-(canopy_mount_d/2 + 2*standoff_r), 
                        arm_d/2 - canopy_mount_off + 3*standoff_r, 
                        0])
            cylinder(r=standoff_r, h=base_thick);

            translate([-(canopy_mount_d/2 + 2*standoff_r), 
                        -(arm_d/2 - canopy_mount_off + 3*standoff_r), 
                        0])
            cylinder(r=standoff_r, h=base_thick);
        }
        difference()
        {
            hull()
            {
                translate([canopy_mount_d/2 + 2* standoff_r, 
                            10, 
                            0])
                cylinder(r=standoff_r, h=base_thick);

                translate([-(canopy_mount_d/2 + 2* standoff_r), 
                            10, 
                            0])
                cylinder(r=standoff_r, h=base_thick);

                translate([canopy_mount_d/2 + 2*standoff_r, 
                            -(arm_d/2 - canopy_mount_off + 3*standoff_r), 
                            0])
                cylinder(r=standoff_r, h=base_thick);
                translate([-(canopy_mount_d/2 + 2*standoff_r), 
                            -(arm_d/2 - canopy_mount_off + 3*standoff_r), 
                            0])
                cylinder(r=standoff_r, h=base_thick);
            }
            // antenna holder
            translate([0,-antenna_off_y,standoff_antenna_z])
            rotate([antenna_angle,0,0])
            cylinder(r=antenna_hole/2,h=standoff_antenna_h+2);
            translate([canopy_mount_d/2, -arm_d/2 + canopy_mount_off, -1])
            cylinder(r=1.5, h=7);

            translate([-canopy_mount_d/2, -arm_d/2 + canopy_mount_off, -1])
            cylinder(r=1.5, h=7);
            
        }
        // antenna holder
        difference()
        {
            translate([0,-antenna_off_y,standoff_antenna_z])
            rotate([antenna_angle,0,0])
            difference()
            {
                cylinder(r=antenna_hole/2+antenna_thick,h=standoff_antenna_h);
                translate([0,0,-1])
                cylinder(r=antenna_hole/2,h=standoff_antenna_h+2);
            }
            translate([0,-antenna_off_y,standoff_antenna_z])
                translate([-10,-10,-20+base_thick])
                cube([20,20,20]);
        }

            translate([-11, 18,16.2])
            rotate([0,90,0])
            cylinder(r=standoff_r, h=22);
        // protection arches
        
        difference()
        {
            union()
            {
            translate([-11, arm_d/2 - canopy_mount_off - 6, 5])
            rotate([0,90,0])
            cylinder(r=standoff_r+13, h=base_thick+1);

            translate([+7, arm_d/2 - canopy_mount_off - 6, 5])
            rotate([0,90,0])
            cylinder(r=standoff_r+13, h=base_thick+1);
            }
            translate([-25, arm_d/2 - canopy_mount_off - 6, 5])
            rotate([0,90,0])
            cylinder(r=1, h=50);

            translate([-25,0,-50])
            cube([50,50,50]);
            
            translate([canopy_mount_d/2, arm_d/2 - canopy_mount_off, base_thick])
            cylinder(r=standoff_r, h=7);

            translate([-canopy_mount_d/2, arm_d/2 - canopy_mount_off, base_thick])
            cylinder(r=standoff_r, h=7);
            translate([canopy_mount_d/2, arm_d/2 - canopy_mount_off, -1])
            cylinder(r=1.5, h=7);

            translate([-canopy_mount_d/2, arm_d/2 - canopy_mount_off, -1])
            cylinder(r=1.5, h=7);
        }
    }
}

if (frame == true) {
    translate([-arm_d - arm_w,0,0])
    rotate( - angle/2)
    arch(tube_r, arm_d, angle); 

    out_r = 14.5;
    out_angle = 360 ;
    out_off = arm_d + out_r/2 + tube_r/2;

    translate([0,-arm_d - arm_w,0])
    rotate(90 - angle/2)
    arch(tube_r, arm_d, angle); 

    translate([arm_d + arm_w,0,0])
    rotate(180 - angle/2)
    arch(tube_r, arm_d, angle); 

    translate([0,arm_d + arm_w,0])
    rotate(270 - angle/2)
    arch(tube_r, arm_d, angle); 

    // motor plates
    translate([-out_off,-out_off,0])
    motor(tube_r, out_r, 90);

    translate([out_off, out_off,0])
    motor(tube_r, out_r, -90);

    translate([-out_off, out_off,0])
    motor(tube_r, out_r, 0);

    translate([out_off, - out_off,0])
    motor(tube_r, out_r, 180);

    // center plate
    arch(tube_r, arm_d/2 + tube_r, 360); // ring

    translate([0,0,-tube_r])
    difference()
    {
        cylinder(r=arm_d/2+tube_r, h=base_thick);
        translate([base_cut_off, base_cut_off,-1])
        cylinder(r=base_cut_r, h=5);
        translate([-base_cut_off, base_cut_off,-1])
        cylinder(r=base_cut_r, h=5);
        translate([-base_cut_off, -base_cut_off,-1])
        cylinder(r=base_cut_r, h=5);
        translate([base_cut_off, -base_cut_off,-1])
        cylinder(r=base_cut_r, h=5);

        // stack mounts 20mm
        translate([10, 10,-1])
        cylinder(r=1, h=5);
        translate([-10, 10,-1])
        cylinder(r=1, h=5);
        translate([10, -10,-1])
        cylinder(r=1, h=5);
        translate([-10, -10,-1])
        cylinder(r=1, h=5);

        // stack mounts 30mm
        translate([15, 15,-1])
        cylinder(r=1.5, h=5);
        translate([-15, 15, -1])
        cylinder(r=1.5, h=5);
        translate([15, -15,-1])
        cylinder(r=1.5, h=5);
        translate([-15, -15,-1])
        cylinder(r=1.5, h=5);
        
        cut_r=4;
       hull()
        {
            translate([+arm_d/3,battery_strap_slut_l/2,-1])
            cylinder(r=battery_strap_slut_d/2, h=5);
            translate([+arm_d/3,- battery_strap_slut_l/2,-1])
            cylinder(r=battery_strap_slut_d/2, h=5);
        }
        hull()
        {
            translate([-arm_d/3,battery_strap_slut_l/2,-1])
            cylinder(r=battery_strap_slut_d/2, h=5);
            translate([-arm_d/3,- battery_strap_slut_l/2,-1])
            cylinder(r=battery_strap_slut_d/2, h=5);
        }
        hull()
        {
            translate([0,arm_d/3,-1])
            cylinder(r=cut_r, h=5);
            translate([0,arm_d/5,-1])
            cylinder(r=cut_r, h=5);
        }
        hull()
        {
            translate([0,-arm_d/3,-1])
            cylinder(r=cut_r, h=5);
            translate([0,-arm_d/5,-1])
            cylinder(r=cut_r, h=5);
        }

        translate([0,0,-1])
        cylinder(r=8, h=5);

        // canopy mounts
        translate([canopy_mount_d/2, arm_d/2 - canopy_mount_off, -1])
        cylinder(r=canopy_screw / 2, h=5);
        
        translate([-canopy_mount_d/2, arm_d/2 - canopy_mount_off, -1])
        cylinder(r=canopy_screw / 2, h=5);

        translate([-canopy_mount_d/2, - arm_d/2 + canopy_mount_off, -1])
        cylinder(r=canopy_screw / 2, h=5);

        translate([canopy_mount_d/2, - arm_d/2 + canopy_mount_off, -1])
        cylinder(r=canopy_screw / 2, h=5);
    }
}

if (canopy == true)
{
    // antenna holder
    translate([0,-antenna_off_y,antenna_off_z])
    rotate([antenna_angle,0,0])
    difference()
    {
        cylinder(r=antenna_hole/2+antenna_thick,h=antenna_h);
        translate([0,0,-1])
        cylinder(r=antenna_hole/2,h=antenna_h+2);
    }
    // hoodie
    sph_r=arm_w+tube_r;
    difference()
    {
        half_cut_sphere(sph_r,canopy_thick, battery_strap_slut_l);
        // camera hole
        translate([0,16,23])
        rotate([-42,0,0])
        hull()
        {
            cylinder(r=camera_r, h=camera_cutout_depth);
            translate([0,camera_cutout_height,0])
            cylinder(r=camera_r, h=camera_cutout_depth);
        }
        // front and back arm cutout
        translate([0,-arm_d - arm_w,0])
        rotate(90 - angle/2)
        arch(tube_r+0.1, arm_d, angle); 

        translate([0,arm_d + arm_w,0])
        rotate(270 - angle/2)
        arch(tube_r+0.1, arm_d, angle); 

        translate([0,-antenna_off_y,antenna_off_z])
        rotate([antenna_angle,0,0])
        cylinder(r=antenna_hole/2+antenna_thick,h=antenna_h);
    }

    // enforcement
    difference()
    {
        half_cut_sphere(sph_r +1.5,
                        10, 
                        21);
        translate([0,0,-0.1])
        half_cut_sphere(sph_r + canopy_thick+camera_protection_buckle_h-2,
                        sph_r + camera_protection_buckle_h + 4, 
                        21 +1.5);
    }

    // camera mount holes
    intersection()
    {
        sphere(r=arm_w+tube_r - canopy_thick/2);
        difference()
        {
            union()
            {
                translate([camera_r,camera_holder_y,camera_holder_z])
                rotate([0,90,0])
                cylinder(r= camera_holder_r, h=2);
                translate([-camera_r,camera_holder_y,camera_holder_z])
                rotate([0,90,0])
                cylinder(r= camera_holder_r, h=2);
            }
            cam_hole_h = camera_r*3;

            translate([-cam_hole_h/2, 23, 17])
            rotate([30,0,0])
            {
                rotate([0,90,0])
                cylinder(r=1, h=cam_hole_h);

                translate([0,0,5])
                rotate([0,90,0])
                cylinder(r=1, h=cam_hole_h);

                translate([0,0,10])
                rotate([0,90,0])
                cylinder(r=1, h=cam_hole_h);
            }

            translate([-cam_hole_h/2, 27, 16])
            rotate([30,0,0])
            {
                rotate([0,90,0])
                cylinder(r=1, h=cam_hole_h);

                translate([0,0,5])
                rotate([0,90,0])
                cylinder(r=1, h=cam_hole_h);

                translate([0,0,10])
                rotate([0,90,0])
                cylinder(r=1, h=cam_hole_h);
            }
        }
    }
    // camera protector
    difference()
    {
        difference()
        {
            half_cut_sphere(sph_r +camera_protection_buckle_h,
                            2*camera_protection_buckle_h, 
                            sph_r - camera_r );
            half_cut_sphere(sph_r + canopy_thick+camera_protection_buckle_h,
                            sph_r + camera_protection_buckle_h, 
                            sph_r- camera_r +2);

        
            // mount inset cutout
/*            translate([-50,0,-100 - canopy_thick])
            rotate([45,0,0])
            cube([100,100,100]);*/
            
        }
        translate([-50,-50,camera_prot_topcut])
        rotate([10,0,0])
        cube([100,100,100]);
        translate([-50,camera_prot_frontcut,0])
        rotate([-12,0,0])
        cube([100,100,100]);
        translate([-50,-100,0])
        cube([100,100,100]);

        // front and back arm cutout
        translate([0,-arm_d - arm_w,0])
        rotate(90 - angle/2)
        arch(tube_r+0.1, arm_d, angle); 

        translate([0,arm_d + arm_w,0])
        rotate(270 - angle/2)
        arch(tube_r+0.1, arm_d, angle); 
    }

    difference()
    {
        sphere(r=arm_w+tube_r - canopy_thick/2);
        translate([-arm_w,-arm_w, canopy_mount_height])
        cube([arm_w*2,arm_w*2,arm_w*2]);

        cube = arm_w*2 + 10;
        translate([-cube/2,-cube/2,-cube])
        cube([cube, cube, cube]);
        translate([cube/2-battery_strap_slut_l,-cube/2, -5])
        cube([cube, cube, cube]);
        translate([-cube - cube/2 + battery_strap_slut_l,-cube/2, -5])
        cube([cube, cube, cube]);
        
        translate([base_cut_off, base_cut_off,-1])
        cylinder(r=base_cut_r, h=canopy_mount_height+1.1);
        translate([-base_cut_off, base_cut_off,-1])
        cylinder(r=base_cut_r, h=canopy_mount_height+1.1);
        translate([-base_cut_off, -base_cut_off,-1])
        cylinder(r=base_cut_r, h=canopy_mount_height+1.1);
        translate([base_cut_off, -base_cut_off,-1])
        cylinder(r=base_cut_r, h=canopy_mount_height+1.1);
        
        translate([-canopy_mount_spare,-canopy_mount_spare/2,-1])
        cube([canopy_mount_spare*2, canopy_mount_spare, canopy_mount_height+1.1]);
        
        // screw / nut cutout
        nut_z = canopy_mount_height + base_thick -nut_trap_h;
        translate([canopy_mount_d/2, arm_d/2 - canopy_mount_off, nut_z])
        {
            nut_trap();
            translate([0,0,-3])
            cylinder(r=canopy_screw / 2, h=canopy_mount_height);
        }
        translate([-canopy_mount_d/2, arm_d/2 - canopy_mount_off, nut_z])
        {
            nut_trap();
            translate([0,0,-3])
            cylinder(r=canopy_screw / 2, h=canopy_mount_height);
        }

        translate([-canopy_mount_d/2, - arm_d/2 + canopy_mount_off, nut_z])
        {
            nut_trap();
            translate([0,0,-3])
            cylinder(r=canopy_screw / 2, h=canopy_mount_height);
        }

        translate([canopy_mount_d/2, - arm_d/2 + canopy_mount_off, nut_z])
        {
            nut_trap();
            translate([0,0,-3])
            cylinder(r=canopy_screw / 2, h=canopy_mount_height);
        }
        
        // center plate ring cutout
        arch(tube_r+0.1, arm_d/2 + tube_r, 360); // ring

        // front and back arm cutout
        translate([0,-arm_d - arm_w,0])
        rotate(90 - angle/2)
        arch(tube_r+0.1, arm_d, angle); 

        translate([0,arm_d + arm_w,0])
        rotate(270 - angle/2)
        arch(tube_r+0.1, arm_d, angle); 
    }
}

module arch(ring_r, r, arch_angle)
{
    rotate_extrude(angle=arch_angle, convexity=1)
    translate([r, 0])
    {
        circle(ring_r);
    }
}

module motor(ring_r, r, a)
{
    rotate(a)
    {
        difference()
        {
            arch(ring_r, r, 360);
            translate([r, -r,-ring_r+motor_plate_thick])
            cylinder(r=r, h=6);
        }
        translate([0,0,-ring_r])
        difference()
        {
            cylinder(r=r, motor_plate_thick);

            // mounting cutout
            translate([0,0,-1.5])
            {
                cylinder(r=4, 6);
                
                hull()
                {
                    translate([8,0,0])
                    cylinder(r=1.5, 6);
                    translate([9.5,0,0])
                    cylinder(r=1.5, 6);
                }
                
                hull()
                {
                    translate([-8,0,0])
                    cylinder(r=1.5, 6);
                    translate([-9.5,0,0])
                    cylinder(r=1.5, 6);
                }
                
                hull()
                {
                    translate([0,8,0])
                    cylinder(r=1.5, 6);
                    translate([0,9.5,0])
                    cylinder(r=1.5, 6);
                }

                hull()
                {
                    translate([0,-8,0])
                    cylinder(r=1.5, 6);
                    translate([0,-9.5,0])
                    cylinder(r=1.5, 6);
                }
            }
        }
    }
}

module half_cut_sphere(s_r, thick, side)
{
    difference()
    {
        sphere(r=s_r);
        cube = arm_w*2 + 10;
        translate([-cube,-cube,-cube+0.1])
        cube([cube*2, cube*2, cube]);
        translate([cube/2-side,-cube/2, 0])
        cube([cube, cube, cube]);
        translate([-cube - cube/2 + side,-cube/2, 0])
        cube([cube, cube, cube]);

        sphere(r=s_r - thick/2);
    }
}

module nut_trap (
        w = 5.5,
        h = 3
        )
{
        cylinder(r = w / 2 / cos(180 / 6) + 0.05, h=h, $fn=6);
}  