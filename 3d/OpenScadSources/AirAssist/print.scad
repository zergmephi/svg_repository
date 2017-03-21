$fn = 20;
// fn - �������� �����������. ��� �������� ���������� - 20
// ��� ������ - 60-80


// ��� ������ � ������� ���������� �������� � ����������� �����
module base(){
// �������� ���������
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
// ����� ��� ��������� ����������� ������
// ������� �� ������ �����, ����� ���������� ��������
color("red"){
    difference(){
        cylinder(r=8,h=5, center = true);
        cylinder(r=6,h=5, center = true);
    }
  }
}

module nozzle35mm(){
// ���������� �����, ���������� �� �����
// ������ - 35��
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
        pen(solid=1);
      }
    }
  }
}
module nozzle45mm(){
// ���������� �����, ���������� �� �����
// ������ - 35��
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
        pen(solid=1);
      }
    }
  }
}
module pen(solid = 0) {
  if(solid==1){
    translate([0,-30/2, 3]){
      rotate([70, 0, 0]) {
        cylinder(r2=5, r1=3, h = 35,center = true);
      }
    }
  }
  if(solid!=1){
    translate([0,-30/2, 3]){
      rotate([70, 0, 0]) {
        difference() {
          cylinder(r2=5, r1=3, h = 35,center = true);
          cylinder(r2=3,  r1=2, h = 35,center = true);
        }
      }
    }
  }
// ���������� ���� ��� ������ ������
// ��������� ����� � ���������� �����

}
module add_pin() {
// ����� ��� �������������� �������� �������
// � ��������� � ����
// ����� � ��������� �������� �� ����
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
translate([3,0,-30]){
  nozzle35mm();
  //pen();
}

color("cyan"){
 add_pin();
}
