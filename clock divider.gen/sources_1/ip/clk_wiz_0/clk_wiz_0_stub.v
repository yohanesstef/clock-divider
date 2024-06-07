// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Jun  7 04:30:02 2024
// Host        : LAPTOP-OKS212KI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {e:/Projects/Vivado/clock divider/clock
//               divider.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v}
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(CLK_32MHZ, clk_in)
/* synthesis syn_black_box black_box_pad_pin="clk_in" */
/* synthesis syn_force_seq_prim="CLK_32MHZ" */;
  output CLK_32MHZ /* synthesis syn_isclock = 1 */;
  input clk_in;
endmodule
