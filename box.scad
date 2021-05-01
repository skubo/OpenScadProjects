wall = 2;
radius = 5;
width = 170;
depth = 150;
height = 75;

difference()
{
    translate([width/2,depth/2 , 0])
    difference()
    {
      difference()
      {
        miniround([width,depth,height], radius);
        translate([wall/2, wall/2,wall/2])
        miniround([width-wall,depth-wall,height], radius);
      };
      translate([-wall*4,-wall*4,height-radius])
      miniround([width+radius*4, depth+radius*4, height], 0);
    }

    difference()
    {
        translate([(width/2 + depth/2) + 3*radius/2, (depth/2 + width/2) + radius /3,-20])
        rotate([0,0,45])
        miniround([width/2,width/2,50], 2);
        translate([0, depth + depth/2 - radius/2 ,-300])
        miniround([width * 2,depth,1000], 0);
    }
    
    difference()
    {
        translate([(width/2 + depth/2) + 3*radius/2, (width + 3*radius)/2 - (depth) / 2 ,-20])
        rotate([0,0,45])
        miniround([width/2,width/2,50], 2);
        translate([0, -depth + depth/2 ,-300])
        miniround([width * 2,depth,1000], 0);
    }

    difference()
    {
        translate([depth + width/5 + 3*radius/2, depth,-20])
        rotate([0,0,-45])
        miniround([width/2,width/2,50], 2);
        translate([width + width/2 - radius/2, depth/2,-300])
        miniround([width * 2,depth,1000], 0);
    }

    difference()
    {
        translate([width/5 - 3*radius/2, depth,-20])
        rotate([0,0,-45])
        miniround([width/2,width/2,50], 2);
        translate([-width - width /2 , depth/2,-300])
        miniround([width * 2,depth,1000], 0);
    }
}

module miniround(size, radius)
{
    $fn=50;
    x = size[0]-radius/2;
    y = size[1]-radius/2;

    minkowski()
    {
        cube(size=[x,y,size[2]]);
        //cylinder(r=radius);
        // Using a sphere is possible, but will kill performance
        sphere(r=radius);
    }
}

