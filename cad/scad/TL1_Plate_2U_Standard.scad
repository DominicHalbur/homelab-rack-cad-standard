// TL1_Plate_2U_Standard
// Homelab Rack CAD Standard v1.0 - millimeters
// Mount positions provisional: test-fit against DeskPi TL1 rail!
plate_width=250;
plate_height=87.9;
plate_thickness=3;
slot_width=10;
slot_height=6;
slot_x=[6.74,243.26];
slot_y=[5.85,82.05];
difference() {
  cube([plate_width,plate_height,plate_thickness]);
  for (x=slot_x) for (y=slot_y)
    translate([x-slot_width/2,y-slot_height/2,-0.5])
      cube([slot_width,slot_height,plate_thickness+1]);
}
