/* Card storage box lid
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

base_width = 11.70;
base_length = 12.50;
base_thickness = 2.25;

base_cut_width = 2.85;
base_cut_length = base_length / 2;

base_extension_thickness = 3.75;

cylinder_radius = 2.80;
cylinder_length = 9.55;

pin_radius = 1.35;
pin_length = 3;

$fn = 60;

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