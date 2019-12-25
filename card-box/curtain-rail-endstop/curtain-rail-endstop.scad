/* Curtain rail endstop
 *
 * We have been storing family recipes in this card storage box, just to find
 * that the back lid broke off and was lost.
 *
 * This is a replacement for the (if you look at it from the lid side) left lid 
* piece. If you need the right one you can mirror it.
 *
 * Author: @lluismh
 *
 * This work is licensed under a Creative Commons Attribution-ShareAlike 4.0
 * International License.
 */

base_width = 14;
base_length = 29;
base_thickness = 2.65;

railhole_length = 8; 
railhole_width = 11.7;
railhole_height = 18.7;
railhole_thickness = 2.3;
railhole_offset = 5.5;

endstop_length = base_length - railhole_offset - railhole_length;
endstop_height = 10.6;
endstop_thickness = 2;
endstop_hole_length = 4;
endstop_hole_width = base_thickness;
endstop_hole_offset = endstop_length - endstop_hole_length - endstop_hole_width;

hole_offset = 3;
hole_internal_diameter = railhole_thickness;
hole_external_diameter = hole_offset * 2;

$fn = 60;

union() {
    cube([base_width, base_length, base_thickness]);

    translate([(base_width - railhole_width) / 2, railhole_offset, 0]) {

        difference() {
            union() {
                difference() {
                    cube([railhole_width, railhole_length, railhole_height]);

                    translate([0, railhole_thickness, 0]) {
                        cube([(railhole_width - railhole_thickness)/2, railhole_length - (2 * railhole_thickness), railhole_height]);
                    }

                    translate([railhole_width - (railhole_width - railhole_thickness) / 2, railhole_thickness, 0]) {
                        cube([(railhole_width - railhole_thickness)/2, railhole_length - (2 * railhole_thickness), railhole_height]);
                    }
                };

                translate([railhole_width / 2, railhole_length, railhole_height - hole_offset]) {
                    rotate(a=90, v = [1,0,0]) {
                        cylinder(r = hole_external_diameter / 2, h = railhole_length);
                    }
                }
            }

            translate([railhole_width / 2, railhole_length, railhole_height - hole_offset]) {
                rotate(a=90, v = [1,0,0]) {
                    cylinder(r = hole_internal_diameter / 2, h = base_length);
                }
            }

        }

    }



    translate([(base_width - endstop_thickness) / 2, base_length - endstop_length, 0]) {
        difference() {
            cube([endstop_thickness, endstop_length, endstop_height]);

            translate([0, endstop_hole_offset, 0]) {
                cube([base_width, endstop_hole_length, endstop_height - base_thickness]);
            }
        }
    }

}

/*
union() {
    difference() {
       cube([base_width, base_length, base_thickness]);

        translate([base_width - base_cut_width, base_length - base_cut_length, 0]) {
            cube([base_cut_width, base_cut_length, base_thickness]);
        }
    }

    translate([base_width - base_cut_width, 0, 0]) {
        cube([base_cut_width, base_cut_length, base_extension_thickness * 2]);

    }

    translate([base_width - (base_cut_width / 2), -cylinder_length + base_cut_length, base_extension_thickness + cylinder_radius]) {
        rotate(a = 90, v = [-1, 0, 0]) {
            cylinder(r = cylinder_radius, h = cylinder_length);
            cylinder(r = pin_radius, h = pin_length + cylinder_length);
        }

    }

}
*/