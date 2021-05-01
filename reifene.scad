// F1 tyre generator V1.2 - (c) 2020 by Chris Garbers https://skubo.media
// The tyres have flat sides for a reason: printability. The original Pirelli tyres
// are much more round on the side, but that will make it almost impossible to 
// 3d print with a single extruder if you want to have the text and stripe in a 
// different colour. Also, I know that Pirelli has a different logo, and not just text. 
// That's for V2.0 maybe. 
//
// 1.2: now also with a simple wheel rim. Not tested. 
//
// get font names with terminal cmd: 
// fc-list -f "%-60{{%{family[0]}%{:style[0]=}}}%{file}\n" | sort
// you can load the two fonts for free at dafont.com
// Gotham font needs to be loaded elsewhere

createTyre = true;
createWheel = true;
withStripe= true;
withtext = true;

tyreWidth=20;
typeOuterRadius=25;
typeInnerRadius=15;
outerCurveX=2;
outerCurveY=6;
innerCurveX=2;
innerCurveY=2;

stripeAndTextColor = [1,0.3,0]; // R,G,B

// stripe control
stripeWidth = 2;
stripeCenterOffset = 0;
stripeHeight = 0.5;
stripeStartAngleIfWithText = 33;
stripeEndAngleIfWithText = 125;

// text control, will intermit the stripe if used
// will use same height as stripe
firstTextRotationOffset = 12;
secondTextRotationOffset = 20;
font = "Pirelli:style=Regular";
secondFont = "Gotham Ultra:style=Italic";
fontSize = 3.5;
secondFontSize = 5;
firstText = "";
secondText = "P ZERO";

// experimental: logo
toplogo = "pirelli.svg";
logoOffset = -1;

// wheel
plateHeight = 10;
holeRadius = 3;
holeChamfer = 3;
numberOfCutouts = 18;
innerCutoutOffset = 2;
outerCutoutOffset = 0;
cutoutdistance = 1;

if (createTyre)
{
    tyre(typeInnerRadius, 
         typeOuterRadius, 
         tyreWidth, 
         outerCurveX, 
         outerCurveY, 
         innerCurveX, 
         innerCurveY,
         withStripe,
         stripeWidth,
         stripeHeight,
         stripeCenterOffset,
         stripeStartAngleIfWithText,
         stripeEndAngleIfWithText,
         withtext,
         firstTextRotationOffset,
         secondTextRotationOffset,
         font,
         secondFont,
         fontSize,
         secondFontSize,
         firstText,
         secondText,
         stripeAndTextColor,
         toplogo,
         logoOffset
    );
}
if (createWheel)
{
    wheel(typeInnerRadius,
          tyreWidth,
          innerCurveX,
          innerCurveY,
          holeRadius,
          holeChamfer,
          plateHeight,
          numberOfCutouts,
          cutoutdistance,
           innerCutoutOffset,
            outerCutoutOffset);
}

module wheel(radius,
             runningWidth,
             rubberRx,
             rubberRy,
             holeRadius,
             holeChamfer,
             plateHeight,
             numberOfCutouts,
            cutoutDistance,
             innerCutoutOffset,
             outerCutoutOffset,
            $fs=1.5, $fa=1.5)
{
  wheelColor = [0.9,0.9,0.9];
    color(wheelColor)
    difference(){
  
    rotate_extrude()
    {
        anglesInnerTop = [90, 180];
        anglesInnerBottom = [180,270];

    pointsInnerBottom = [
        for(a = [anglesInnerBottom[0]:1:anglesInnerBottom[1]]) [radius + rubberRx + (rubberRx * cos(a)), rubberRy + rubberRy * sin(a)]
            ];

    pointsInnerTop = [
        for(a = [anglesInnerTop[0]:1:anglesInnerTop[1]]) [radius + rubberRx  + (rubberRx * cos(a)),  runningWidth - rubberRy + rubberRy * sin(a)]
            ];
        
        polygon(concat([ 
                 [radius, 0]],
                 pointsInnerBottom,
                 [[radius, 0], [radius, runningWidth]],
                 pointsInnerTop,
                 [[radius, runningWidth], 
                  [holeRadius + holeChamfer,plateHeight],
                  [0, plateHeight],
                  [0,0]]));
    }
    
    // cutouts
    translate([0,0,-runningWidth/2])
    cylinder(h=runningWidth * 2, r=holeRadius, center=false);
    // kreisumfang: 2pir
    innerRad = (((2*PI*(holeRadius + holeChamfer + innerCutoutOffset)) / numberOfCutouts) - cutoutDistance) / 2;
    outerRad = (((2*PI*(radius - rubberRx - outerCutoutOffset)) / numberOfCutouts) - cutoutDistance) / 2;
    cutAngle = 360/numberOfCutouts;
    for (i = [0:1:numberOfCutouts])
    {
        rotate([0,0,i*cutAngle])
        cutout(holeRadius + holeChamfer + innerCutoutOffset,
                radius - rubberRx - outerCutoutOffset, 
                innerRad,
                outerRad);
    }

    };
}

module cutout(innerStart, outerEnd, innerRad, outerRad)
{
    hull()
    {
        
    translate([innerStart + innerRad/2,0,-250])
    cylinder(h=500, r=innerRad, center=false, $fn=100);

    translate([outerEnd - outerRad/2,0,-250])
    cylinder(h=500, r=outerRad, center=false, $fn=100);
    }
    
}

