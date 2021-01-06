$fn=50;

module inside_ear(){
	scale([0.8,0.8,0.6])
	difference(){
		sphere(r=3.5);
		sphere(r=2.8);
		cylinder(h=10,r=0.7, center=true);
	} 
}

module back_of_ear(){
	difference(){
		union(){
			scale([1,1,0.6])sphere(r=3.5);
			translate([0,0,2])cylinder(r=2,h=3.5, center=true);
		}
		scale([1,1,0.6])sphere(r=2.8);
		cylinder(h=13,r=0.8, center=true);
		translate([0,0,3]) cube([0.9,7,2], center=true); // top cut
	}
} 


difference(){
	union(){
		back_of_ear();
		translate([12,0,0]) inside_ear();
	}
	translate([0,0,-5]) cube([40,9,9], center=true);
}

