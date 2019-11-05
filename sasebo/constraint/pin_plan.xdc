# on board single-end clock, 100MHz
#set_property PACKAGE_PIN AB2 [get_ports clk_p]
#set_property PACKAGE_PIN AC2 [get_ports clk_n]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_p]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_n]

# Reset active high SW4.1 User button South
set_property IOSTANDARD LVCMOS25 [get_ports {rst_top}]
set_property PACKAGE_PIN  L23 [get_ports {rst_top}]

# UART Pins
#set_property PACKAGE_PIN D19 [get_ports rxd]
#set_property IOSTANDARD LVCMOS25 [get_ports rxd]
set_property PACKAGE_PIN N17 [get_ports txd]
set_property IOSTANDARD LVCMOS25 [get_ports txd]


#R18
#U19
#P19

# SD/SPI Pins
set_property PACKAGE_PIN P24 [get_ports spi_cs]
set_property IOSTANDARD LVCMOS25 [get_ports spi_cs]
set_property PACKAGE_PIN F22 [get_ports spi_sclk]
set_property IOSTANDARD LVCMOS25 [get_ports spi_sclk]
set_property PACKAGE_PIN G22 [get_ports spi_mosi]
set_property IOSTANDARD LVCMOS25 [get_ports spi_mosi]
set_property PACKAGE_PIN G24 [get_ports spi_miso]
set_property IOSTANDARD LVCMOS25 [get_ports spi_miso]

#NET "osc_en_b" LOC="M1" |IOSTANDARD=LVCMOS25 |SLEW="QUIETIO" |DRIVE=2 |TIG;

set_property PACKAGE_PIN J8 [get_ports osc_en_b]
set_property IOSTANDARD LVCMOS25 [get_ports osc_en_b]

#set_property PACKAGE_PIN M1 [get_ports osc_en_b]
#set_property IOSTANDARD LVCMOS25 [get_ports osc_en_b]

#set_property PACKAGE_PIN AB2 [get_ports clk1]
#set_property IOSTANDARD LVCMOS15 [get_ports clk1]
#set_property PACKAGE_PIN AC11 [get_ports clk_n]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_n]


set_property PACKAGE_PIN G17 [get_ports clko]
set_property IOSTANDARD LVCMOS25 [get_ports clko]

set_property PACKAGE_PIN H17 [get_ports clko1]
set_property IOSTANDARD LVCMOS25 [get_ports clko1]

#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets SYS_CLOCK]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_p_IBUF]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_n_IBUF]

#set_property CLOCK_DEDICATED_ROUTE BACKBONE [get_nets dram_ctl/u_mig_7series_0_mig/u_ddr3_clk_ibuf/sys_clk_ibufg]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets dram_ctl/u_mig_7series_0_mig/u_ddr3_clk_ibuf/sys_clk_ibufg]

# Heartbeat 
set_property PACKAGE_PIN G20 [get_ports led[0]]
set_property IOSTANDARD LVCMOS25 [get_ports led[0]]
set_property PACKAGE_PIN D19 [get_ports led[1]]
set_property IOSTANDARD LVCMOS25 [get_ports led[1]]



# Debug Signals From SASEBO IP
set_property PACKAGE_PIN K18 [get_ports led1[0]]
set_property IOSTANDARD LVCMOS25 [get_ports led1[0]]
set_property PACKAGE_PIN H19 [get_ports led1[1]]
set_property IOSTANDARD LVCMOS25 [get_ports led1[1]]
set_property  PACKAGE_PIN K15 [get_ports led1[2]] 
set_property IOSTANDARD LVCMOS25 [get_ports led1[2]]
set_property  PACKAGE_PIN P16 [get_ports led1[3]] 
set_property IOSTANDARD LVCMOS25 [get_ports led1[3]]



set_property PACKAGE_PIN    AB11  [get_ports lbus_clkn]
set_property IOSTANDARD LVCMOS15 [get_ports lbus_clkn]
set_property  PACKAGE_PIN   AA13 [get_ports lbus_rstn]
set_property IOSTANDARD LVCMOS15 [get_ports lbus_rstn]


set_property  PACKAGE_PIN  V4   [get_ports lbus_do[0]]
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[0]]
set_property PACKAGE_PIN   V2   [get_ports lbus_do[1]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[1]]
set_property PACKAGE_PIN   W1   [get_ports lbus_do[2]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[2]]
set_property PACKAGE_PIN   AB1  [get_ports lbus_do[3]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[3]]
set_property PACKAGE_PIN   Y3   [get_ports lbus_do[4]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[4]]
set_property PACKAGE_PIN   U7   [get_ports lbus_do[5]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[5]]
set_property PACKAGE_PIN   V3   [get_ports lbus_do[6]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[6]]
set_property PACKAGE_PIN   AF10 [get_ports lbus_do[7]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[7]]
set_property PACKAGE_PIN   AC13  [get_ports lbus_do[8]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[8]]
set_property PACKAGE_PIN   AE12 [get_ports lbus_do[9]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[9]]
set_property PACKAGE_PIN    U6   [get_ports lbus_do[10]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[10]]
set_property PACKAGE_PIN   AE13 [get_ports lbus_do[11]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[11]]
set_property PACKAGE_PIN  AA10 [get_ports lbus_do[12]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[12]]
set_property PACKAGE_PIN  AB12 [get_ports lbus_do[13]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[13]]
set_property PACKAGE_PIN  AA4  [get_ports lbus_do[14]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[14]]
set_property PACKAGE_PIN  AE8  [get_ports lbus_do[15]] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_do[15]]

set_property PACKAGE_PIN  AD10 [get_ports lbus_wrn] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_wrn]
set_property PACKAGE_PIN  Y13  [get_ports lbus_rdn] 
set_property IOSTANDARD LVCMOS15 [get_ports lbus_rdn]


set_property  PACKAGE_PIN   T22 [get_ports lbus_di_a[0]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[0]]
set_property  PACKAGE_PIN   M24 [get_ports lbus_di_a[1]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[1]]
set_property  PACKAGE_PIN   K25 [get_ports lbus_di_a[2]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[2]]
set_property  PACKAGE_PIN   R26 [get_ports lbus_di_a[3]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[3]]
set_property  PACKAGE_PIN   M25 [get_ports lbus_di_a[4]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[4]]
set_property  PACKAGE_PIN   U17 [get_ports lbus_di_a[5]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[5]]
set_property  PACKAGE_PIN   N26 [get_ports lbus_di_a[6]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[6]]
set_property  PACKAGE_PIN   R16 [get_ports lbus_di_a[7]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[7]]
set_property  PACKAGE_PIN   T20 [get_ports lbus_di_a[8]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[8]]
set_property  PACKAGE_PIN   R22 [get_ports lbus_di_a[9]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[9]]
set_property  PACKAGE_PIN  M21 [get_ports lbus_di_a[10]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[10]]
set_property  PACKAGE_PIN  T24 [get_ports lbus_di_a[11]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[11]]
set_property  PACKAGE_PIN  P23 [get_ports lbus_di_a[12]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[12]]
set_property  PACKAGE_PIN  N21 [get_ports lbus_di_a[13]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[13]]
set_property  PACKAGE_PIN  R21 [get_ports lbus_di_a[14]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[14]]
set_property  PACKAGE_PIN  N18 [get_ports lbus_di_a[15]] 
set_property IOSTANDARD LVCMOS25 [get_ports lbus_di_a[15]]

#NET "lbus_clkn" TNM_NET = "clkin_grp";
#TIMESPEC "TS_clkin" = PERIOD : "clkin_grp" : 41.666 ns HIGH 50.0%;