module tyre(innerR, 
            outerR, 
            width, 
            edgeRx, 
            edgeRy, 
            innerRx, 
            innerRy, 
            stripe,
            stripeWidth,
            stripeHeight,
            stripeCenterOffset,
            stripeStartAngleIfWithText,
            stripeEndAngleIfWithText,
            withtext,
            firstTextRotationOffset,
            secondTextRotationOffset,
            font,
            secondFont,
            fontSize,
            secondFontSize,
            firstText,
            secondText,
            stripeColor,
            toplogo,
            logoOffset,
            $fs=1.5, $fa=1.5)
{
  x = (outerR-innerR); // race thickness
  tyreColor = [0.3,0.3,0.3];

  color(tyreColor)
  rotate_extrude() {
    anglesBottom = [-90, 0];
    anglesTop = [0, 90];

    anglesInnerTop = [90, 180];
    anglesInnerBottom = [180, 270];

    pointsBottom = [
        for(a = [anglesBottom[0]:1:anglesBottom[1]]) [outerR - edgeRx + (edgeRx * cos(a)), edgeRy + edgeRy * sin(a)]
            ];

    pointsTop = [
        for(a = [anglesTop[0]:1:anglesTop[1]]) [outerR - edgeRx + (edgeRx * cos(a)), (width - edgeRy) + edgeRy * sin(a)]
            ];

    pointsInnerTop = [
        for(a = [anglesInnerTop[0]:1:anglesInnerTop[1]]) [innerR + innerRx  + (innerRx * cos(a)), (width - innerRy) + innerRy * sin(a)]
            ];

    pointsInnerBottom = [
        for(a = [anglesInnerBottom[0]:1:anglesInnerBottom[1]]) [innerR + innerRx + (innerRx * cos(a)), innerRy + innerRy * sin(a)]
            ];

    polygon(concat([[innerR + innerRx, 0], [outerR-edgeRx,0]], 
            pointsBottom,
            [[outerR, width - (2*edgeRy)]],
            pointsTop,
            [[innerR + innerRx, width]],
            pointsInnerTop,
            pointsInnerBottom));

  }
  
  // rubber is done, now do add ons
    centerRubber = stripeCenterOffset + outerR - (outerR - innerR) /2;

    color(stripeColor)
    
    if (stripe && withtext)
    {
        rotate([0,0,90 + stripeStartAngleIfWithText])
          rotate_extrude(angle=(stripeEndAngleIfWithText - stripeStartAngleIfWithText)) {
               polygon([[centerRubber - stripeWidth /2, width], [centerRubber + stripeWidth / 2, width], [centerRubber + stripeWidth/2, width + stripeHeight], [centerRubber - stripeWidth / 2, width + stripeHeight]]); 
          }

        rotate([0,0, 90 - stripeEndAngleIfWithText])
          {
              
          rotate_extrude(angle=(stripeEndAngleIfWithText - stripeStartAngleIfWithText)) {
               polygon([[centerRubber - stripeWidth /2, width], [centerRubber + stripeWidth / 2, width], [centerRubber + stripeWidth/2, width + stripeHeight], [centerRubber - stripeWidth / 2, width + stripeHeight]]); 
          }
      }
    }
    else if (stripe)
    {
          rotate_extrude() {
               polygon([[centerRubber - stripeWidth /2, width], [centerRubber + stripeWidth / 2, width], [centerRubber + stripeWidth/2, width + stripeHeight], [centerRubber - stripeWidth / 2, width + stripeHeight]]); 
          }
    }
    color(stripeColor)
    if (withtext)
    {
        txtPadding=10;
        spacing=1;
        
        if (firstText != "")
        {
            rotate([0,0, (len(firstText) * fontSize * 0.9) + firstTextRotationOffset])
            translate([0,0,width])
            linear_extrude(stripeHeight)
            {
                curvedText(firstText, r=centerRubber- fontSize/2, size=fontSize, spacing=spacing, font=font);
            }
        }
        
        if (secondText != "")
        {
            rotate([0,0,180 + (len(secondText) * secondFontSize) + secondTextRotationOffset])
            translate([0,0,width])
            linear_extrude(stripeHeight)
            {
                curvedText(secondText, r=centerRubber- secondFontSize/2, size=secondFontSize, spacing=spacing, font=secondFont);
            }
        }
    }
    
    if (defined(toplogo) && toplogo != "")
    {
        color(stripeColor)
        translate([0,centerRubber + logoOffset ,width])
        rotate([0,0,180])
        scale([-0.77, -0.77, 1])
        linear_extrude(stripeHeight)
        logo(toplogo, centerRubber, 100, 50);
    }
}

function defined(a) = str(a) != "undef"; 


module logo(file, radius, width, height)
{
    import (file, center=true, dpi=96);
}

module curvedText(txt, r=10, size=10, spacing=1, valign="baseline", font) {
  a = 180 * size * spacing / (PI * r);
  for (i = [0:len(txt)-1])
    rotate([0,0,-(i+0.5)*a]) 
    translate([0,r]) text(txt[i], size=size, halign="center", valign=valign, $fn=32, font=font);
}
