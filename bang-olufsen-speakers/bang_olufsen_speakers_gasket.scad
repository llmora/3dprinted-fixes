/* Bang Olufsen speaker gasket
 *
 * Author: @lluismh
 *
 * This work is licensed under a Creative Commons Attribution-ShareAlike 4.0
 * International License.
 */


$fn = 100;

ring_diameter_exterior = 80;
ring_width = 4;
ring_thickness = 0.6;
ring_top_thickness = ring_thickness + 0.6;
ring_top_width = 0.8;

difference() {
  cylinder(h = ring_top_thickness, d = ring_diameter_exterior, center = false);
  cylinder(h = ring_top_thickness, d = ring_diameter_exterior - (ring_width * 2), center = false);

  translate([0, 0, ring_thickness]) {
    difference() {
      cylinder(h = ring_top_thickness, d = ring_diameter_exterior, center = false);
      cylinder(h = ring_top_thickness, d = ring_diameter_exterior - (ring_width * 2) + (ring_top_width * 2), center = false);
    }
  }
}
