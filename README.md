# Homelab Rack CAD Standard

**Version 1.1 · 2026-10-19**  
Custom Autodesk Inventor design convention for a **DeskPi RackMate TL1 10-inch, 10U rack**.

> This is a **personal fabrication standard**, not an official DeskPi specification or a claim of universal EIA panel dimensions. Actual rail-hole coordinates and mounting fit must be checked against the physical rack or a manufacturer CAD drawing before fabricating load-bearing parts.

## 1. Units and coordinate conventions

- All CAD dimensions are **millimeters**.
- In a front-facing sketch, **X increases right**, **Y increases up**, and the plate's **bottom-left corner is (0, 0)**.
- Keep the **rack pitch** separate from the **fabricated panel size**. One rack unit (1U) is **44.45 mm (1.75 in)** tall.
- A physical panel is deliberately smaller than its allocated vertical envelope to avoid clashes with adjacent panels.
- Place successive assemblies on the rack's **44.45 mm/U grid**; do not stack them using finished faceplate heights.

## TL1 verified faceplate width and 2U reference

- **250 mm** is the outside faceplate width for DeskPi RackMate TL1-compatible 1U and 2U blank panels. It is NOT the inner rack width or rail hole pitch.
- DeskPi's 2U blank panel is **250 × 88 mm** (width × height). The planned waterjet-cut four-node frame should start at **250 × 88 × 3 mm** (W × H × T, aluminum), subject to physical fit checks.
- The existing custom parametric 2U template is **87.900 mm high**, deliberately 0.1 mm shorter than DeskPi's nominal 88 mm 2U panel. Do not mistake this custom value for the manufacturer's nominal size.
- The horizontal rack mounting hole pitch of **236.52 mm** is provisional based on a third-party model. Measure on the physical TL1 before machining.
- Continue to use the custom 10 × 6 mm horizontal rack slots; verify actual hole alignment, fastener bearing area and edge margins (only 1.74 mm outside ligament at provisional X positions).
- Waterjet cutting does not produce threads: cut appropriate pilots and finish-drill/tap M3 × 0.5, or use captive nuts.
- Sources: [DeskPi 2U blank panel](https://wiki.deskpi.com/rackmate/accessories/dp-0051-2u-blank-panel/) and [DeskPi 1U blank panel](https://wiki.deskpi.com/rackmate/accessories/dp-0032-1u-blank-panel/).

## 2. Master plate dimensions

**Custom design rule:** panel width **250.000 mm**; target finished panel height = `44.45 × U − 1.00 mm`; initial printed plate thickness **3.00 mm**.

| Panel | Allocated height (mm) | Custom panel height (mm) | Total nominal vertical clearance (mm) |
| --- | ---: | ---: | ---: |
| 0.5U | 22.225 | **21.225** | 1.000 |
| 1U | 44.450 | **43.450** | 1.000 |
| 1.5U | 66.675 | **65.675** | 1.000 |
| 2U | 88.900 | **87.900** | 1.000 |
| 2.5U | 111.125 | **110.125** | 1.000 |
| 3U | 133.350 | **132.350** | 1.000 |

A centered panel has **0.50 mm nominal top and bottom clearance**. These are theoretical CAD allowances; actual gaps depend on mounting position, tolerances, distortion, and adjacent parts.

**Legacy design:** A previously working **88.11 mm 2U plate** may be retained. It has 0.79 mm theoretical total vertical clearance. Do not forcibly resize existing compatible models.

**Important about 0.5U:** Half-U panels are a custom packaging convention; the standard rail-hole sequence does **not** repeat at 0.5U. A half-U faceplate may need elongated or specially positioned mounting slots to engage real holes. Verify it against the physical rail and other panels.

## 3. Mounting geometry

### Horizontal rail-center spacing

| Variable | Provisional CAD reference |
| --- | ---: |
| Left rail-hole center X | **6.740 mm** |
| Right rail-hole center X | **243.260 mm** |
| Hole center-to-center spacing | **236.520 mm** |

These values assume a centered 250 mm panel and come from a **third-party TL1 STEP-derived reference**, not an independently confirmed manufacturer drawing. **Measure or test-fit before relying on them**, especially on wide printed parts.

### Vertical rail-hole sequence

The EIA rack pattern has **uneven** hole intervals:

```text
15.875 mm → 15.875 mm → 12.700 mm → repeat
```

For an assumed full-U boundary at Y = 0, standard reference hole centers are:

| Hole | Y (mm) |
| --- | ---: |
| U1 lower | 6.350 |
| U1 middle | 22.225 |
| U1 upper | 38.100 |
| U2 lower | 50.800 |
| U2 middle | 66.675 |
| U2 upper | 82.550 |
| U3 lower | 95.250 |
| U3 middle | 111.125 |
| U3 upper | 127.000 |

**Crucial:** These are coordinates relative to a **rack-unit boundary**, **not automatically coordinates relative to the bottom of a shorter finished plate**. To calculate sketch-space Y: subtract the actual vertical offset of the panel's bottom edge from the rack-unit boundary. A panel centered in its envelope has a +0.5 mm panel-bottom offset under the 1 mm clearance convention. Confirm that the desired hole truly falls within the plate.

A 1U faceplate can typically use the lower and upper rail holes (31.75 mm apart). A 2U panel can use the U1 lower and U2 upper holes (76.20 mm apart), or another suitable pattern. Choose screw points based on load and actual rack alignment.

## 4. Slot specification

**Preferred modeling slot:** **10.00 mm wide (X) × 6.00 mm tall (Y)**, **horizontal**, four slots (two per side) *where the particular panel layout allows it*.

- For a **rectangular slot**, width means the entire X extent and height means the entire Y extent.
- From the center `(xc, yc)`, rectangle corners are `(xc − 5, yc − 3)` and `(xc + 5, yc + 3)`.
- A rounded slot is **not equivalent** to a rectangle. If using Inventor's center-to-center **Slot** tool, account for its end radius and the tool's dimension definition.
- Preserve orientation: **10 across × 6 tall**, not 6 across × 10 tall.
- Slot locations should correspond to **actual rail holes**, following the repeating uneven pattern above.
- **Do not blindly place two 6 mm-high slots at arbitrary Y values on a 0.5U plate.** Use actual hole positions and check edge margins and overlap.

### Mounting ear/edge clearance warning

With the provisional X centers and 10 mm-wide slots on a 250 mm plate:

```text
left outside ligament  = 6.74 − 10/2 = 1.74 mm
right outside ligament = 250 − (243.26 + 10/2) = 1.74 mm
```

**1.74 mm is thin for a load-carrying 3D-printed ear.** These slot coordinates are useful for tracing or checking existing panels, but must **not** be assumed strong enough for a printed shelf or cantilevered cradle.

For practical designs, consider stronger reinforced ears, a different verified fastener-slot geometry, thicker/stronger material, or metal reinforcement. Confirm fastener head/washer bearing area, tolerances, and printer wall/perimeter count. Never increase screw torque to compensate for a poor fit.

### Reproducing existing Tecmojo 0.5U panels

The user's existing 0.5U Tecmojo panels have **four slots: two on the left and two on the right**. Their requested slot aperture is **10 × 6 mm**. The **vertical center coordinates have not been measured/verified**; do not fabricate them from a guessed half-U standard. Capture the real center-to-center Y distance and slot-to-edge offsets with calipers before finalizing a replica.

## 5. Clearances and fabrication

| Feature | Initial design rule | Qualification |
| --- | --- | --- |
| Between allocated U height and plate | **1.00 mm total** | 0.50 mm each side when centered; this is a custom convention |
| Panel thickness | **3.00 mm** | Increase/reinforce for structural loads |
| Width | **250.00 mm** | Validate against actual rack and neighboring accessories |
| Screw/slot fit | 10 × 6 mm rectangles | Verify screw shank, head/washer, and required positional adjustment |
| Adjacent rack components | Model collision envelopes | Leave room for connector shells, cable bend radii, fan airflow, and screw heads |
| Printed holes and mating parts | Calibrate on test coupons | Shrinkage, elephant foot and printer tuning affect fit |

Avoid extrapolating 1 mm panel-height clearance into unrelated dimensions such as screw holes, device cradles, PCB standoffs, or slide-fit tolerances. Those require separate allowances and test fitting.

## 6. Autodesk Inventor parameters

Create these in **Manage → Parameters** (dimensions in mm):

| Parameter | Formula/value |
| --- | --- |
| `RackU` | `44.45 mm` |
| `PanelU` | `2 ul` (unitless user parameter; change per design) |
| `PanelWidth` | `250 mm` |
| `PanelClearance` | `1 mm` |
| `PanelHeight` | `RackU * PanelU - PanelClearance` |
| `PanelThickness` | `3 mm` |
| `RailSpacingX` | `236.52 mm` (provisional) |
| `LeftMountX` | `(PanelWidth - RailSpacingX) / 2` |
| `RightMountX` | `(PanelWidth + RailSpacingX) / 2` |
| `SlotX` | `10 mm` |
| `SlotY` | `6 mm` |

`PanelU` must be configured as a **unitless** parameter in Inventor (for example `2`, not a length measurement).

### Basic modeling workflow

1. Start a **Standard (mm).ipt**, XY sketch, bottom-left origin.
2. Sketch a rectangle: `PanelWidth × PanelHeight`.
3. Extrude `PanelThickness`.
4. Sketch mounting rectangles **SlotX × SlotY**, dimension center X positions, and locate Y coordinates from **real rack holes**.
5. **Extrude → Cut → Through All**.
6. Add device cutouts, structural ribs and mounting bosses as separate editable features.
7. Save the IPT master; export STL/3MF for print and STEP for neutral CAD sharing.
8. Print a **small mounting fit coupon** before committing to a full plate.

## 7. Source and verification policy

- [DeskPi RackMate documentation](https://wiki.deskpi.com/rackmate/)
- [DeskPi official 3D print model repository](https://github.com/DeskPi-Team/3DPrint-Models)
- [Community TL1 model/reference measurements](https://github.com/el-bakkali/rackmate-tl1-mods)

Keep three categories separate in future designs:

1. **Normative rack-unit geometry:** 44.45 mm per U and repeating vertical rail-hole pattern.
2. **This project's chosen fabrication conventions:** 250 mm wide, 1 mm total vertical clearance, 3 mm starting thickness, 10 × 6 mm rectangular slot convention.
3. **To-be-verified physical dimensions:** TL1 exact horizontal center spacing, mounting hardware tolerances, and Tecmojo 0.5U vertical slot centers.

## 8. Planned repository structure

```text
README.md
cad/              # Native Inventor IPT/IAM files
drawings/         # Dimensioned 2D drawing PDFs and DXFs
exports/          # STEP and printable STL/3MF
reference/        # Physical measurements and annotated test-fit notes
```

**License:** Not yet specified. No license is implied; add one when you're ready to share reuse rights.

## 9. Starter faceplate CAD parts (0.5U through 2U)

The repository includes **8 flat faceplate templates**, each available as:

- [`cad/scad/`](cad/scad/) — editable parametric **OpenSCAD** solids with plate thickness and rectangular mounting cutouts.
- [`cad/dxf/`](cad/dxf/) — **DXF 2D face profiles** and slot outlines for **Autodesk Inventor sketch import**, extrusion and subsequent feature editing.

| Design | Plate height (mm) | Hole centers Y from panel bottom (mm) | Number of slots |
| --- | ---: | --- | ---: |
| 0.5U standard | 21.225 | 5.850 | 2 |
| 0.5U +0.5U shift | 21.225 | 15.375 | 2 |
| 1U standard | 43.450 | 5.850, 37.600 | 4 |
| 1U +0.5U shift | 43.450 | 15.375, 28.075 | 4 |
| 1.5U standard | 65.675 | 5.850, 50.300 | 4 |
| 1.5U +0.5U shift | 65.675 | 15.375, 59.825 | 4 |
| 2U standard | 87.900 | 5.850, 82.050 | 4 |
| 2U +0.5U shift | 87.900 | 15.375, 72.525 | 4 |

All profiles are **250 mm wide**, **3 mm thick in SCAD**, and contain **10 mm (X) × 6 mm (Y)** rectangular slots at X = 6.74 mm and 243.26 mm. A half-U-shifted design means its allotted vertical space starts **22.225 mm higher relative to the rack full-U grid**, not that the physical plate grows or that holes are regularly spaced.

**Design limitation:** The 0.5U starters have one slot per side (2 total) because two separate standard rack holes do not necessarily fit a 0.5U panel. They do **not** replicate the four-slot Tecmojo 0.5U panels. That product-specific layout still needs physical measurement. All provisional X locations and the shifted vertical hole selections must be **test-fit before loading equipment**.

### Inventor workflow

1. Download the DXF for the intended height and mounting offset.
2. Open/import its geometry into an Inventor part sketch (millimeters).
3. Extrude the **outer panel profile 3 mm**, then cut each slot **Through All** using the imported profiles (or recreate the slots with rectangle geometry).
4. Save the result as a native `.ipt` and use it as your editable master for device-specific modifications.
5. Alternatively, open a STEP model from the separately generated ZIP package to import a 3D solid into Inventor. STEP is an editable solid, but it **does not preserve native Inventor sketch/feature history**.

