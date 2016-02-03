wallDiam = 2.2;
tol = 0.2;

boxX = 80;
boxY = 145;
boxZ = 30;

pcbScrewDiam=5.9;
pcbScrewHole=3;
pcbScrewZ = 10;

rackX=20;
rackScrewDiam=7;
rackScrewDist=17;

cableDiam = 14;
bncDiam = 10;

ledDiam = 3;

module box(){
    difference(){
        cube([boxX+2*wallDiam,boxY+2*wallDiam,boxZ],center=true);
        translate([0,0,wallDiam]){
            cube([boxX,boxY,boxZ],center=true);}
      }//end difference
    }//end module box
    

module baseHoles(){
    numRows=5;
    numCols=2;
    for(b= [0:1:1]){
    
        for(a = [0 : 1 : numRows-1]){
            translate([b*boxX/numCols,a*boxY/numRows,-boxZ/2])
            {cube([boxX/2.5,boxY/10,10],center=true);}//end translate
            }//end for a
        }//end for b
    }

module screwTower(){
    difference(){
        cylinder(d=pcbScrewDiam,h=pcbScrewZ,center=true,$fn=50);
        cylinder(d=pcbScrewHole,h=pcbScrewZ+1,center=true,$fn=50);
    }//end difference
    }
 
module ledTower(){
    rotate([90,0,0]){
    difference(){
        cylinder(d=ledDiam+2,h=ledDiam-1,center=true,$fn=50);
        cylinder(d=ledDiam,h=ledDiam+2,center=true,$fn=50);
        }
    }
    }
module lensDriver(){
    //25.4 is one inch in mm
    xDim=25.4*2.250;
    yDim=25.4*0.830;
    screwTower();
    translate([xDim,yDim,0]){
    screwTower();}
    translate([xDim,0,0]){
    screwTower();}
    translate([0,yDim,0]){
    screwTower();}
    
    
    }

module robotShield(){
    xDim=27;
    yDim=57;
    screwTower();
    translate([xDim,yDim,0]){
    screwTower();}
    translate([xDim,0,0]){
    screwTower();}
    translate([0,yDim,0]){
    screwTower();}
    }
    

module cableHole(){
    rotate([0,90,0]){
   cylinder(d=cableDiam,h=2.5*wallDiam,center=true,$fn=50);}
}
    

module frontHoles(){  
    ports=["servo in","servo out","lens in","lens out"];
    for(b= [0:1:3]){
        translate([b*(10+bncDiam),0,0]){
            rotate([90,0,0]){
                cylinder(d=bncDiam,h=wallDiam*4,center=true,$fn=50);
            } //end rotate
        }//end translate
        rotate([90,0,0]){
            translate([b*(10+bncDiam),bncDiam/2+3,0.608]){
                text(text=ports[b],spacing=0.8,size=2.5,halign="center");
            }//end translate
        }//end rotate
                
        translate([b*(10+bncDiam),0,15]){
            rotate([90,0,0]){
                cylinder(d=ledDiam,h=wallDiam*4,center=true,$fn=50);
            } //end rotate
        }//end translate
    }//end for
}

module box2Rack(){
    
    difference(){
        cube([rackX,wallDiam*2,boxZ],center=true);
        translate([0,0,-rackScrewDist/2]){
            rotate([90,0,0]){
                cylinder(d=rackScrewDiam,h=4*wallDiam,center=true,$fn=50);}//end rotate
                }//end translate
        translate([0,0,+rackScrewDist/2]){
            rotate([90,0,0]){
                cylinder(d=rackScrewDiam,h=4*wallDiam,center=true,$fn=50);
                    }//end rotate
        }//end translate
    }//end difference

}



difference(){
box();
    translate([-boxX/4,-2*boxY/5,0]){
        baseHoles();}//end translate
    translate([(wallDiam/2)+(boxX/2),25,0]){
        cableHole();}
    translate([(boxX/2-cableDiam/2-wallDiam/2),boxY/2,0]){
        rotate([0,0,90]){
        cableHole();}}
    translate([-(3*bncDiam),-boxX/1.09,-7]){
    frontHoles();}
    }//end difference

translate([-boxX/2-rackX/2-wallDiam,-boxY/2,0]){
    box2Rack();}    


    
translate([8,(-boxY/2)+26,-boxZ/3.3]){
robotShield();}

translate([(-boxX/2)+3.5,(boxY/3)-1,-boxZ/3.3]){
lensDriver();}

