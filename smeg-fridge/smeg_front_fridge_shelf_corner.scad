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

rotate(a = 90, v = [0, -1, 0]) {
  difference() {

    // Draw two cubes together

    union() {
      cube([length, frontpart_width, total_thickness]);
      cube([sidepart_width, length, total_thickness]);
    }

    // Remove the inside form both of them

    translate([sidepart_internal_width, wall_thickness, wall_thickness]) {
      cube([length, length, gap_thickness]);
    }
  }
}
