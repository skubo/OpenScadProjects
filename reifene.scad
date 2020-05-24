// F1 tyre generator V1.0 - (c) 2020 by Chris Garbers https://skubo.media
// The tyres have flat sides for a reason: printability. The original Pirelli tyres
// are much more round on the side, but that will make it almost impossible to 
// 3d print with a single extruder if you want to have the text and stripe in a 
// different colour. Also, I know that Pirelli has a different logo, and not just text. 
// That's for V2.0 maybe. 
// 
// get font names with terminal cmd: 
// fc-list -f "%-60{{%{family[0]}%{:style[0]=}}}%{file}\n" | sort
// you can load the two fonts for free at dafont.com

tyreWidth=40;
typeOuterRadius=45;
typeInnerRadius=25;
outerCurveX=5;
outerCurveY=15;
innerCurveX=2;
innerCurveY=2;

stripeAndTextColor = [1,0.3,0]; // R,G,B

// stripe control
withStripe= true;
stripeWidth = 4;
stripeCenterOffset = -1.5;
stripeHeight = .5;
stripeFillAngleIfWithText = 70;

// text control, will intermit the stripe if used
// will use same height as stripe
withtext = true;
firstTextRotationOffset = 12;
secondTextRotationOffset = 12;
font = "Pirelli:style=Regular";
secondFont = "PhattPhreddy:style=Regular";
fontSize = 6;
secondFontSize = 6;
firstText = "Beerelli";
secondText = "BAD/YEAR";

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
     stripeFillAngleIfWithText,
     withtext,
     firstTextRotationOffset,
     secondTextRotationOffset,
     font,
     secondFont,
     fontSize,
     secondFontSize,
     firstText,
     secondText,
     stripeAndTextColor);

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
            stripeFillAngleIfWithText,
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
        for(a = [anglesInnerBottom[0]:1:anglesInnerBottom[1]]) [innerR + (innerRx * cos(a)), innerRy + innerRy * sin(a)]
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
          rotate_extrude(angle=stripeFillAngleIfWithText) {
               polygon([[centerRubber - stripeWidth /2, width], [centerRubber + stripeWidth / 2, width], [centerRubber + stripeWidth/2, width + stripeHeight], [centerRubber - stripeWidth / 2, width + stripeHeight]]); 
          }
          
        rotate([0,0,180])
          {
              
          rotate_extrude(angle=stripeFillAngleIfWithText) {
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
        
        rotate([0,0,90 - firstTextRotationOffset])
        translate([0,0,width])
        linear_extrude(stripeHeight)
        {
            curvedText(firstText, r=centerRubber- fontSize/2, size=fontSize, spacing=spacing, font=font);
        }
        rotate([0,0,270 - secondTextRotationOffset])
        translate([0,0,width])
        linear_extrude(stripeHeight)
        {
            curvedText(secondText, r=centerRubber- secondFontSize/2, size=secondFontSize, spacing=spacing, font=secondFont);
        }
    }
}


module curvedText(txt, r=10, size=10, spacing=1, valign="baseline", font) {
  a = 180 * size * spacing / (PI * r);
  for (i = [0:len(txt)-1])
    rotate([0,0,-(i+0.5)*a]) 
    translate([0,r]) text(txt[i], size=size, halign="center", valign=valign, $fn=32, font=font);
}
