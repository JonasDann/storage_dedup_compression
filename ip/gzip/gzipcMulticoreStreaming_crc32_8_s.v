// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_crc32_8_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        checksumInitStream98_dout,
        checksumInitStream98_num_data_valid,
        checksumInitStream98_fifo_cap,
        checksumInitStream98_empty_n,
        checksumInitStream98_read,
        checksumStream94_dout,
        checksumStream94_num_data_valid,
        checksumStream94_fifo_cap,
        checksumStream94_empty_n,
        checksumStream94_read,
        checksumSizeStream96_dout,
        checksumSizeStream96_num_data_valid,
        checksumSizeStream96_fifo_cap,
        checksumSizeStream96_empty_n,
        checksumSizeStream96_read,
        endInPackLenStrm6_dout,
        endInPackLenStrm6_empty_n,
        endInPackLenStrm6_read,
        checksumOutStream99_din,
        checksumOutStream99_num_data_valid,
        checksumOutStream99_fifo_cap,
        checksumOutStream99_full_n,
        checksumOutStream99_write,
        endOutStrm7_din,
        endOutStrm7_full_n,
        endOutStrm7_write
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_state2 = 8'd2;
parameter    ap_ST_fsm_state3 = 8'd4;
parameter    ap_ST_fsm_state4 = 8'd8;
parameter    ap_ST_fsm_state5 = 8'd16;
parameter    ap_ST_fsm_state6 = 8'd32;
parameter    ap_ST_fsm_state7 = 8'd64;
parameter    ap_ST_fsm_state8 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] checksumInitStream98_dout;
input  [2:0] checksumInitStream98_num_data_valid;
input  [2:0] checksumInitStream98_fifo_cap;
input   checksumInitStream98_empty_n;
output   checksumInitStream98_read;
input  [63:0] checksumStream94_dout;
input  [2:0] checksumStream94_num_data_valid;
input  [2:0] checksumStream94_fifo_cap;
input   checksumStream94_empty_n;
output   checksumStream94_read;
input  [4:0] checksumSizeStream96_dout;
input  [2:0] checksumSizeStream96_num_data_valid;
input  [2:0] checksumSizeStream96_fifo_cap;
input   checksumSizeStream96_empty_n;
output   checksumSizeStream96_read;
input  [0:0] endInPackLenStrm6_dout;
input   endInPackLenStrm6_empty_n;
output   endInPackLenStrm6_read;
output  [31:0] checksumOutStream99_din;
input  [5:0] checksumOutStream99_num_data_valid;
input  [5:0] checksumOutStream99_fifo_cap;
input   checksumOutStream99_full_n;
output   checksumOutStream99_write;
output  [0:0] endOutStrm7_din;
input   endOutStrm7_full_n;
output   endOutStrm7_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg checksumInitStream98_read;
reg checksumStream94_read;
reg checksumSizeStream96_read;
reg endInPackLenStrm6_read;
reg checksumOutStream99_write;
reg[0:0] endOutStrm7_din;
reg endOutStrm7_write;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [10:0] p_ZN2xf8security8internalL7table16E_0_address0;
reg    p_ZN2xf8security8internalL7table16E_0_ce0;
wire   [31:0] p_ZN2xf8security8internalL7table16E_0_q0;
reg    p_ZN2xf8security8internalL7table16E_0_ce1;
wire   [31:0] p_ZN2xf8security8internalL7table16E_0_q1;
reg    p_ZN2xf8security8internalL7table16E_0_ce2;
wire   [31:0] p_ZN2xf8security8internalL7table16E_0_q2;
reg    p_ZN2xf8security8internalL7table16E_0_ce3;
wire   [31:0] p_ZN2xf8security8internalL7table16E_0_q3;
reg    p_ZN2xf8security8internalL7table16E_0_ce4;
wire   [31:0] p_ZN2xf8security8internalL7table16E_0_q4;
reg    p_ZN2xf8security8internalL7table16E_0_ce5;
wire   [31:0] p_ZN2xf8security8internalL7table16E_0_q5;
reg    p_ZN2xf8security8internalL7table16E_0_ce6;
wire   [31:0] p_ZN2xf8security8internalL7table16E_0_q6;
reg    p_ZN2xf8security8internalL7table16E_0_ce7;
wire   [31:0] p_ZN2xf8security8internalL7table16E_0_q7;
reg    checksumInitStream98_blk_n;
wire    ap_CS_fsm_state2;
reg    checksumSizeStream96_blk_n;
wire    ap_CS_fsm_state8;
reg   [0:0] icmp_ln1069_reg_224;
reg    endInPackLenStrm6_blk_n;
reg    checksumOutStream99_blk_n;
reg    endOutStrm7_blk_n;
reg   [4:0] inPackLen_V_reg_205;
reg   [31:0] crc_V_2_reg_210;
wire   [0:0] icmp_ln1069_fu_159_p2;
wire    ap_CS_fsm_state6;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_start;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_done;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_idle;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_ready;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_checksumSizeStream96_read;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_checksumStream94_read;
wire   [63:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_in_data_V_out;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_in_data_V_out_ap_vld;
wire   [31:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_crc_V_4_out;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_crc_V_4_out_ap_vld;
wire   [4:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_tmp_V_19_out;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_tmp_V_19_out_ap_vld;
wire   [10:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address0;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce0;
wire   [10:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address1;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce1;
wire   [10:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address2;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce2;
wire   [10:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address3;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce3;
wire   [10:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address4;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce4;
wire   [10:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address5;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce5;
wire   [10:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address6;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce6;
wire   [10:0] grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address7;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce7;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_start;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_done;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_idle;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_ready;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_checksumStream94_read;
wire   [31:0] grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_tmp_V_20_out;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_tmp_V_20_out_ap_vld;
wire   [10:0] grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_p_ZN2xf8security8internalL7table16E_0_address0;
wire    grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_p_ZN2xf8security8internalL7table16E_0_ce0;
reg   [0:0] e_1_reg_102;
reg    ap_block_state1;
reg    ap_block_state8;
reg   [31:0] ap_phi_mux_tmp_V_phi_fu_114_p4;
reg   [31:0] tmp_V_reg_111;
reg    grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_start_reg;
wire    ap_CS_fsm_state7;
reg    ap_block_state2;
reg   [7:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
reg    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_start_reg = 1'b0;
#0 grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_start_reg = 1'b0;
end

gzipcMulticoreStreaming_crc32_8_s_p_ZN2xf8security8internalL7table16E_0_ROM_AUTO_1R #(
    .DataWidth( 32 ),
    .AddressRange( 2048 ),
    .AddressWidth( 11 ))
p_ZN2xf8security8internalL7table16E_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(p_ZN2xf8security8internalL7table16E_0_address0),
    .ce0(p_ZN2xf8security8internalL7table16E_0_ce0),
    .q0(p_ZN2xf8security8internalL7table16E_0_q0),
    .address1(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address1),
    .ce1(p_ZN2xf8security8internalL7table16E_0_ce1),
    .q1(p_ZN2xf8security8internalL7table16E_0_q1),
    .address2(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address2),
    .ce2(p_ZN2xf8security8internalL7table16E_0_ce2),
    .q2(p_ZN2xf8security8internalL7table16E_0_q2),
    .address3(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address3),
    .ce3(p_ZN2xf8security8internalL7table16E_0_ce3),
    .q3(p_ZN2xf8security8internalL7table16E_0_q3),
    .address4(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address4),
    .ce4(p_ZN2xf8security8internalL7table16E_0_ce4),
    .q4(p_ZN2xf8security8internalL7table16E_0_q4),
    .address5(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address5),
    .ce5(p_ZN2xf8security8internalL7table16E_0_ce5),
    .q5(p_ZN2xf8security8internalL7table16E_0_q5),
    .address6(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address6),
    .ce6(p_ZN2xf8security8internalL7table16E_0_ce6),
    .q6(p_ZN2xf8security8internalL7table16E_0_q6),
    .address7(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address7),
    .ce7(p_ZN2xf8security8internalL7table16E_0_ce7),
    .q7(p_ZN2xf8security8internalL7table16E_0_q7)
);

gzipcMulticoreStreaming_crc32_8_Pipeline_VITIS_LOOP_2412_4 grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_start),
    .ap_done(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_done),
    .ap_idle(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_idle),
    .ap_ready(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_ready),
    .checksumSizeStream96_dout(checksumSizeStream96_dout),
    .checksumSizeStream96_num_data_valid(3'd0),
    .checksumSizeStream96_fifo_cap(3'd0),
    .checksumSizeStream96_empty_n(checksumSizeStream96_empty_n),
    .checksumSizeStream96_read(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_checksumSizeStream96_read),
    .checksumStream94_dout(checksumStream94_dout),
    .checksumStream94_num_data_valid(3'd0),
    .checksumStream94_fifo_cap(3'd0),
    .checksumStream94_empty_n(checksumStream94_empty_n),
    .checksumStream94_read(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_checksumStream94_read),
    .crc_V_3(crc_V_2_reg_210),
    .inPackLen_V_2(inPackLen_V_reg_205),
    .in_data_V_out(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_in_data_V_out),
    .in_data_V_out_ap_vld(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_in_data_V_out_ap_vld),
    .crc_V_4_out(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_crc_V_4_out),
    .crc_V_4_out_ap_vld(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_crc_V_4_out_ap_vld),
    .tmp_V_19_out(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_tmp_V_19_out),
    .tmp_V_19_out_ap_vld(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_tmp_V_19_out_ap_vld),
    .p_ZN2xf8security8internalL7table16E_0_address0(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address0),
    .p_ZN2xf8security8internalL7table16E_0_ce0(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce0),
    .p_ZN2xf8security8internalL7table16E_0_q0(p_ZN2xf8security8internalL7table16E_0_q0),
    .p_ZN2xf8security8internalL7table16E_0_address1(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address1),
    .p_ZN2xf8security8internalL7table16E_0_ce1(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce1),
    .p_ZN2xf8security8internalL7table16E_0_q1(p_ZN2xf8security8internalL7table16E_0_q1),
    .p_ZN2xf8security8internalL7table16E_0_address2(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address2),
    .p_ZN2xf8security8internalL7table16E_0_ce2(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce2),
    .p_ZN2xf8security8internalL7table16E_0_q2(p_ZN2xf8security8internalL7table16E_0_q2),
    .p_ZN2xf8security8internalL7table16E_0_address3(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address3),
    .p_ZN2xf8security8internalL7table16E_0_ce3(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce3),
    .p_ZN2xf8security8internalL7table16E_0_q3(p_ZN2xf8security8internalL7table16E_0_q3),
    .p_ZN2xf8security8internalL7table16E_0_address4(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address4),
    .p_ZN2xf8security8internalL7table16E_0_ce4(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce4),
    .p_ZN2xf8security8internalL7table16E_0_q4(p_ZN2xf8security8internalL7table16E_0_q4),
    .p_ZN2xf8security8internalL7table16E_0_address5(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address5),
    .p_ZN2xf8security8internalL7table16E_0_ce5(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce5),
    .p_ZN2xf8security8internalL7table16E_0_q5(p_ZN2xf8security8internalL7table16E_0_q5),
    .p_ZN2xf8security8internalL7table16E_0_address6(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address6),
    .p_ZN2xf8security8internalL7table16E_0_ce6(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce6),
    .p_ZN2xf8security8internalL7table16E_0_q6(p_ZN2xf8security8internalL7table16E_0_q6),
    .p_ZN2xf8security8internalL7table16E_0_address7(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address7),
    .p_ZN2xf8security8internalL7table16E_0_ce7(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce7),
    .p_ZN2xf8security8internalL7table16E_0_q7(p_ZN2xf8security8internalL7table16E_0_q7)
);

gzipcMulticoreStreaming_crc32_8_Pipeline_VITIS_LOOP_2443_7 grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_start),
    .ap_done(grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_done),
    .ap_idle(grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_idle),
    .ap_ready(grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_ready),
    .checksumStream94_dout(checksumStream94_dout),
    .checksumStream94_num_data_valid(3'd0),
    .checksumStream94_fifo_cap(3'd0),
    .checksumStream94_empty_n(checksumStream94_empty_n),
    .checksumStream94_read(grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_checksumStream94_read),
    .crc_V_4_reload(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_crc_V_4_out),
    .in_data_V_reload(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_in_data_V_out),
    .tmp_V_19_reload(grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_tmp_V_19_out),
    .tmp_V_20_out(grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_tmp_V_20_out),
    .tmp_V_20_out_ap_vld(grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_tmp_V_20_out_ap_vld),
    .p_ZN2xf8security8internalL7table16E_0_address0(grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_p_ZN2xf8security8internalL7table16E_0_address0),
    .p_ZN2xf8security8internalL7table16E_0_ce0(grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_p_ZN2xf8security8internalL7table16E_0_ce0),
    .p_ZN2xf8security8internalL7table16E_0_q0(p_ZN2xf8security8internalL7table16E_0_q0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_start_reg <= 1'b1;
        end else if ((grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_ready == 1'b1)) begin
            grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln1069_fu_159_p2 == 1'd0))) begin
            grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_start_reg <= 1'b1;
        end else if ((grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_ready == 1'b1)) begin
            grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln1069_fu_159_p2 == 1'd1))) begin
        tmp_V_reg_111 <= grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_crc_V_4_out;
    end else if ((~((endOutStrm7_full_n == 1'b0) | (checksumOutStream99_full_n == 1'b0) | (endInPackLenStrm6_empty_n == 1'b0) | ((checksumSizeStream96_empty_n == 1'b0) & (icmp_ln1069_reg_224 == 1'd0))) & (1'b1 == ap_CS_fsm_state8) & (icmp_ln1069_reg_224 == 1'd0))) begin
        tmp_V_reg_111 <= grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_tmp_V_20_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd0))) begin
        crc_V_2_reg_210 <= checksumInitStream98_dout;
        inPackLen_V_reg_205 <= checksumSizeStream96_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((~((endOutStrm7_full_n == 1'b0) | (checksumOutStream99_full_n == 1'b0) | (endInPackLenStrm6_empty_n == 1'b0) | ((checksumSizeStream96_empty_n == 1'b0) & (icmp_ln1069_reg_224 == 1'd0))) & (1'b1 == ap_CS_fsm_state8)) | (~((endInPackLenStrm6_empty_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        e_1_reg_102 <= endInPackLenStrm6_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        icmp_ln1069_reg_224 <= icmp_ln1069_fu_159_p2;
    end
end

always @ (*) begin
    if (((endInPackLenStrm6_empty_n == 1'b0) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((((checksumInitStream98_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)) | ((endOutStrm7_full_n == 1'b0) & (e_1_reg_102 == 1'd1)) | ((checksumSizeStream96_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

always @ (*) begin
    if ((grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_done == 1'b0)) begin
        ap_ST_fsm_state7_blk = 1'b1;
    end else begin
        ap_ST_fsm_state7_blk = 1'b0;
    end
end

always @ (*) begin
    if (((endOutStrm7_full_n == 1'b0) | (checksumOutStream99_full_n == 1'b0) | (endInPackLenStrm6_empty_n == 1'b0) | ((checksumSizeStream96_empty_n == 1'b0) & (icmp_ln1069_reg_224 == 1'd0)))) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

always @ (*) begin
    if (((~(((checksumInitStream98_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)) | ((endOutStrm7_full_n == 1'b0) & (e_1_reg_102 == 1'd1)) | ((checksumSizeStream96_empty_n == 1'b0) & (e_1_reg_102 == 1'd0))) & (1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd1)) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) & (icmp_ln1069_reg_224 == 1'd0))) begin
        ap_phi_mux_tmp_V_phi_fu_114_p4 = grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_tmp_V_20_out;
    end else begin
        ap_phi_mux_tmp_V_phi_fu_114_p4 = tmp_V_reg_111;
    end
end

always @ (*) begin
    if ((~(((checksumInitStream98_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)) | ((endOutStrm7_full_n == 1'b0) & (e_1_reg_102 == 1'd1)) | ((checksumSizeStream96_empty_n == 1'b0) & (e_1_reg_102 == 1'd0))) & (1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd0))) begin
        checksumInitStream98_blk_n = checksumInitStream98_empty_n;
    end else begin
        checksumInitStream98_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((checksumInitStream98_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)) | ((endOutStrm7_full_n == 1'b0) & (e_1_reg_102 == 1'd1)) | ((checksumSizeStream96_empty_n == 1'b0) & (e_1_reg_102 == 1'd0))) & (1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd0))) begin
        checksumInitStream98_read = 1'b1;
    end else begin
        checksumInitStream98_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        checksumOutStream99_blk_n = checksumOutStream99_full_n;
    end else begin
        checksumOutStream99_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((endOutStrm7_full_n == 1'b0) | (checksumOutStream99_full_n == 1'b0) | (endInPackLenStrm6_empty_n == 1'b0) | ((checksumSizeStream96_empty_n == 1'b0) & (icmp_ln1069_reg_224 == 1'd0))) & (1'b1 == ap_CS_fsm_state8))) begin
        checksumOutStream99_write = 1'b1;
    end else begin
        checksumOutStream99_write = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state8) & (icmp_ln1069_reg_224 == 1'd0)) | ((1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd0)))) begin
        checksumSizeStream96_blk_n = checksumSizeStream96_empty_n;
    end else begin
        checksumSizeStream96_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((~(((checksumInitStream98_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)) | ((endOutStrm7_full_n == 1'b0) & (e_1_reg_102 == 1'd1)) | ((checksumSizeStream96_empty_n == 1'b0) & (e_1_reg_102 == 1'd0))) & (1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd0)) | (~((endOutStrm7_full_n == 1'b0) | (checksumOutStream99_full_n == 1'b0) | (endInPackLenStrm6_empty_n == 1'b0) | ((checksumSizeStream96_empty_n == 1'b0) & (icmp_ln1069_reg_224 == 1'd0))) & (1'b1 == ap_CS_fsm_state8) & (icmp_ln1069_reg_224 == 1'd0)))) begin
        checksumSizeStream96_read = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        checksumSizeStream96_read = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_checksumSizeStream96_read;
    end else begin
        checksumSizeStream96_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        checksumStream94_read = grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_checksumStream94_read;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        checksumStream94_read = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_checksumStream94_read;
    end else begin
        checksumStream94_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1)))) begin
        endInPackLenStrm6_blk_n = endInPackLenStrm6_empty_n;
    end else begin
        endInPackLenStrm6_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((~((endOutStrm7_full_n == 1'b0) | (checksumOutStream99_full_n == 1'b0) | (endInPackLenStrm6_empty_n == 1'b0) | ((checksumSizeStream96_empty_n == 1'b0) & (icmp_ln1069_reg_224 == 1'd0))) & (1'b1 == ap_CS_fsm_state8)) | (~((endInPackLenStrm6_empty_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        endInPackLenStrm6_read = 1'b1;
    end else begin
        endInPackLenStrm6_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | ((1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd1)))) begin
        endOutStrm7_blk_n = endOutStrm7_full_n;
    end else begin
        endOutStrm7_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((endOutStrm7_full_n == 1'b0) | (checksumOutStream99_full_n == 1'b0) | (endInPackLenStrm6_empty_n == 1'b0) | ((checksumSizeStream96_empty_n == 1'b0) & (icmp_ln1069_reg_224 == 1'd0))) & (1'b1 == ap_CS_fsm_state8))) begin
        endOutStrm7_din = 1'd0;
    end else if ((~(((checksumInitStream98_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)) | ((endOutStrm7_full_n == 1'b0) & (e_1_reg_102 == 1'd1)) | ((checksumSizeStream96_empty_n == 1'b0) & (e_1_reg_102 == 1'd0))) & (1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd1))) begin
        endOutStrm7_din = 1'd1;
    end else begin
        endOutStrm7_din = 'bx;
    end
end

always @ (*) begin
    if (((~(((checksumInitStream98_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)) | ((endOutStrm7_full_n == 1'b0) & (e_1_reg_102 == 1'd1)) | ((checksumSizeStream96_empty_n == 1'b0) & (e_1_reg_102 == 1'd0))) & (1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd1)) | (~((endOutStrm7_full_n == 1'b0) | (checksumOutStream99_full_n == 1'b0) | (endInPackLenStrm6_empty_n == 1'b0) | ((checksumSizeStream96_empty_n == 1'b0) & (icmp_ln1069_reg_224 == 1'd0))) & (1'b1 == ap_CS_fsm_state8)))) begin
        endOutStrm7_write = 1'b1;
    end else begin
        endOutStrm7_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        p_ZN2xf8security8internalL7table16E_0_address0 = grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_p_ZN2xf8security8internalL7table16E_0_address0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        p_ZN2xf8security8internalL7table16E_0_address0 = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_address0;
    end else begin
        p_ZN2xf8security8internalL7table16E_0_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        p_ZN2xf8security8internalL7table16E_0_ce0 = grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_p_ZN2xf8security8internalL7table16E_0_ce0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        p_ZN2xf8security8internalL7table16E_0_ce0 = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce0;
    end else begin
        p_ZN2xf8security8internalL7table16E_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        p_ZN2xf8security8internalL7table16E_0_ce1 = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce1;
    end else begin
        p_ZN2xf8security8internalL7table16E_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        p_ZN2xf8security8internalL7table16E_0_ce2 = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce2;
    end else begin
        p_ZN2xf8security8internalL7table16E_0_ce2 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        p_ZN2xf8security8internalL7table16E_0_ce3 = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce3;
    end else begin
        p_ZN2xf8security8internalL7table16E_0_ce3 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        p_ZN2xf8security8internalL7table16E_0_ce4 = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce4;
    end else begin
        p_ZN2xf8security8internalL7table16E_0_ce4 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        p_ZN2xf8security8internalL7table16E_0_ce5 = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce5;
    end else begin
        p_ZN2xf8security8internalL7table16E_0_ce5 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        p_ZN2xf8security8internalL7table16E_0_ce6 = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce6;
    end else begin
        p_ZN2xf8security8internalL7table16E_0_ce6 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        p_ZN2xf8security8internalL7table16E_0_ce7 = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_p_ZN2xf8security8internalL7table16E_0_ce7;
    end else begin
        p_ZN2xf8security8internalL7table16E_0_ce7 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((endInPackLenStrm6_empty_n == 1'b0) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~(((checksumInitStream98_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)) | ((endOutStrm7_full_n == 1'b0) & (e_1_reg_102 == 1'd1)) | ((checksumSizeStream96_empty_n == 1'b0) & (e_1_reg_102 == 1'd0))) & (1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~(((checksumInitStream98_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)) | ((endOutStrm7_full_n == 1'b0) & (e_1_reg_102 == 1'd1)) | ((checksumSizeStream96_empty_n == 1'b0) & (e_1_reg_102 == 1'd0))) & (1'b1 == ap_CS_fsm_state2) & (e_1_reg_102 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (icmp_ln1069_fu_159_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if ((~((endOutStrm7_full_n == 1'b0) | (checksumOutStream99_full_n == 1'b0) | (endInPackLenStrm6_empty_n == 1'b0) | ((checksumSizeStream96_empty_n == 1'b0) & (icmp_ln1069_reg_224 == 1'd0))) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

always @ (*) begin
    ap_block_state1 = ((endInPackLenStrm6_empty_n == 1'b0) | (ap_start == 1'b0));
end

always @ (*) begin
    ap_block_state2 = (((checksumInitStream98_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)) | ((endOutStrm7_full_n == 1'b0) & (e_1_reg_102 == 1'd1)) | ((checksumSizeStream96_empty_n == 1'b0) & (e_1_reg_102 == 1'd0)));
end

always @ (*) begin
    ap_block_state8 = ((endOutStrm7_full_n == 1'b0) | (checksumOutStream99_full_n == 1'b0) | (endInPackLenStrm6_empty_n == 1'b0) | ((checksumSizeStream96_empty_n == 1'b0) & (icmp_ln1069_reg_224 == 1'd0)));
end

assign checksumOutStream99_din = (ap_phi_mux_tmp_V_phi_fu_114_p4 ^ 32'd4294967295);

assign grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_start = grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_ap_start_reg;

assign grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_start = grp_crc32_8_Pipeline_VITIS_LOOP_2443_7_fu_135_ap_start_reg;

assign icmp_ln1069_fu_159_p2 = ((grp_crc32_8_Pipeline_VITIS_LOOP_2412_4_fu_120_tmp_V_19_out == 5'd0) ? 1'b1 : 1'b0);

endmodule //gzipcMulticoreStreaming_crc32_8_s
