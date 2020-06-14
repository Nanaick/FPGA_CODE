// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:demo_test:1.0
// IP Revision: 2006111745

(* X_CORE_INFO = "demo_test,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "demo_test_0,demo_test,{}" *)
(* CORE_GENERATION_INFO = "demo_test_0,demo_test,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=demo_test,x_ipVersion=1.0,x_ipCoreRevision=2006111745,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module demo_test_0 (
  idataOutCtrl_0_ap_vld,
  idataOutCtrl_1_ap_vld,
  idataOutCtrl_2_ap_vld,
  idataOutCtrl_3_ap_vld,
  fdataOutCtrl_0_ap_vld,
  fdataOutCtrl_1_ap_vld,
  fdataOutCtrl_2_ap_vld,
  fdataOutCtrl_3_ap_vld,
  ap_clk,
  ap_rst,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  idataInCtrl_0,
  idataInCtrl_1,
  idataInCtrl_2,
  idataInCtrl_3,
  fdataInCtrl_0,
  fdataInCtrl_1,
  fdataInCtrl_2,
  fdataInCtrl_3,
  idataOutCtrl_0,
  idataOutCtrl_1,
  idataOutCtrl_2,
  idataOutCtrl_3,
  fdataOutCtrl_0,
  fdataOutCtrl_1,
  fdataOutCtrl_2,
  fdataOutCtrl_3
);

output wire idataOutCtrl_0_ap_vld;
output wire idataOutCtrl_1_ap_vld;
output wire idataOutCtrl_2_ap_vld;
output wire idataOutCtrl_3_ap_vld;
output wire fdataOutCtrl_0_ap_vld;
output wire fdataOutCtrl_1_ap_vld;
output wire fdataOutCtrl_2_ap_vld;
output wire fdataOutCtrl_3_ap_vld;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *)
input wire ap_rst;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *)
input wire ap_start;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *)
output wire ap_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *)
output wire ap_idle;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum \
{}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long\
 minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *)
output wire ap_ready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME idataInCtrl_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}}\
 value false}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 idataInCtrl_0 DATA" *)
input wire [31 : 0] idataInCtrl_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME idataInCtrl_1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}}\
 value false}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 idataInCtrl_1 DATA" *)
input wire [31 : 0] idataInCtrl_1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME idataInCtrl_2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}}\
 value false}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 idataInCtrl_2 DATA" *)
input wire [31 : 0] idataInCtrl_2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME idataInCtrl_3, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}}\
 value false}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 idataInCtrl_3 DATA" *)
input wire [31 : 0] idataInCtrl_3;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fdataInCtrl_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maxim\
um {}} value 24}}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fdataInCtrl_0 DATA" *)
input wire [31 : 0] fdataInCtrl_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fdataInCtrl_1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maxim\
um {}} value 24}}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fdataInCtrl_1 DATA" *)
input wire [31 : 0] fdataInCtrl_1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fdataInCtrl_2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maxim\
um {}} value 24}}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fdataInCtrl_2 DATA" *)
input wire [31 : 0] fdataInCtrl_2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fdataInCtrl_3, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maxim\
um {}} value 24}}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fdataInCtrl_3 DATA" *)
input wire [31 : 0] fdataInCtrl_3;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME idataOutCtrl_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}\
} value false}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 idataOutCtrl_0 DATA" *)
output wire [31 : 0] idataOutCtrl_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME idataOutCtrl_1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}\
} value false}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 idataOutCtrl_1 DATA" *)
output wire [31 : 0] idataOutCtrl_1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME idataOutCtrl_2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}\
} value false}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 idataOutCtrl_2 DATA" *)
output wire [31 : 0] idataOutCtrl_2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME idataOutCtrl_3, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}\
} value false}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 idataOutCtrl_3 DATA" *)
output wire [31 : 0] idataOutCtrl_3;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fdataOutCtrl_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maxi\
mum {}} value 24}}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fdataOutCtrl_0 DATA" *)
output wire [31 : 0] fdataOutCtrl_0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fdataOutCtrl_1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maxi\
mum {}} value 24}}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fdataOutCtrl_1 DATA" *)
output wire [31 : 0] fdataOutCtrl_1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fdataOutCtrl_2, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maxi\
mum {}} value 24}}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fdataOutCtrl_2 DATA" *)
output wire [31 : 0] fdataOutCtrl_2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fdataOutCtrl_3, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {float {sigwidth {attribs {resolve_type immediate dependency {} format long minimum {} maxi\
mum {}} value 24}}}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fdataOutCtrl_3 DATA" *)
output wire [31 : 0] fdataOutCtrl_3;

  demo_test inst (
    .idataOutCtrl_0_ap_vld(idataOutCtrl_0_ap_vld),
    .idataOutCtrl_1_ap_vld(idataOutCtrl_1_ap_vld),
    .idataOutCtrl_2_ap_vld(idataOutCtrl_2_ap_vld),
    .idataOutCtrl_3_ap_vld(idataOutCtrl_3_ap_vld),
    .fdataOutCtrl_0_ap_vld(fdataOutCtrl_0_ap_vld),
    .fdataOutCtrl_1_ap_vld(fdataOutCtrl_1_ap_vld),
    .fdataOutCtrl_2_ap_vld(fdataOutCtrl_2_ap_vld),
    .fdataOutCtrl_3_ap_vld(fdataOutCtrl_3_ap_vld),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .idataInCtrl_0(idataInCtrl_0),
    .idataInCtrl_1(idataInCtrl_1),
    .idataInCtrl_2(idataInCtrl_2),
    .idataInCtrl_3(idataInCtrl_3),
    .fdataInCtrl_0(fdataInCtrl_0),
    .fdataInCtrl_1(fdataInCtrl_1),
    .fdataInCtrl_2(fdataInCtrl_2),
    .fdataInCtrl_3(fdataInCtrl_3),
    .idataOutCtrl_0(idataOutCtrl_0),
    .idataOutCtrl_1(idataOutCtrl_1),
    .idataOutCtrl_2(idataOutCtrl_2),
    .idataOutCtrl_3(idataOutCtrl_3),
    .fdataOutCtrl_0(fdataOutCtrl_0),
    .fdataOutCtrl_1(fdataOutCtrl_1),
    .fdataOutCtrl_2(fdataOutCtrl_2),
    .fdataOutCtrl_3(fdataOutCtrl_3)
  );
endmodule
