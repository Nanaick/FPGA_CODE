`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/11 17:34:17
// Design Name: 
// Module Name: TOP_SD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module TOP_SD(
	input		wire		clk_100m,
	input		wire		reset,

  	input		wire		GTXQ_P,
	input		wire		GTXQ_N,

	input		wire		RXP,
	input		wire		RXN,
	output		wire		TXP,
	output		wire		TXN,

	output		wire [1:0]	sfp_dis
    );

 reg [31:0] idataInCtrl[3:0];
 reg [31:0] fdataInCtrl[3:0];
 
 wire [31:0] idataOutCtrl[3:0];
 wire [31:0] fdataOutCtrl[3:0];


 reg [63:0] DATA_OUT[31:0];
 reg [63:0] DATA_IN [31:0];
 
 wire 	   sys_clk_100m;
 wire 	   drp_clk_100m;
 
 wire 	   sys_rst;
 
 wire 	   user_clk_out; // 5G 66bit 75M
 wire 	   sys_reset_out;
 
 wire 	   channel_up;
 wire	   lane_up;

 reg       ap_start;

 reg       Rx_flage;
 reg 	   tx_flag;

 reg   		   Rx_flage_reg;

 reg    [7:0]  STAT;

 reg 	[7:0]  sd_state;
 reg    [7:0]  rd_state;

 reg    [15:0]  Tx_Cnt;
 reg    [15:0]  Rx_Cnt;

 reg    [15:0]  send_len;
 reg    [15:0]  read_len;

 reg    [31:0] wait_cnt;
 
 reg    [15:0] chnnal;

 reg    [63:0] parity;   //校验
 reg    [63:0] Rx_data_temp;
 reg    [63:0] rx_parity;

 parameter  DELAY_SEC = 1000; // 延时 帧间隔

 parameter  IDEL    = 8'h01;   //空闲
 parameter  TX_READ = 8'h02;   //发送使能
 parameter  LO_DA   = 8'h04;   //装数据
 parameter  CNT_DA  = 8'h08;   //计数
 parameter  PAR_SD  = 8'h10;   //发校验
 parameter  WAIT_SD = 8'h20;   //wait
 
 assign  sys_clk_100m = clk_100m;
 assign  drp_clk_100m = clk_100m;
 
 assign  sys_rst = ~reset;
 
 reg	[63: 0]	s_axi_tx_tdata ;
 reg	[ 7: 0]	s_axi_tx_tkeep ;
 reg			s_axi_tx_tlast ;
 reg			s_axi_tx_tvalid;
 wire			s_axi_tx_tready;
 
 wire   [63: 0] m_axi_rx_tdata ;
 wire   [ 7: 0] m_axi_rx_tkeep ;
 wire    		m_axi_rx_tlast ;
 wire    		m_axi_rx_tvalid;

 wire	idataOutCtrl_0_ap_vld;
 wire	idataOutCtrl_1_ap_vld;
 wire	idataOutCtrl_2_ap_vld;
 wire	idataOutCtrl_3_ap_vld;
 
 wire	fdataOutCtrl_0_ap_vld;
 wire	fdataOutCtrl_1_ap_vld;
 wire	fdataOutCtrl_2_ap_vld;
 wire	fdataOutCtrl_3_ap_vld;

 reg	idataOutCtrl_3_ap_vld_r;
 reg    fdataOutCtrl_3_ap_vld_r;


/**********************************************************************/
//触发信号
always @(posedge user_clk_out or posedge sys_reset_out) begin
	if (sys_reset_out) begin
		idataOutCtrl_3_ap_vld_r	<= 1'b0;
	end else begin
		idataOutCtrl_3_ap_vld_r <= idataOutCtrl_3_ap_vld;
	end
end

always @(posedge user_clk_out or posedge sys_reset_out) begin
	if (sys_reset_out) begin
		fdataOutCtrl_3_ap_vld_r	<= 1'b0;
	end else begin
		fdataOutCtrl_3_ap_vld_r <= fdataOutCtrl_3_ap_vld;
	end
end

//发送端数据装配
always @(posedge user_clk_out) begin
	if ({idataOutCtrl_3_ap_vld_r,idataOutCtrl_3_ap_vld} == 2'b01) begin
		send_len  		<= 16'd11;
		DATA_OUT[0]     <= {32'haa55_000a,32'h0000_000b};
		DATA_OUT[1]     <= {idataOutCtrl[0],idataOutCtrl[1]};
		DATA_OUT[2]     <= {idataOutCtrl[2],idataOutCtrl[3]};

		DATA_OUT[3]     <= {idataOutCtrl[0],idataOutCtrl[1]};
		DATA_OUT[4]     <= {idataOutCtrl[2],idataOutCtrl[3]};
		DATA_OUT[5]     <= {idataOutCtrl[0],idataOutCtrl[1]};
		DATA_OUT[6]     <= {idataOutCtrl[2],idataOutCtrl[3]};

		DATA_OUT[7]     <= {idataOutCtrl[0],idataOutCtrl[1]};
		DATA_OUT[8]     <= {idataOutCtrl[2],idataOutCtrl[3]};
		DATA_OUT[9]     <= {idataOutCtrl[0],idataOutCtrl[1]};
		DATA_OUT[10]    <= {idataOutCtrl[2],idataOutCtrl[3]};
	end 
    if({fdataOutCtrl_3_ap_vld_r,fdataOutCtrl_3_ap_vld} == 2'b01) begin
		send_len  		<= 16'd11;
		DATA_OUT[0]     <= {32'haa55_000b,32'h0000_000b};
		DATA_OUT[1]     <= {fdataOutCtrl[0],fdataOutCtrl[1]};
		DATA_OUT[2]     <= {fdataOutCtrl[2],fdataOutCtrl[3]};

		DATA_OUT[3]     <= {fdataOutCtrl[0],fdataOutCtrl[1]};
		DATA_OUT[4]     <= {fdataOutCtrl[2],fdataOutCtrl[3]};
		DATA_OUT[5]     <= {fdataOutCtrl[0],fdataOutCtrl[1]};
		DATA_OUT[6]     <= {fdataOutCtrl[2],fdataOutCtrl[3]};

		DATA_OUT[7]     <= {fdataOutCtrl[0],fdataOutCtrl[1]};
		DATA_OUT[8]     <= {fdataOutCtrl[2],fdataOutCtrl[3]};
		DATA_OUT[9]     <= {fdataOutCtrl[0],fdataOutCtrl[1]};
		DATA_OUT[10]    <= {fdataOutCtrl[2],fdataOutCtrl[3]};
    end
end

//数据发送
always @(posedge user_clk_out or posedge sys_reset_out) begin
	if(sys_reset_out) begin
		s_axi_tx_tdata	<= 64'd0;
		s_axi_tx_tkeep  <= 8'h0;
		s_axi_tx_tlast  <= 1'b0;
		s_axi_tx_tvalid <= 1'b0;
		sd_state        <= IDEL;
		Tx_Cnt          <= 16'd0;
		wait_cnt		<= 32'd0;
	end else begin
		case(sd_state)
			IDEL : begin
					wait_cnt			<= 32'd0;
					Tx_Cnt          	<= 16'd0;
					s_axi_tx_tkeep  	<= 8'd0;
					s_axi_tx_tlast  	<= 1'b0;
					if(tx_flag == 1'b1) begin
						sd_state   		<= LO_DA;
						s_axi_tx_tvalid <= 1'b1;
					end else begin
						sd_state   		<= IDEL;
						s_axi_tx_tvalid <= 1'b0;
					end
			end
			TX_READ: begin
				s_axi_tx_tkeep  	<= send_len;
				s_axi_tx_tlast  	<= 1'b0;
				if (s_axi_tx_tready) begin
					sd_state   		<= LO_DA;
				end else begin
					sd_state   		<= TX_READ;
				end
			end
			LO_DA :  begin
					s_axi_tx_tdata 	<= DATA_OUT[Tx_Cnt];
					Tx_Cnt 			<= Tx_Cnt + 1'b1;
					sd_state	    <= CNT_DA;
					if(Tx_Cnt == 16'd0) begin
						parity		<= DATA_OUT[Tx_Cnt];
					end else begin
						parity      <= parity ^ DATA_OUT[Tx_Cnt];
					end
			end
			CNT_DA : begin
					if(Tx_Cnt == send_len) begin
						sd_state	    <= PAR_SD;
					end else begin
						sd_state	    <= TX_READ;
					end
			end
			PAR_SD : begin
					s_axi_tx_tdata 	<= parity;
					s_axi_tx_tlast  <= 1'b1;
			end
			WAIT_SD: begin
				s_axi_tx_tlast  <= 1'b0;
				if(wait_cnt > DELAY_SEC) begin
					sd_state	    <= IDEL;
				end else begin
					sd_state	    <= WAIT_SD;
					wait_cnt        <= wait_cnt  + 1'b1;
				end
			end
			default: begin
					sd_state   		<= IDEL;
			end
		endcase
	end
end


/*************************************************************/
//数据接收端

always @(posedge user_clk_out or posedge sys_reset_out) begin
	if (sys_reset_out) begin
		Rx_data_temp  <= 64'd0;
		Rx_flage_reg  <= 1'b0;
	end else begin
		Rx_data_temp  <= m_axi_rx_tdata; 
		Rx_flage_reg  <= Rx_flage;    
	end
end

always @(posedge user_clk_out or posedge sys_reset_out) begin
	if (sys_reset_out) begin
		// reset
		rd_state  	<= 8'h01;
		Rx_Cnt		<= 16'd0;
		rx_parity	<= 64'd0;
		read_len	<= 16'd0;
		chnnal		<= 16'd0;
		Rx_flage	<= 1'b0;
	end else begin
		case(rd_state) 
			8'h01 : begin
				if(m_axi_rx_tvalid && (Rx_data_temp[63:48] == 16'haa55)) begin
					rx_parity			<= Rx_data_temp;
					chnnal				<= Rx_data_temp[47:32];
					read_len			<= Rx_data_temp[15: 0];
					rd_state 			<= 8'h02;
				end else begin
					rx_parity 			<= 64'd0;
					rd_state 			<= 8'h01;
				end
				Rx_Cnt					<= 16'd0;
				Rx_flage 				<= 1'b1;
			end
			8'h02 : begin
				if(m_axi_rx_tvalid) begin
					DATA_IN[Rx_Cnt]		<= Rx_data_temp;
					Rx_Cnt				<= Rx_Cnt + 1'b1;
					rx_parity 			<= rx_parity ^ Rx_data_temp;
					rd_state 			<= 8'h03;
				end else begin
					rd_state 			<= 8'h02;
				end
			end
			8'h03 : begin
				if(Rx_Cnt == read_len || (Rx_Cnt > 16'd200)) begin
					rd_state 			<= 8'h04;
				end else begin
					rd_state 			<= 8'h02;
				end
			end
			8'h4 : begin
				if(m_axi_rx_tlast && (Rx_data_temp == rx_parity)) begin
					rd_state 			<= 8'h05;
					Rx_flage 			<= 1'b1;
				end else begin
					rd_state 			<= 8'h05;
				end
			end
			8'h5 : begin
				rd_state 			<= 8'h01;
			end
			default : rd_state 			<= 8'h01;
		endcase
	end
end

 always @(posedge user_clk_out or posedge sys_reset_out) begin
	if (sys_reset_out) begin
		STAT 		<= 8'd1;
		ap_start	<= 1'b0;
	end else begin
		case(STAT)
			8'd1 : begin
			 	ap_start	<= 1'b0;
				if({Rx_flage_reg,Rx_flage} == 2'b01) begin
					STAT 		<= 8'd2;
				end else begin
					STAT 		<= 8'd1;
				end
			end
			8'd2 : begin
				STAT 		<= 8'd3;
				if(chnnal == 16'h000a) begin
					{idataInCtrl[0],idataInCtrl[1]} <= DATA_IN[0];
					{idataInCtrl[2],idataInCtrl[3]} <= DATA_IN[1];
				end else if(chnnal == 16'h000b)begin
					{fdataInCtrl[0],fdataInCtrl[1]} <= DATA_IN[0];
					{fdataInCtrl[2],fdataInCtrl[3]} <= DATA_IN[1];
				end else begin
					;
				end
			end
			8'd3 : begin
				STAT 		<= 8'd1;
				ap_start	<= 1'b1;
			end
			default : begin
				STAT 		<= 8'd1;
			end
		endcase
	end
end
/***************************************************************************/

aurora_64b66b_0 aurora_64b66b_sd (
  .rxp(RXP),                                          // input wire [0 : 0] rxp
  .rxn(RXN),                                          // input wire [0 : 0] rxn
  .reset_pb(sys_rst),                                // input wire reset_pb
  .power_down(1'b0),                            // input wire power_down
  .pma_init(1'b0),                                // input wire pma_init
  .loopback(3'd0 ),                                // input wire [2 : 0] loopback
  .txp(TXP),                                          // output wire [0 : 0] txp
  .txn(TXN),                                          // output wire [0 : 0] txn
 
  .hard_err( ),                                // output wire hard_err
  .soft_err( ),                                // output wire soft_err
  .channel_up(channel_up),                            // output wire channel_up
  .lane_up(lane_up),                                  // output wire [0 : 0] lane_up
  
  .tx_out_clk(  ),                            // output wire tx_out_clk
  .drp_clk_in(drp_clk_100m),                            // input wire drp_clk_in
  .gt_pll_lock(  ),                          // output wire gt_pll_lock
  
  .s_axi_tx_tdata (s_axi_tx_tdata ),                    // input wire [63 : 0] s_axi_tx_tdata
  .s_axi_tx_tkeep (s_axi_tx_tkeep ),                    // input wire [7 : 0] s_axi_tx_tkeep
  .s_axi_tx_tlast (s_axi_tx_tlast ),                    // input wire s_axi_tx_tlast
  .s_axi_tx_tvalid(s_axi_tx_tvalid),                  // input wire s_axi_tx_tvalid
  .s_axi_tx_tready(s_axi_tx_tready),                  // output wire s_axi_tx_tready

  .m_axi_rx_tdata (m_axi_rx_tdata),                    // output wire [63 : 0] m_axi_rx_tdata
  .m_axi_rx_tkeep (m_axi_rx_tkeep),                    // output wire [7 : 0] m_axi_rx_tkeep
  .m_axi_rx_tlast (m_axi_rx_tlast),                    // output wire m_axi_rx_tlast
  .m_axi_rx_tvalid(m_axi_rx_tvalid),                  // output wire m_axi_rx_tvalid
  
//  .mmcm_not_locked_out(mmcm_not_locked_out),          // output wire mmcm_not_locked_out

  .drpaddr_in(9'd0),                            // input wire [8 : 0] drpaddr_in
  .drpdi_in(16'd0),                                // input wire [15 : 0] drpdi_in
  .drprdy_out( ),                            // output wire drprdy_out
  .drpen_in(1'b0),                                // input wire drpen_in
  .drpwe_in(1'b0),                                // input wire drpwe_in
  .drpdo_out( ),                              // output wire [15 : 0] drpdo_out
  
  .init_clk(sys_clk_100m),                                // input wire init_clk
  .link_reset_out( ),                    // output wire link_reset_out
  
  .gt_refclk1_p(GTXQ_P),                        // input wire gt_refclk1_p
  .gt_refclk1_n(GTXQ_N),                        // input wire gt_refclk1_n
  
  .user_clk_out(user_clk_out),                        // output wire user_clk_out
  .sync_clk_out(   ),                        // output wire sync_clk_out
  
  .gt_rxcdrovrden_in(1'b0),              			  // input wire gt_rxcdrovrden_in
  .sys_reset_out (sys_reset_out),                     // output wire sys_reset_out 低系统有效
  .gt_reset_out  (  ),                      // output wire gt_reset_out
  .gt_refclk1_out(   )                     // output wire gt_refclk1_out
);


demo_test_0 demo_test_hls (
  .idataOutCtrl_0_ap_vld(idataOutCtrl_0_ap_vld),  // output wire idataOutCtrl_0_ap_vld
  .idataOutCtrl_1_ap_vld(idataOutCtrl_1_ap_vld),  // output wire idataOutCtrl_1_ap_vld
  .idataOutCtrl_2_ap_vld(idataOutCtrl_2_ap_vld),  // output wire idataOutCtrl_2_ap_vld
  .idataOutCtrl_3_ap_vld(idataOutCtrl_3_ap_vld),  // output wire idataOutCtrl_3_ap_vld

  .fdataOutCtrl_0_ap_vld(fdataOutCtrl_0_ap_vld),  // output wire fdataOutCtrl_0_ap_vld
  .fdataOutCtrl_1_ap_vld(fdataOutCtrl_1_ap_vld),  // output wire fdataOutCtrl_1_ap_vld
  .fdataOutCtrl_2_ap_vld(fdataOutCtrl_2_ap_vld),  // output wire fdataOutCtrl_2_ap_vld
  .fdataOutCtrl_3_ap_vld(fdataOutCtrl_3_ap_vld),  // output wire fdataOutCtrl_3_ap_vld

  .ap_clk(user_clk_out),                                // input wire ap_clk
  .ap_rst(sys_reset_out),                                // input wire ap_rst
  .ap_start(ap_start),                            // input wire ap_start
  .ap_done ( ),                              // output wire ap_done
  .ap_idle ( ),                              // output wire ap_idle
  .ap_ready( ),                            // output wire ap_ready

  .idataInCtrl_0(idataInCtrl[0]),                  // input wire [31 : 0] idataInCtrl_0
  .idataInCtrl_1(idataInCtrl[1]),                  // input wire [31 : 0] idataInCtrl_1
  .idataInCtrl_2(idataInCtrl[2]),                  // input wire [31 : 0] idataInCtrl_2
  .idataInCtrl_3(idataInCtrl[3]),                  // input wire [31 : 0] idataInCtrl_3

  .fdataInCtrl_0(fdataInCtrl[0]),                  // input wire [31 : 0] fdataInCtrl_0
  .fdataInCtrl_1(fdataInCtrl[1]),                  // input wire [31 : 0] fdataInCtrl_1
  .fdataInCtrl_2(fdataInCtrl[2]),                  // input wire [31 : 0] fdataInCtrl_2
  .fdataInCtrl_3(fdataInCtrl[3]),                  // input wire [31 : 0] fdataInCtrl_3

  .idataOutCtrl_0(idataOutCtrl[0]),                // output wire [31 : 0] idataOutCtrl_0
  .idataOutCtrl_1(idataOutCtrl[1]),                // output wire [31 : 0] idataOutCtrl_1
  .idataOutCtrl_2(idataOutCtrl[2]),                // output wire [31 : 0] idataOutCtrl_2
  .idataOutCtrl_3(idataOutCtrl[3]),                // output wire [31 : 0] idataOutCtrl_3

  .fdataOutCtrl_0(fdataOutCtrl[0]),                // output wire [31 : 0] fdataOutCtrl_0
  .fdataOutCtrl_1(fdataOutCtrl[1]),                // output wire [31 : 0] fdataOutCtrl_1
  .fdataOutCtrl_2(fdataOutCtrl[2]),                // output wire [31 : 0] fdataOutCtrl_2
  .fdataOutCtrl_3(fdataOutCtrl[3])                 // output wire [31 : 0] fdataOutCtrl_3
);



endmodule
