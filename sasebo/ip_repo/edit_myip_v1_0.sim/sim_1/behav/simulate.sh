#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2015.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim myip_v1_0_behav -key {Behavioral:sim_1:Functional:myip_v1_0} -tclbatch myip_v1_0.tcl -log simulate.log
