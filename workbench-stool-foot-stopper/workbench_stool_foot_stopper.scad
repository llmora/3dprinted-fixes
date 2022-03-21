/* Worbench stool footrest holder
 *
 * Author: @lluismh
 *
 * This work is licensed under a Creative Commons Attribution-ShareAlike 4.0
 * International License.
 */

include <nutsnbolts/cyl_head_bolt.scad>;

$fn = 200;

stool_post_diameter = 50; // Diameter in mm

stopper_thickness = 4;
stopper_height = 10;

stool_post_radius = stool_post_diameter / 2;

screw_name="M3x8";
ds = _get_screw(screw_name);
df = _get_screw_fam(screw_name);

module attachment() {

  rotate([90, 0, 0]) {
    difference() {
    cube([stopper_height, stopper_height, stopper_thickness]);

    translate([stopper_height - stopper_thickness, stopper_height / 2, stopper_thickness * 2]) {
      hole_through(df[_NB_F_DESC], l=ds[_NB_S_LENGTH], h=df[_NB_F_HEAD_HEIGHT]);
    };

    }
  }
}

// From: https://gist.github.com/plumbum/78e3c8281e1c031601456df2aa8e37c6
module sector(h, d, a1, a2) {
    if (a2 - a1 > 180) {
        difference() {
            cylinder(h=h, d=d);
            translate([0,0,-0.5]) sector(h+1, d+1, a2-360, a1); 
        }
    } else {
        difference() {
            cylinder(h=h, d=d);
            rotate([0,0,a1]) translate([-d/2, -d/2, -0.5])
                cube([d, d/2, h+1]);
            rotate([0,0,a2]) translate([-d/2, 0, -0.5])
                cube([d, d/2, h+1]);
        }
    }
}

union() {

  difference() {

    sector(stopper_height,stool_post_diameter + stopper_thickness * 2, 0, 120);

    translate([0, 0, -stopper_height / 2]) {
      sector(stopper_height * 2, stool_post_diameter, -10, 130);
    }

  }

  translate([stool_post_radius + stopper_thickness / 2 - 1, stopper_thickness, 0]) {
    attachment();
  }

  rotate([0, 0, 120]) {
    translate([stool_post_radius + stopper_thickness / 2 - 1, 0, 0]) {
      attachment();
    }
  }

}


/*
module holder() {


  translate([0, 0, df[_NB_F_NUT_HEIGHT]/3]) {
    // nut(df[_NB_F_DESC]);
  };

}

difference() {

  union() {
    cube([widerpart_length, widerpart_height, thickness]);

    translate([widerpart_length, 0, 0]) {
      cube([total_length - widerpart_length, slimmerpart_height, thickness]);
    }
  };

  translate([widerpart_length / 3, widerpart_height / 2, 0]) {
    holder();
  };

  translate([widerpart_length / 8, widerpart_height / 2, 0]) {
    holder();
  };

}
*/
