new_project \
    -name {N64} \
    -location {C:\Users\pearcere\Documents\N64\designer\impl1\N64_fp} \
    -mode {single}
set_device_type -type {A2F200M3F}
set_device_package -package {484 FBGA}
update_programming_file \
    -feature {prog_fpga:on} \
    -fdb_source {fdb} \
    -fdb_file {C:\Users\pearcere\Documents\N64\designer\impl1\N64.fdb} \
    -feature {prog_from:off} \
    -feature {prog_nvm:on} \
    -efm_content {location:0;source:efc} \
    -efm_block {location:0;config_file:{C:\Users\pearcere\Documents\N64\component\work\N64_MSS\MSS_ENVM_0\MSS_ENVM_0.efc}} \
    -pdb_file {C:\Users\pearcere\Documents\N64\designer\impl1\N64_fp\N64.pdb}
set_programming_action -action {PROGRAM}
run_selected_actions
save_project
close_project
