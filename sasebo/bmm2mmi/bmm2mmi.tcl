proc bmm2mmi {bmm} {
     set mmi [file rootname $bmm]
     set fp [open $bmm r]
     set file_data [read $fp]
     close $fp
     set data [split $file_data "\n"]
     
     set fileout [open "${mmi}.mmi" "w"]
     puts $fileout "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
     puts $fileout "<MemInfo Version=\"1\" Minor=\"0\">"
     puts $fileout "  <Processor Endianness=\"Little\" InstPath=\"dummy\">"
     set addr_space 0
     set bus_space 0
     set block_count -1
     for {set i 0} {$i < [llength $data]} {incr i} {
     	set addr_name [string first "ADDRESS_SPACE" [lindex $data $i]]
     	set bus_block [string first "BUS_BLOCK" [lindex $data $i]]
     	if {$addr_name != -1 && $addr_space == 0} {
     		set addr_space 1
     		puts $fileout "    <AddressSpace Name=\"[address_range [lindex $data $i] name]\" Begin=\"[address_range [lindex $data $i] low]\" End=\"[address_range [lindex $data $i] high]\">"
     	} elseif {$addr_name != -1 && $addr_space == 1} {
     		set addr_space 0
     		puts $fileout "    </AddressSpace>"
     	} elseif {$bus_block != -1 && $bus_space == 0} {
     		set bus_space 1
     		set block_count [expr {$block_count + 1}]
     		puts $fileout "      <BusBlock>"
     	} elseif {$bus_block != -1 && $bus_space == 1} {
     		set bus_space 0
     		puts $fileout "      </BusBlock>"
     	} elseif {[string length [lindex $data $i]] > 30} {
		set temp [string trimleft [lindex $data $i]]
		set temp [split $temp " "]
		set bram [lindex $temp 0]
		set bmm_width [bram_info $bram bit_lane]
		set bmm_msb [get_bit_lanes [lindex $temp 2] msb]		
		set bmm_lsb [get_bit_lanes [lindex $temp 2] lsb]
		set bmm_range [bram_info $bram range]
		set range_begin [expr {$bmm_range * $block_count}]
		set range_end [expr {$range_begin + [expr {$bmm_range - 1}]}]
		set bram_type [bram_info $bram type]
		set placed [bram_info $bram location]
		puts $fileout "        <BitLane MemType=\"$bram_type\" Placement=\"$placed\">"
		puts $fileout "          <DataWidth MSB=\"$bmm_msb\" LSB=\"$bmm_lsb\"/>"
		puts $fileout "          <AddressRange Begin=\"$range_begin\" End=\"$range_end\"/>"
		puts $fileout "          <Parity ON=\"false\" NumBits=\"0\"/>" 
		puts $fileout "        </BitLane>" } }

     puts $fileout "  </Processor>"
     puts $fileout "<Config>"
     puts $fileout "  <Option Name=\"Part\" Val=\"[get_property PART [current_project ]]\"/>"
     puts $fileout "</Config>"
     puts $fileout "</MemInfo>"
     close $fileout
     puts "Conversion complete. To use updatemem, use the template command line below"
     puts "updatemem -force --meminfo ${mmi}.mmi --data <path to data file>.elf/mem --bit <path to bit file>.bit --proc dummy --out <output bit file>.bit"
}

proc get_bit_lanes {string type} {
	set bit_lane [regexp {\[(.+)\]} $string all 1 2]
	set temp [split $1 ":"]
	if {$type == "msb"} {
		return [lindex $temp 0]
	} else {
		return [lindex $temp 1]
	}
}

proc bram_info {bram type} {
	set temp_width [get_property WRITE_WIDTH_A [get_cells $bram]]
	set temp_loc [get_property LOC [get_cells $bram]]
	set temp [split $temp_loc "_"]
	set primitive [lindex $temp 0]
	set loc [lindex $temp 1]
	if {$type == "bit_lane"} {
		if {$temp_width == 9} {
			return 8
		} 
		elseif {$temp_width == 18} {
			return 16
		} else {
			return $temp_width
		}
	} elseif {$type == "type"} {
		if {$primitive == "RAMB36"} {
			return "RAMB32"
		}
	} elseif {$type == "range"} {
		if {$primitive == "RAMB36"} {
			set width [bram_info $bram bit_lane]
			return [expr {32768 / $width}]
		}
	} elseif {$type == "location"} {
		return $loc
	}
	
}

proc address_range {string type} {
	set temp [split $string " "]
	set range [lindex $temp 3]
	set range [split $range ":"]
	if {$type == "name"} {
		return [lindex $temp 1]
	} elseif {$type == "high"} {
		set high [string range [lindex $range 1] 2 [expr {[string length [lindex $range 1]] - 2 }]]
		set high [hex2dec $high]
		return [expr {$high + 1}]
	} elseif {$type == "low"} {
		set low [string range [lindex $range 0] 3 [string length [lindex $range 0]]]
		return [hex2dec $low]
	}
}

proc is_bram {cell} {
}

proc hex2dec {largeHex} {
    set res 0
    set largeHex [string range $largeHex 2 [expr {[string length $largeHex] - 1}]]
    foreach hexDigit [split $largeHex {}] {
        set new 0x$hexDigit
        set res [expr {16*$res + $new}]
    }
    return $res
}
