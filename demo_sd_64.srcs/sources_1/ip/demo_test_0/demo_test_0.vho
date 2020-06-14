-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:demo_test:1.0
-- IP Revision: 2006111745

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT demo_test_0
  PORT (
    idataOutCtrl_0_ap_vld : OUT STD_LOGIC;
    idataOutCtrl_1_ap_vld : OUT STD_LOGIC;
    idataOutCtrl_2_ap_vld : OUT STD_LOGIC;
    idataOutCtrl_3_ap_vld : OUT STD_LOGIC;
    fdataOutCtrl_0_ap_vld : OUT STD_LOGIC;
    fdataOutCtrl_1_ap_vld : OUT STD_LOGIC;
    fdataOutCtrl_2_ap_vld : OUT STD_LOGIC;
    fdataOutCtrl_3_ap_vld : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    idataInCtrl_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    idataInCtrl_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    idataInCtrl_2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    idataInCtrl_3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    fdataInCtrl_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    fdataInCtrl_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    fdataInCtrl_2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    fdataInCtrl_3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    idataOutCtrl_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    idataOutCtrl_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    idataOutCtrl_2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    idataOutCtrl_3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    fdataOutCtrl_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    fdataOutCtrl_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    fdataOutCtrl_2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    fdataOutCtrl_3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : demo_test_0
  PORT MAP (
    idataOutCtrl_0_ap_vld => idataOutCtrl_0_ap_vld,
    idataOutCtrl_1_ap_vld => idataOutCtrl_1_ap_vld,
    idataOutCtrl_2_ap_vld => idataOutCtrl_2_ap_vld,
    idataOutCtrl_3_ap_vld => idataOutCtrl_3_ap_vld,
    fdataOutCtrl_0_ap_vld => fdataOutCtrl_0_ap_vld,
    fdataOutCtrl_1_ap_vld => fdataOutCtrl_1_ap_vld,
    fdataOutCtrl_2_ap_vld => fdataOutCtrl_2_ap_vld,
    fdataOutCtrl_3_ap_vld => fdataOutCtrl_3_ap_vld,
    ap_clk => ap_clk,
    ap_rst => ap_rst,
    ap_start => ap_start,
    ap_done => ap_done,
    ap_idle => ap_idle,
    ap_ready => ap_ready,
    idataInCtrl_0 => idataInCtrl_0,
    idataInCtrl_1 => idataInCtrl_1,
    idataInCtrl_2 => idataInCtrl_2,
    idataInCtrl_3 => idataInCtrl_3,
    fdataInCtrl_0 => fdataInCtrl_0,
    fdataInCtrl_1 => fdataInCtrl_1,
    fdataInCtrl_2 => fdataInCtrl_2,
    fdataInCtrl_3 => fdataInCtrl_3,
    idataOutCtrl_0 => idataOutCtrl_0,
    idataOutCtrl_1 => idataOutCtrl_1,
    idataOutCtrl_2 => idataOutCtrl_2,
    idataOutCtrl_3 => idataOutCtrl_3,
    fdataOutCtrl_0 => fdataOutCtrl_0,
    fdataOutCtrl_1 => fdataOutCtrl_1,
    fdataOutCtrl_2 => fdataOutCtrl_2,
    fdataOutCtrl_3 => fdataOutCtrl_3
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file demo_test_0.vhd when simulating
-- the core, demo_test_0. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.

