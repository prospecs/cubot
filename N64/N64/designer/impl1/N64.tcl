# Created by Microsemi Libero Software 11.8.0.26
# Mon Dec 04 17:57:37 2017

# (OPEN DESIGN)

open_design "N64.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "N64_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {C:\Users\pearcere\Documents\N64\N64\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"


# import of input files
import_source  \
-format "edif" -edif_flavor "GENERIC" -netlist_naming "VERILOG" {../../synthesis/N64.edn} \
-format "pdc"  {..\..\component\work\N64\N64.pdc} -merge_physical "yes" -merge_timing "yes"
compile
report -type "status" {N64_compile_report.txt}
report -type "pin" -listby "name" {N64_report_pin_byname.txt}
report -type "pin" -listby "number" {N64_report_pin_bynumber.txt}

save_design
