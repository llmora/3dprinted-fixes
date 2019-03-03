/* SMEG fridge shelf back corner replacement
 *
 * The plastic corners in our SMEG fridge are quite flimsy and after a couple of
 * years they just broke away. It has been impossible to source replacements so
 * we decided to design simple functional replacements for them.
 *
 * This is a replacement for the plastic corner that goes at the back, it is
 * symmetric so you can print it in any direction for both corners.
 *
 * Author: @lluismh
 *
 * This work is licensed under a Creative Commons Attribution-ShareAlike 4.0
 * International License.
 */

include <nutsnbolts/cyl_head_bolt.scad>;

$fn = 60;

total_length = 54.50;
widerpart_length = 40;

widerpart_height = 13;
slimmerpart_height = 12;

thickness = 5;

screw_name="M3x5";
ds = _get_screw(screw_name);
df = _get_screw_fam(screw_name);

module holder() {

  translate([0, 0, thickness + (df[_NB_F_HEAD_HEIGHT])]) {
    hole_through(df[_NB_F_DESC], l=ds[_NB_S_LENGTH], h=df[_NB_F_HEAD_HEIGHT]);
  };

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
