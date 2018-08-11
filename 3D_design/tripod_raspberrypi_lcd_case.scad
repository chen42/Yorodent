// mount a raspberry pi with a 3 in monitor on a tripod
// also supports a selfy stick. I know this sounds strange
// Author: Hao Chen
//
// License: any
//
//
// this is for Amazon Basic model  https://www.amazon.com/gp/product/B00XI87KV8 

module tripod (){
	difference(){
	linear_extrude(height = 7, scale = 21/27) square(27, center = true);
	linear_extrude(height = 7, scale = 16/22) square(22, center = true);
	}
}

module selfy (){
	difference(){
		cube([36,40,15],center=true);
		translate([0,0,2])cube([18,32,15],center=true);
		translate([0,0,9]) rotate([90,0,0]) cylinder(r=9, h=50,center=true, $fn=40);
		for (i=[-1,1]){ 
			for (j=[-1,1]){
			translate([13*i,16*j,0])cube([3,4,30],center=true);//zip tie 
			}
		}
	}
}

module rpi_case(){
	difference(){
		cube ([94, 32, 65], center=true);
		translate([0,0,5])cube ([90, 28, 69],center=true);
		translate([-40,1.5,-11])cube([20,16, 34], center=true); // usb ports
		translate([0,-6.9,-21]) cube([80,7,20],center=true);// lcd board groove
		translate([-1,-10,-1])cube([77,20,55],center=true);// lcd
		translate([44,-5,17]) cube([10,8,14],center=true);// power cord
		translate([44,-1,20]) cube([10,1,28],center=true);// camera cable 
		translate([0,0,29])screw();
		for (i = [1:9]) {
			translate([0,10,-25+i*5]) cube([70,20,3],center=true);// heat exhust  
		}
	}
	for (i = [1:7]) {
			rotate([0,10,0])translate([-40+i*10,15,0]) cube([2,2,55],center=true);// heat exhust  
		}
}

module top_cover(){
		difference(){
			intersection(){
			cube ([98.5, 36.5, 14], center=true);
				translate([0,0,-8])rotate([0,90,0]) cylinder(r=22,h=100,center=true);
			}

			translate([0,0,-3]) cube ([95.5, 33.5, 18], center=true);
			translate([0,0,-4]) screw();
			for (k=[1:3]) translate([0,-16+ k*8,0]) cube([90,3,14],center=true);
		}
}

module screw(){
	translate([0,12,0]) rotate([0,90,0]) cylinder(r=1.8,h=100,center=true, $fn=50);
}

//translate([0,0,33])top_cover();
rpi_case();
translate([0,0,-39])tripod();
translate([65,-4,-25])selfy();

