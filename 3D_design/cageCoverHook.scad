$fn=50;

difference(){
	cube([13, 15, 12], center=true);
	translate([5,0,-2]) cube([13.3, 20.1, 13], center=true);
	translate([-10,0,0.9]) cube([13.3, 20.1, 10.3], center=true);
	translate([-10,0,-10.5]) cube([13.3, 20.1, 10.3], center=true);
}
