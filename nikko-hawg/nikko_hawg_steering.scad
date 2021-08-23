/* NIKKO Hawg 1/10 rc car steering piece
 *
 * Replacement piece for the steering-transmission of a NIKKO Hawg 1/10 rc car.
 * The original piece is made of ABS and is screwed into place through two sleeved M3 bolts which eventually eat into the ABS and
 * prevents the steering from working (every time you use the car you lose the screws which are really expensive to come by).
 *
 * The replacement piece has two built-in M3 nut catchers which the screws attach to, prevent the screws from eating into the plastic.
 *
 * Author: @lluismh
 *
 * This work is licensed under a Creative Commons Attribution-ShareAlike 4.0
 * International License.
 */

include <nutsnbolts/cyl_head_bolt.scad>;

$fn = 60;

tube_exterior_bigger_diameter = 16;
tube_exterior_smaller_diameter = 14.7;

tube_interior_first_segment_diameter = 11.5;
tube_interior_first_segment_length = 4;
tube_interior_second_segment_diameter = 9;
tube_interior_second_segment_length = 5;
tube_interior_third_segment_diameter = 12;
tube_interior_third_segment_length = 15;

tube_exterior_length = tube_interior_first_segment_length + tube_interior_first_segment_length + tube_interior_third_segment_length;
tube_wall_thickness = (tube_exterior_bigger_diameter - tube_interior_third_segment_diameter) / 2;

side_retainer_exterior_diameter = 8;
side_retainer_exterior_length = 5;
side_retainer_nut = "M3";

servo_section_thickness = 2;
servo_section_base_width = 2;
servo_section_hole_diameter = 3;
servo_section_hole_section_length = 8;
servo_section_hole_section_width = 11;
servo_section_support_section_width = 16;

difference() {

    union() {

        // Main body
        difference() {
            cylinder(r = tube_exterior_bigger_diameter / 2, h = tube_exterior_length);

            union() {
                cylinder(r = tube_interior_first_segment_diameter / 2, h = tube_interior_first_segment_length);

                translate([0, 0, tube_interior_first_segment_length]) {
                    cylinder(r = tube_interior_second_segment_diameter / 2, h = tube_interior_second_segment_length);

                    translate([0, 0, tube_interior_second_segment_length]) {
                        cylinder(r = tube_interior_third_segment_diameter / 2, h = tube_interior_third_segment_length);
                    }
                }
            }
        }


        // Side retainers
        translate([tube_exterior_bigger_diameter / 2 - tube_wall_thickness/2, 0, tube_exterior_length - side_retainer_exterior_diameter / 2]) {
            rotate(a = 90, v = [0, 1, 0]) {
                side_retainer();
            }
        }

        translate([-tube_exterior_bigger_diameter / 2 + tube_wall_thickness/2, 0, tube_exterior_length - side_retainer_exterior_diameter / 2]) {
            rotate(a = 90, v = [0, -1, 0]) {
                rotate(a=180, v= [0,0,1]) {
                    side_retainer();
                }
            }
        }



        // Struts

            translate([tube_exterior_bigger_diameter/2 + tube_wall_thickness / 2, -tube_wall_thickness/2, 0]) {
                rotate([0, -90, 0]) {
                    strut();
                }
            }

            translate([-tube_exterior_bigger_diameter/2 + tube_wall_thickness / 2, -tube_wall_thickness/2, 0]) {
                rotate([0, -90, 0]) {
                    strut();
                }
            }

            translate([tube_wall_thickness / 2, -tube_exterior_bigger_diameter/2 - tube_wall_thickness / 2, 0]) {
                rotate([0, -90, 0]) {
                    strut();
                }
            }

            translate([tube_wall_thickness / 2, tube_exterior_bigger_diameter/2 - tube_wall_thickness / 2, 0]) {
                rotate([0, -90, 0]) {
                    strut();
                }
            }



        // Servo connector section

        translate([servo_section_thickness/2, tube_exterior_bigger_diameter/2 - tube_wall_thickness/2, 0]) {
            rotate([0, -90, 0]) {
                servo_connector();
            }
        }
    }

    // Make hole through retainer for M3 screw
        translate([tube_exterior_bigger_diameter + 3 * tube_wall_thickness, 0, tube_exterior_length - side_retainer_exterior_diameter / 2]) {
        rotate([0, 90, 0]) {
        hole_through(name="M3", l= 3  * tube_exterior_bigger_diameter);
        }
    }
    
}

module side_retainer() {
            difference() {
                cylinder(r = side_retainer_exterior_diameter / 2, h = side_retainer_exterior_length + 0.5);
                translate([0, 0, 2 * tube_wall_thickness]) {
                    rotate([0, 0, 180]) {
                      nutcatch_sidecut("M3", l=10, clk=0.1, clh=0.1, clsl=0.1);

                    }
                    // nut("M3");
      //              nutcatch_parallel("M3", clh=0.1);
                }
            }
}

module strut() {
    cube([tube_exterior_length - side_retainer_exterior_diameter, tube_wall_thickness, tube_wall_thickness]);
}

module servo_connector() {
    union() {
    linear_extrude(height = servo_section_thickness) {
        polygon(points = [[0, 0], [0, servo_section_base_width], [tube_exterior_length, servo_section_base_width + servo_section_support_section_width], [tube_exterior_length + servo_section_hole_section_length, servo_section_base_width + servo_section_support_section_width], [tube_exterior_length, servo_section_base_width], [tube_exterior_length, 0]]);
    }

    translate([tube_exterior_length, servo_section_base_width + servo_section_support_section_width, 0]) {
        difference() {
            union() {
                cube([servo_section_hole_section_length, servo_section_hole_section_width - servo_section_hole_section_length / 2, servo_section_thickness]);
                translate([servo_section_hole_section_length / 2, servo_section_hole_section_width - servo_section_hole_section_length / 2, 0]) {
                    cylinder(r = servo_section_hole_section_length / 2, h = servo_section_thickness);
                }
            }

            translate([servo_section_hole_section_length / 2, servo_section_hole_section_width - servo_section_hole_section_length / 2, 0]) {
                cylinder(r = servo_section_hole_diameter / 2, h = servo_section_thickness * 3);
            }

            translate([servo_section_hole_section_length / 2, servo_section_hole_section_width - servo_section_hole_section_length / 2, servo_section_thickness]) {
                sphere(r = servo_section_thickness);
            }

            translate([servo_section_hole_section_length / 2, servo_section_hole_section_width - servo_section_hole_section_length / 2, -servo_section_thickness / 2]) {
                sphere(r = servo_section_thickness);
            }

        }
    }
    }
}
