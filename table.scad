$fn=64;
leghole_r=3.1;
tablehole_r=4.1;
plate_h=8;

nase_r=7.5;

legplate_w=90;
leghole1 = 15;
leghole2 = 40;

tableplate_w=105;
tableplate_inset=70;
tableplate_srew1=100;
tableplate_srew2=40;
tableplate_srew3=97.5;
platehole_r=4.9;
platehole1=15;
platehole2=30;
platehole3=47.5;

miter_h=2;
platehole_h=15 - miter_h;


translate([platehole2,platehole1,0])
cylinder(r=platehole_r, h=platehole_h+plate_h);
translate([platehole2,platehole1,platehole_h+plate_h])
cylinder(r1=platehole_r, r2=platehole_r-miter_h/2, h=miter_h);

translate([platehole2,platehole3,0])
cylinder(r=platehole_r, h=platehole_h+plate_h);
translate([platehole2,platehole3,platehole_h+plate_h])
cylinder(r1=platehole_r, r2=platehole_r-miter_h/2, h=miter_h);

difference()
{
    translate([nase_r,nase_r,0])
    {
        hull()
        {    
            cylinder(r=nase_r, h=plate_h);

            translate([legplate_w,0,0])
            cylinder(r=nase_r, h=plate_h);

            translate([0,legplate_w,0])
            cylinder(r=nase_r, h=plate_h);

            translate([tableplate_inset,tableplate_w,0])
            cylinder(r=nase_r, h=plate_h);

            translate([tableplate_w, tableplate_inset,0])
            cylinder(r=nase_r, h=plate_h);

            translate([tableplate_w,tableplate_w,0])
            cylinder(r=nase_r, h=plate_h);
        }
    }        
    // leg holes
    translate([leghole1,leghole1,-1])
    cylinder(r=leghole_r, h=plate_h+2);

    translate([leghole1+leghole2,leghole1,-1])
    cylinder(r=leghole_r, h=plate_h+2);
    
    translate([leghole1+leghole2,leghole1+leghole2,-1])
    cylinder(r=leghole_r, h=plate_h+2);
    
    translate([leghole1,leghole1+leghole2,-1])
    cylinder(r=leghole_r, h=plate_h+2);

    translate([leghole1+leghole2/2,leghole1+leghole2/2,-1])
    cylinder(r=leghole_r, h=plate_h+2);

    // senkkopf
    senk_h=3*plate_h/7;
    translate([leghole1,leghole1,senk_h])
    cylinder(r1=leghole_r, r2=leghole_r*4, h=plate_h+2);

    translate([leghole1+leghole2,leghole1,senk_h])
    cylinder(r1=leghole_r, r2=leghole_r*4, h=plate_h+2);
    
    translate([leghole1+leghole2,leghole1+leghole2,senk_h])
    cylinder(r1=leghole_r, r2=leghole_r*4, h=plate_h+2);
    
    translate([leghole1,leghole1+leghole2,senk_h])
    cylinder(r1=leghole_r, r2=leghole_r*4, h=plate_h+2);

    translate([leghole1+leghole2/2,leghole1+leghole2/2,senk_h])
    cylinder(r1=leghole_r, r2=leghole_r*4, h=plate_h+2);

    // table holes
    translate([tableplate_srew1,tableplate_srew1,-1])
    cylinder(r=tablehole_r, h=plate_h+2);

    translate([tableplate_srew2,tableplate_srew3,-1])
    cylinder(r=tablehole_r, h=plate_h+2);

    translate([tableplate_srew3,tableplate_srew2,-1])
    cylinder(r=tablehole_r, h=plate_h+2);
}
