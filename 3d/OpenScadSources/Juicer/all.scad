mysize = 50;
$fn =100;
/* modules */
module columns() {
  union() {
    for (j=[0:4]) {
      rotate([0, 0, 90*j+45]) {
        translate([0.9 * mysize, 0, -0.3*mysize]) {
          cylinder(r=0.05*mysize, h=1.2*mysize, center=true);
        }
      }
    }
  }
}
module bottom_handlers() {
  union() {
    for (j=[0:8]) {
      rotate([0, 0, 360/8*j]) {
        translate([1.1 * mysize, 0, -0.9*mysize]) {
          cylinder(r=0.2*mysize, h=0.2*mysize, center=true);
        }
      }
    }
  }
}
module top_handlers() {
  union() {
    for (j=[0:8]) {
      rotate([0, 0, 360/8*j]) {
        translate([1.1 * mysize, 0, 1.1*mysize]) {
          cylinder(r=0.2*mysize, h=0.2*mysize, center=true);
        }
      }
    }
  }
}
module thread(){
  color("red"){
    translate([0, 0, 0.3*mysize]) {
        linear_extrude(height=0.7*mysize, twist = -360, convexity = 10){
            intersection() {
              polygon(points=[[0,0],[2*mysize,0],[2*mysize*sin(60),2*mysize*cos(60)]], paths=[[0,1,2]]);
              difference() {
                circle(r=0.95*mysize, center = true);
                circle(r=0.85*mysize, center = true);
              }
            }
              intersection() {
              polygon(points=[[0,0],[-2*mysize,0],[-2*mysize*sin(60),-2*mysize*cos(60)]], paths=[[0,1,2]]);
              difference() {
                circle(r=0.95*mysize, center = true);
                circle(r=0.85*mysize, center = true);
              }
            }
        }
    }
  }
}
module base() {
  union(){
    color("lime"){
      translate([0, 0, -0.9*mysize]) {
        cylinder(r=mysize*1.09, h=0.2*mysize, center=true);
      }
    }
    difference() {
      cylinder(r=mysize*1.1, h=2*mysize, center=true);
      translate([0, 0, 0.2*mysize]) {
        cylinder(r=mysize*0.9, h=2*mysize, center=true); /*cylinder(r=mysize*<1>.9, h=2*mysize, center=true); - for invisible walls*/

      }
      translate([0, -mysize, 0]) {
        scale([1,2,1]){
          rotate([15, 0, 0]) {
            translate([0, 0, -1*mysize]) {
                cylinder(r=mysize*0.19, h=2*mysize, center=true);
            }
          }
        }
      }
      thread();
    }
    /* grinder holder */

    color([0/255, 0/255, 254/255]) {
      difference() {
        cylinder(r=mysize*0.99, h=0.2*mysize, center=true);
        cylinder(r1=mysize*0.90,r2=0.8*mysize, h=0.2*mysize, center=true);
      }
    }
    nozzle();
    columns();
    bottom_handlers();
  }
}

module pusher() {
  union(){
    color("lime"){
          translate([0, 0, 0.3*mysize]) {
          union(){
            translate([0, 0, 0.4*mysize]) {
              cylinder(r=mysize*0.9, h=0.8*mysize, center=true);
            }
            translate([0, 0, 0.8*mysize]) {
              cylinder(r=mysize*1.1, h=0.2*mysize, center=true);
            }
          }
       }
    }
    thread();
    spike_group();
    top_handlers();
  }

}

mysize = 50;
module hole (x,y){
      translate([x,y,0.2*mysize]){
        rotate([0,0,45]){
          scale([0.3,0.3,0.4]){
          translate([0, 0, 0.07*mysize]){
            cylinder(r1=0.1*mysize,r2=0.25*mysize,h=0.2*mysize,$fn=4);
          }
          rotate([0,0,45]){
            translate([0, 0, -0.1*mysize]) {
              cube ([0.14*mysize, 0.14*mysize, 0.35*mysize], center=true);
            }
          }
        }
      }
    }
  }
module hole_group(){
  union(){
    for (j=[-10:10]) {
      for (i=[-10:10]) {
        hole(i*0.1*mysize,j*0.1*mysize);
      }
    }
  }
}
module spike (x,y){
      translate([x,y,0.25*mysize]){
        rotate([0,0,45]){
          scale([0.3,0.3,0.2]){
          translate([0, 0, 0.07*mysize]){
            cylinder(r1=0,r2=0.25*mysize,h=0.2*mysize,$fn=4);
          }
        }
      }
    }
  }
module spike_group(){
  union(){
    translate([0,0,0.28*mysize])
    difference(){
      cylinder(r=mysize*0.9, h=0.07*mysize, center=true);
      cylinder(r=mysize*0.85, h=0.07*mysize, center=true);
    }  
    intersection(){
      cylinder(r=mysize*0.9, h=2*mysize, center=true);
        union(){
          for (j=[-10:10]) {
            for (i=[-10:10]) {
              spike(i*0.1*mysize,j*0.1*mysize);
            }
          }
      }
    }
  }  
}
module grid(){
    union(){
      translate([0,0, 0.2*mysize]){
        difference() {
          cylinder(r=0.89*mysize, h=0.2*mysize, center=true);
          cylinder(r=0.85*mysize, h=0.2*mysize, center=true);
          columns();
        }
      }

      difference() {
        translate([0,0, 0.2*mysize]){
          cylinder(r=0.89*mysize, h=0.2*mysize, center=true);
        }
        /*hole_group(); */ /*for preview*/
        columns();
      }
    }
}

module nozzle(){
  difference() {
      translate([0, -mysize, 0]) {
        scale([1,2,1]){
          rotate([15, 0, 0]) {
            difference() {
              cylinder(r=mysize*0.3, h=1.6*mysize, center=true);
              translate([0, 0, -3*mysize]) {
                cube([mysize,mysize,mysize]);
              }
              translate([0, 0, 3*mysize]) {
                cube([mysize,mysize,mysize]);
              }
              cylinder(r=mysize*0.2, h=2*mysize, center=true);
            }
          }
        }
      }
      translate([0, 0, 0.2*mysize]) {
        cylinder(r=mysize*0.9, h=2*mysize, center=true);
      }
      thread();
  }
}

/* drawing */
scale([1,1,2]) {
grid();
}
