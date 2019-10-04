/* SMEG fridge shelf front corner replacement
 *
 * The plastic corners in our SMEG fridge are quite flimsy and after a couple of
 * years they just broke away. It has been impossible to source replacements so
 * we decided to design simple functional replacements for them.
 *
 * This is a replacement for the plastic corner that goes at the front, it is
 * symmetric so you can print it in any direction for both corners.
 *
 * Author: @lluismh
 *
 * This work is licensed under a Creative Commons Attribution-ShareAlike 4.0
 * International License.
 */

$fn = 60;

length = 85;
wall_thickness = 2;
gap_thickness = 4;
sidepart_width = 25.4;
sidepart_external_width = 7;
frontpart_width = 20;
sidepart_internal_width = sidepart_width - sidepart_external_width;

total_thickness = gap_thickness + 2 * wall_thickness;
padding_thickness = total_thickness;
padding_length = sidepart_width * 1.5;
padding_width = frontpart_width / 2;
padding_radius = 2;


rotate(a = 90, v = [0, -1, 0]) {

    difference() {

      // Draw two cubes together

      union() {
        cube([length, frontpart_width, total_thickness]);
        cube([sidepart_width, length, total_thickness]);

        translate([(frontpart_width-padding_width)/3, sidepart_width - (padding_length/2), (-padding_thickness / 2) + (total_thickness/2)]) {
          hull() {
            translate([0, 0, 0]) {
              sphere(padding_radius);
            }

            translate([padding_length, 0, 0]) {
              sphere(padding_radius);
            }

            translate([padding_length, padding_width, 0]) {
              sphere(padding_radius);
            }

            translate([0, padding_width, 0]) {
              sphere(padding_radius);
            }

            translate([0, 0, padding_thickness]) {
              sphere(padding_radius);
            }

            translate([padding_length, 0, padding_thickness]) {
              sphere(padding_radius);
            }

            translate([padding_length, padding_width, padding_thickness]) {
              sphere(padding_radius);
            }

            translate([0, padding_width, padding_thickness]) {
              sphere(padding_radius);
            }
          }
        }
      }

      // Remove the inside form both of them

      translate([sidepart_internal_width, wall_thickness, wall_thickness]) {
        cube([length, length, gap_thickness]);
      }
    }
}
