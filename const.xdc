## Clock signal
set_property PACKAGE_PIN W5 [get_ports i_clk]
set_property IOSTANDARD LVCMOS33 [get_ports i_clk]
create_clock -add -name sys_clk_pin -period 10.00 [get_ports i_clk]

## Asignar los switches a i_data_bus[9:0]
set_property PACKAGE_PIN V17 [get_ports {i_data_bus[0]}] ; # SW0
set_property IOSTANDARD LVCMOS33 [get_ports {i_data_bus[0]}]

set_property PACKAGE_PIN V16 [get_ports {i_data_bus[1]}] ; # SW1
set_property IOSTANDARD LVCMOS33 [get_ports {i_data_bus[1]}]

set_property PACKAGE_PIN W16 [get_ports {i_data_bus[2]}] ; # SW2
set_property IOSTANDARD LVCMOS33 [get_ports {i_data_bus[2]}]

set_property PACKAGE_PIN W17 [get_ports {i_data_bus[3]}] ; # SW3
set_property IOSTANDARD LVCMOS33 [get_ports {i_data_bus[3]}]

set_property PACKAGE_PIN W15 [get_ports {i_data_bus[4]}] ; # SW4
set_property IOSTANDARD LVCMOS33 [get_ports {i_data_bus[4]}]

set_property PACKAGE_PIN V15 [get_ports {i_data_bus[5]}] ; # SW5
set_property IOSTANDARD LVCMOS33 [get_ports {i_data_bus[5]}]

set_property PACKAGE_PIN W14 [get_ports {i_data_bus[6]}] ; # SW6
set_property IOSTANDARD LVCMOS33 [get_ports {i_data_bus[6]}]

set_property PACKAGE_PIN W13 [get_ports {i_data_bus[7]}] ; # SW7
set_property IOSTANDARD LVCMOS33 [get_ports {i_data_bus[7]}]

set_property PACKAGE_PIN T18 [get_ports {i_refresh}] ; # BTNL (Left Button)
set_property IOSTANDARD LVCMOS33 [get_ports {i_refresh}]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets i_refresh_IBUF]

## Asignar o_result[7:0] a los LEDs LD0-LD7
set_property PACKAGE_PIN U16 [get_ports {o_result[0]}] ; # LD0
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[0]}]

set_property PACKAGE_PIN E19 [get_ports {o_result[1]}] ; # LD1
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[1]}]

set_property PACKAGE_PIN U19 [get_ports {o_result[2]}] ; # LD2
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[2]}]

set_property PACKAGE_PIN V19 [get_ports {o_result[3]}] ; # LD3
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[3]}]

set_property PACKAGE_PIN W18 [get_ports {o_result[4]}] ; # LD4
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[4]}]

set_property PACKAGE_PIN U15 [get_ports {o_result[5]}] ; # LD5
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[5]}]

set_property PACKAGE_PIN U14 [get_ports {o_result[6]}] ; # LD6
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[6]}]

set_property PACKAGE_PIN V14 [get_ports {o_result[7]}] ; # LD7
set_property IOSTANDARD LVCMOS33 [get_ports {o_result[7]}]

#Load
set_property PACKAGE_PIN W19 [get_ports {i_load_A}] ; # Load A
set_property IOSTANDARD LVCMOS33 [get_ports {i_load_A}]

set_property PACKAGE_PIN U18 [get_ports {i_load_B}] ; # Load B
set_property IOSTANDARD LVCMOS33 [get_ports {i_load_B}]

set_property PACKAGE_PIN T17 [get_ports {i_load_op}] ; # Load op
set_property IOSTANDARD LVCMOS33 [get_ports {i_load_op}]
