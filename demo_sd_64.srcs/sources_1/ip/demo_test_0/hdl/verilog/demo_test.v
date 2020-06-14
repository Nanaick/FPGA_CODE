// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="demo_test,hls_ip_2018_3,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z030ffg676-2,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.588000,HLS_SYN_LAT=21,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=2,HLS_SYN_FF=273,HLS_SYN_LUT=483,HLS_VERSION=2018_3}" *)

module demo_test (
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
        idataOutCtrl_0_ap_vld,
        idataOutCtrl_1,
        idataOutCtrl_1_ap_vld,
        idataOutCtrl_2,
        idataOutCtrl_2_ap_vld,
        idataOutCtrl_3,
        idataOutCtrl_3_ap_vld,
        fdataOutCtrl_0,
        fdataOutCtrl_0_ap_vld,
        fdataOutCtrl_1,
        fdataOutCtrl_1_ap_vld,
        fdataOutCtrl_2,
        fdataOutCtrl_2_ap_vld,
        fdataOutCtrl_3,
        fdataOutCtrl_3_ap_vld
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] idataInCtrl_0;
input  [31:0] idataInCtrl_1;
input  [31:0] idataInCtrl_2;
input  [31:0] idataInCtrl_3;
input  [31:0] fdataInCtrl_0;
input  [31:0] fdataInCtrl_1;
input  [31:0] fdataInCtrl_2;
input  [31:0] fdataInCtrl_3;
output  [31:0] idataOutCtrl_0;
output   idataOutCtrl_0_ap_vld;
output  [31:0] idataOutCtrl_1;
output   idataOutCtrl_1_ap_vld;
output  [31:0] idataOutCtrl_2;
output   idataOutCtrl_2_ap_vld;
output  [31:0] idataOutCtrl_3;
output   idataOutCtrl_3_ap_vld;
output  [31:0] fdataOutCtrl_0;
output   fdataOutCtrl_0_ap_vld;
output  [31:0] fdataOutCtrl_1;
output   fdataOutCtrl_1_ap_vld;
output  [31:0] fdataOutCtrl_2;
output   fdataOutCtrl_2_ap_vld;
output  [31:0] fdataOutCtrl_3;
output   fdataOutCtrl_3_ap_vld;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg idataOutCtrl_0_ap_vld;
reg idataOutCtrl_1_ap_vld;
reg idataOutCtrl_2_ap_vld;
reg idataOutCtrl_3_ap_vld;
reg fdataOutCtrl_0_ap_vld;
reg fdataOutCtrl_1_ap_vld;
reg fdataOutCtrl_2_ap_vld;
reg fdataOutCtrl_3_ap_vld;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [2:0] i_1_fu_204_p2;
reg   [2:0] i_1_reg_254;
wire    ap_CS_fsm_state2;
wire   [1:0] tmp_4_fu_210_p1;
reg   [1:0] tmp_4_reg_259;
wire   [0:0] exitcond_fu_198_p2;
wire   [31:0] tmp_3_fu_214_p6;
reg   [31:0] tmp_3_reg_264;
reg   [2:0] i_reg_178;
wire    ap_CS_fsm_state6;
wire   [31:0] tmp_1_fu_241_p2;
wire   [31:0] grp_fu_189_p2;
wire    ap_CS_fsm_state3;
wire   [1:0] tmp_3_fu_214_p5;
wire   [31:0] tmp_fu_228_p6;
reg   [5:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
end

demo_test_fadd_32bkb #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
demo_test_fadd_32bkb_U1(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_3_reg_264),
    .din1(32'd1075838976),
    .ce(1'b1),
    .dout(grp_fu_189_p2)
);

demo_test_mux_42_cud #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .din2_WIDTH( 32 ),
    .din3_WIDTH( 32 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
demo_test_mux_42_cud_U2(
    .din0(fdataInCtrl_0),
    .din1(fdataInCtrl_1),
    .din2(fdataInCtrl_2),
    .din3(fdataInCtrl_3),
    .din4(tmp_3_fu_214_p5),
    .dout(tmp_3_fu_214_p6)
);

demo_test_mux_42_cud #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .din2_WIDTH( 32 ),
    .din3_WIDTH( 32 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 32 ))
demo_test_mux_42_cud_U3(
    .din0(idataInCtrl_0),
    .din1(idataInCtrl_1),
    .din2(idataInCtrl_2),
    .din3(idataInCtrl_3),
    .din4(tmp_4_reg_259),
    .dout(tmp_fu_228_p6)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        i_reg_178 <= i_1_reg_254;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_178 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_1_reg_254 <= i_1_fu_204_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_fu_198_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_3_reg_264 <= tmp_3_fu_214_p6;
        tmp_4_reg_259 <= tmp_4_fu_210_p1;
    end
end

always @ (*) begin
    if (((exitcond_fu_198_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_fu_198_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_reg_259 == 2'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        fdataOutCtrl_0_ap_vld = 1'b1;
    end else begin
        fdataOutCtrl_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_reg_259 == 2'd1) & (1'b1 == ap_CS_fsm_state6))) begin
        fdataOutCtrl_1_ap_vld = 1'b1;
    end else begin
        fdataOutCtrl_1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_reg_259 == 2'd2) & (1'b1 == ap_CS_fsm_state6))) begin
        fdataOutCtrl_2_ap_vld = 1'b1;
    end else begin
        fdataOutCtrl_2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_reg_259 == 2'd3) & (1'b1 == ap_CS_fsm_state6))) begin
        fdataOutCtrl_3_ap_vld = 1'b1;
    end else begin
        fdataOutCtrl_3_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_reg_259 == 2'd0) & (1'b1 == ap_CS_fsm_state6))) begin
        idataOutCtrl_0_ap_vld = 1'b1;
    end else begin
        idataOutCtrl_0_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_reg_259 == 2'd1) & (1'b1 == ap_CS_fsm_state6))) begin
        idataOutCtrl_1_ap_vld = 1'b1;
    end else begin
        idataOutCtrl_1_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_reg_259 == 2'd2) & (1'b1 == ap_CS_fsm_state6))) begin
        idataOutCtrl_2_ap_vld = 1'b1;
    end else begin
        idataOutCtrl_2_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_4_reg_259 == 2'd3) & (1'b1 == ap_CS_fsm_state6))) begin
        idataOutCtrl_3_ap_vld = 1'b1;
    end else begin
        idataOutCtrl_3_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((exitcond_fu_198_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign exitcond_fu_198_p2 = ((i_reg_178 == 3'd4) ? 1'b1 : 1'b0);

assign fdataOutCtrl_0 = grp_fu_189_p2;

assign fdataOutCtrl_1 = grp_fu_189_p2;

assign fdataOutCtrl_2 = grp_fu_189_p2;

assign fdataOutCtrl_3 = grp_fu_189_p2;

assign i_1_fu_204_p2 = (i_reg_178 + 3'd1);

assign idataOutCtrl_0 = tmp_1_fu_241_p2;

assign idataOutCtrl_1 = tmp_1_fu_241_p2;

assign idataOutCtrl_2 = tmp_1_fu_241_p2;

assign idataOutCtrl_3 = tmp_1_fu_241_p2;

assign tmp_1_fu_241_p2 = (32'd2 + tmp_fu_228_p6);

assign tmp_3_fu_214_p5 = i_reg_178[1:0];

assign tmp_4_fu_210_p1 = i_reg_178[1:0];

endmodule //demo_test
