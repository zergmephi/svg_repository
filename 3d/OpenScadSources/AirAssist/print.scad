$fn = 20;
// fn - параметр детализации. для быстрого рендеринга - 20
// для печати - 60-80


// все детали в модулях печатаются отдельно и склеиваются клеем
module base(){
// основное крепление
  size_x = 30;
  size_y = 15;
  size_z = 5;
  shell = 3;

  difference(){
    cube([size_x,size_y+shell,size_z+ shell], center=true);
  	cube([size_x,size_y,size_z],center=true);
  	translate([0,0,shell]){
  		cube([size_x,size_y-shell,size_z],center=true);
  	}
  	translate([3, 0,0]){
  		cylinder(r=6,h=30, center = true);
  	}
  	translate([12,-5,-15]){
  		cylinder(r=2.5,h=30, center = true);
  	}
  }
  translate([size_x/2+shell/2,0,0]){
  	cube([shell,size_y+shell,size_z+ shell], center=true);
  }
}

module clutch() {
// муфта для крепления обдувающего конуса
// клеится на корпус клеем, конус надевается вплотную
color("red"){
    difference(){
        cylinder(r=8,h=5, center = true);
        cylinder(r=6,h=5, center = true);
    }
  }
}

module nozzle35mm(){
// обдувающий носик, надевается на муфту
// высота - 35мм
  union() {
    color("blue"){
      translate([0,0,30/2]){
        difference(){
          cylinder(r=10,h=5, center = true);
          cylinder(r=8,h=5, center = true);
        }
      }
    }
    color("lime"){
      difference(){
        cylinder(r2=10, r1=3, h = 35,center = true);
        cylinder(r2=8,  r1=2, h = 35,center = true);
        translate([0,0,30/2]){
          cylinder(r=8,h=5, center = true);
        }
        translate([0,-30/2,-5]){
          rotate([90, 0, 0]) {
            difference(){
              cylinder(r2=10, r1=3, h = 35,center = true);
              //cylinder(r2=8,  r1=2, h = 35,center = true);
            }
          }
        }
      }
    }
  }
}
module nozzle45mm(){
// обдувающий носик, надевается на муфту
// высота - 35мм
  union() {
    color("blue"){
      translate([0,0,20]){
        difference(){
          cylinder(r=10,h=5, center = true);
          cylinder(r=8,h=5, center = true);
        }
      }
    }
    color("lime"){
      difference(){
        cylinder(r2=10, r1=3, h = 45,center = true);
        cylinder(r2=8,  r1=2, h = 45,center = true);
        translate([0,0,20]){
          cylinder(r=8,h=5, center = true);
        }
        translate([0,-30/2,-5]){
          rotate([90, 0, 0]) {
            difference(){
              cylinder(r2=10, r1=3, h = 35,center = true);
              //cylinder(r2=8,  r1=2, h = 35,center = true);
            }
          }
        }
      }
    }
  }
}
module pen() {
// конический вход для трубки обдува
// втыкается сбоку в обдувающий носик
  translate([0,-30/2,-5]){
    rotate([90, 0, 0]) {
      difference(){
        cylinder(r2=10, r1=3, h = 35,center = true);
        cylinder(r2=8,  r1=2, h = 35,center = true);
      }
    }
  }
}
module add_pin() {
// штифт для дополнительной фиксации корпуса
// и крепление к нему
// штифт и крепление сажаются на клей
  translate([-10, -20, 0]) {
    cube([5,10,10]);
  }
  translate([-15, -15, 5]) {
    rotate([0,90,0]){
      cylinder(r=1.5, h=5, center=true);
    }
  }
}
////////////////////////////////////////////
base();
translate([3,0,-6.5]){
  clutch();
}
/*translate([3,0,-30]){
  nozzle35mm();
  pen();
}*/
translate([3,0,-30]){
  nozzle45mm();
  pen();
}
color("cyan"){
 add_pin();
}
