// original design by devzero, published Oct 19, 2013
// https://www.thingiverse.com/thing:168581
// modified by Hao Chen Oct 11 2017

board_width=25.5;
board_height=23;
board_thick=4.75;
cable_width=18;
cable_thick=1.5;
side_cover=7.5;
camera_hole_width=10;
camera_hole_height=5.5;
screw_hole_r=2.65;
padding=2.5;
d=0.001;
mount_offset=2*padding+board_width;
mount_thickness=8;


//camera holder
difference(){
	cube([board_thick+2*padding, board_width+2*padding, board_height+2*padding]);
	//main compartment
	translate([padding-1, padding, padding]) cube([board_thick+2, board_width, board_height+padding+d]);
	//front camera slot
	translate([board_thick+padding-d, padding+side_cover, padding+camera_hole_height]) cube([padding+2*d, camera_hole_width, board_height+padding-camera_hole_height+d]);
	//hole for cable in the bottom
	translate([padding+2,padding+(board_width-cable_width)/2,0]) cube([cable_thick, cable_width+2*d, padding+2*d]);
	// screw holds
	translate([0,5,board_height+3]) rotate([0,90,0]) cylinder(r=1.3, h=20,$fn=40);
	translate([0,26,board_height+3]) rotate([0,90,0]) cylinder(r=1.3, h=20,$fn=40);
}

//handle
	
difference(){
	union(){
		translate([7.25,8,-15])cube([2.5,14, 18]);
		translate([7.25,8+7,-15])rotate([0,90,0]) cylinder(r=7,h=2.5);
	}
	translate([-5,15,-15])rotate([0,90,0])cylinder(r=2.52, h=20, $fn=40);
}

