$fn =10;
my_size = 10;

difference() {
  union() {
    difference() {
        difference() {
          sphere(d=my_size,center=true);
          sphere(d=0.96*my_size,center=true);
          translate([0, 0, -0.7*my_size]) {
            sphere(d=0.7*my_size,center=true);
          }
        }
        translate([0, 0, 0.5*my_size]) {
          cube(size=[my_size, my_size, my_size], center=true);
         }
    };

      translate([0, 0, -0.7*my_size]) {
        difference() {
          sphere(d=0.7*my_size,center=true);
          sphere(d=0.67*my_size,center=true);
        }
      };
  };
    translate([0, 0, -0.96*my_size]) {
      cube(size=[my_size, my_size, my_size], center=true);
    };
}
