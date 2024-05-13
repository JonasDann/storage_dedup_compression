// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_lzBooster_255_4096_16384_64_23 (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        compressedStream1_dout,
        compressedStream1_num_data_valid,
        compressedStream1_fifo_cap,
        compressedStream1_empty_n,
        compressedStream1_read,
        boosterStream_din,
        boosterStream_num_data_valid,
        boosterStream_fifo_cap,
        boosterStream_full_n,
        boosterStream_write
);

parameter    ap_ST_fsm_state1 = 11'd1;
parameter    ap_ST_fsm_state2 = 11'd2;
parameter    ap_ST_fsm_state3 = 11'd4;
parameter    ap_ST_fsm_state4 = 11'd8;
parameter    ap_ST_fsm_state5 = 11'd16;
parameter    ap_ST_fsm_state6 = 11'd32;
parameter    ap_ST_fsm_state7 = 11'd64;
parameter    ap_ST_fsm_state8 = 11'd128;
parameter    ap_ST_fsm_state9 = 11'd256;
parameter    ap_ST_fsm_state10 = 11'd512;
parameter    ap_ST_fsm_state11 = 11'd1024;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [32:0] compressedStream1_dout;
input  [2:0] compressedStream1_num_data_valid;
input  [2:0] compressedStream1_fifo_cap;
input   compressedStream1_empty_n;
output   compressedStream1_read;
output  [32:0] boosterStream_din;
input  [2:0] boosterStream_num_data_valid;
input  [2:0] boosterStream_fifo_cap;
input   boosterStream_full_n;
output   boosterStream_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg compressedStream1_read;
reg[32:0] boosterStream_din;
reg boosterStream_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    compressedStream1_blk_n;
wire    ap_CS_fsm_state2;
reg    boosterStream_blk_n;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state11;
wire   [0:0] tmp_strobe_V_fu_137_p3;
wire   [31:0] tmp_data_V_fu_145_p1;
reg   [31:0] tmp_data_V_reg_262;
reg   [0:0] tmp_reg_273;
wire    ap_CS_fsm_state6;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_start;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_done;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_idle;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_ready;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_compressedStream1_read;
wire   [31:0] grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_lclBufStream_din;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_lclBufStream_write;
wire   [31:0] grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_tmp_data_V_57_out;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_tmp_data_V_57_out_ap_vld;
wire   [32:0] grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_p_phi_out;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_p_phi_out_ap_vld;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_start;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_done;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_idle;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_ready;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_compressedStream1_read;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_lclBufStream_read;
wire   [31:0] grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_lclBufStream_din;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_lclBufStream_write;
wire   [32:0] grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_boosterStream_din;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_boosterStream_write;
wire   [31:0] grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_outValue_V_28_out;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_outValue_V_28_out_ap_vld;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_start;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_done;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_idle;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_ready;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_lclBufStream_read;
wire   [32:0] grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_boosterStream_din;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_boosterStream_write;
wire   [31:0] grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_phi_ln174_out;
wire    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_phi_ln174_out_ap_vld;
reg    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg   [31:0] lclBufStream_din;
wire    lclBufStream_full_n;
reg    lclBufStream_write;
reg    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_start_reg;
wire    ap_CS_fsm_state7;
wire   [31:0] lclBufStream_dout;
wire    lclBufStream_empty_n;
reg    lclBufStream_read;
reg    grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_start_reg;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state10;
reg   [31:0] outValue_V_fu_60;
reg    ap_block_state1;
reg   [31:0] outStreamValue_data_V_fu_64;
reg    ap_block_state2;
wire   [32:0] p_0_fu_152_p3;
wire   [32:0] tmp_s_fu_184_p3;
wire   [32:0] tmp_169_fu_201_p3;
reg   [10:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ST_fsm_state6_blk;
reg    ap_ST_fsm_state7_blk;
reg    ap_ST_fsm_state8_blk;
wire    ap_ST_fsm_state9_blk;
reg    ap_ST_fsm_state10_blk;
reg    ap_ST_fsm_state11_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 11'd1;
#0 grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_start_reg = 1'b0;
#0 grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_start_reg = 1'b0;
#0 grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_start_reg = 1'b0;
end

gzipcMulticoreStreaming_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_start),
    .ap_done(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_done),
    .ap_idle(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_idle),
    .ap_ready(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_ready),
    .compressedStream1_dout(compressedStream1_dout),
    .compressedStream1_num_data_valid(3'd0),
    .compressedStream1_fifo_cap(3'd0),
    .compressedStream1_empty_n(compressedStream1_empty_n),
    .compressedStream1_read(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_compressedStream1_read),
    .lclBufStream_din(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_lclBufStream_din),
    .lclBufStream_full_n(lclBufStream_full_n),
    .lclBufStream_write(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_lclBufStream_write),
    .tmp_data_V(tmp_data_V_reg_262),
    .tmp_data_V_57_out(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_tmp_data_V_57_out),
    .tmp_data_V_57_out_ap_vld(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_tmp_data_V_57_out_ap_vld),
    .p_phi_out(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_p_phi_out),
    .p_phi_out_ap_vld(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_p_phi_out_ap_vld)
);

gzipcMulticoreStreaming_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_start),
    .ap_done(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_done),
    .ap_idle(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_idle),
    .ap_ready(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_ready),
    .compressedStream1_dout(compressedStream1_dout),
    .compressedStream1_num_data_valid(3'd0),
    .compressedStream1_fifo_cap(3'd0),
    .compressedStream1_empty_n(compressedStream1_empty_n),
    .compressedStream1_read(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_compressedStream1_read),
    .lclBufStream_dout(lclBufStream_dout),
    .lclBufStream_empty_n(lclBufStream_empty_n),
    .lclBufStream_read(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_lclBufStream_read),
    .lclBufStream_din(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_lclBufStream_din),
    .lclBufStream_full_n(lclBufStream_full_n),
    .lclBufStream_write(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_lclBufStream_write),
    .boosterStream_din(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_boosterStream_din),
    .boosterStream_num_data_valid(3'd0),
    .boosterStream_fifo_cap(3'd0),
    .boosterStream_full_n(boosterStream_full_n),
    .boosterStream_write(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_boosterStream_write),
    .tmp_data_V_57_reload(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_tmp_data_V_57_out),
    .trunc_ln(tmp_reg_273),
    .outValue_V(outValue_V_fu_60),
    .outValue_V_28_out(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_outValue_V_28_out),
    .outValue_V_28_out_ap_vld(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_outValue_V_28_out_ap_vld)
);

gzipcMulticoreStreaming_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_start),
    .ap_done(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_done),
    .ap_idle(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_idle),
    .ap_ready(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_ready),
    .lclBufStream_dout(lclBufStream_dout),
    .lclBufStream_empty_n(lclBufStream_empty_n),
    .lclBufStream_read(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_lclBufStream_read),
    .boosterStream_din(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_boosterStream_din),
    .boosterStream_num_data_valid(3'd0),
    .boosterStream_fifo_cap(3'd0),
    .boosterStream_full_n(boosterStream_full_n),
    .boosterStream_write(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_boosterStream_write),
    .phi_ln174_out(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_phi_ln174_out),
    .phi_ln174_out_ap_vld(grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_phi_ln174_out_ap_vld)
);

gzipcMulticoreStreaming_fifo_w32_d66_S_x lclBufStream_fifo_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(lclBufStream_din),
    .if_full_n(lclBufStream_full_n),
    .if_write(lclBufStream_write),
    .if_dout(lclBufStream_dout),
    .if_empty_n(lclBufStream_empty_n),
    .if_read(lclBufStream_read)
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((compressedStream1_empty_n == 1'b0) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (boosterStream_full_n == 1'b0))) & (tmp_strobe_V_fu_137_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_start_reg <= 1'b1;
        end else if ((grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_ready == 1'b1)) begin
            grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_start_reg <= 1'b1;
        end else if ((grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_ready == 1'b1)) begin
            grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state9)) begin
            grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_start_reg <= 1'b1;
        end else if ((grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_ready == 1'b1)) begin
            grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((internal_ap_ready == 1'b0) & (real_start == 1'b1))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        outValue_V_fu_60 <= 32'd0;
    end else if (((boosterStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
        outValue_V_fu_60 <= grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_outValue_V_28_out;
    end
end

always @ (posedge ap_clk) begin
    if (((boosterStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
        outStreamValue_data_V_fu_64 <= grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_phi_ln174_out;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_strobe_V_fu_137_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_data_V_reg_262 <= tmp_data_V_fu_145_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        tmp_reg_273 <= grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_p_phi_out[32'd32];
    end
end

always @ (*) begin
    if ((grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_done == 1'b0)) begin
        ap_ST_fsm_state10_blk = 1'b1;
    end else begin
        ap_ST_fsm_state10_blk = 1'b0;
    end
end

always @ (*) begin
    if ((boosterStream_full_n == 1'b0)) begin
        ap_ST_fsm_state11_blk = 1'b1;
    end else begin
        ap_ST_fsm_state11_blk = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (real_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((compressedStream1_empty_n == 1'b0) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (boosterStream_full_n == 1'b0)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

assign ap_ST_fsm_state6_blk = 1'b0;

always @ (*) begin
    if ((grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_done == 1'b0)) begin
        ap_ST_fsm_state7_blk = 1'b1;
    end else begin
        ap_ST_fsm_state7_blk = 1'b0;
    end
end

always @ (*) begin
    if ((boosterStream_full_n == 1'b0)) begin
        ap_ST_fsm_state8_blk = 1'b1;
    end else begin
        ap_ST_fsm_state8_blk = 1'b0;
    end
end

assign ap_ST_fsm_state9_blk = 1'b0;

always @ (*) begin
    if ((~((compressedStream1_empty_n == 1'b0) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (boosterStream_full_n == 1'b0))) & (tmp_strobe_V_fu_137_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (real_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state8) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        boosterStream_blk_n = boosterStream_full_n;
    end else begin
        boosterStream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((boosterStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
        boosterStream_din = tmp_169_fu_201_p3;
    end else if (((boosterStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
        boosterStream_din = tmp_s_fu_184_p3;
    end else if ((~((compressedStream1_empty_n == 1'b0) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (boosterStream_full_n == 1'b0))) & (tmp_strobe_V_fu_137_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        boosterStream_din = p_0_fu_152_p3;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        boosterStream_din = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_boosterStream_din;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        boosterStream_din = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_boosterStream_din;
    end else begin
        boosterStream_din = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_boosterStream_din;
    end
end

always @ (*) begin
    if (((~((compressedStream1_empty_n == 1'b0) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (boosterStream_full_n == 1'b0))) & (tmp_strobe_V_fu_137_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((boosterStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state11)) | ((boosterStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state8)))) begin
        boosterStream_write = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        boosterStream_write = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_boosterStream_write;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        boosterStream_write = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_boosterStream_write;
    end else begin
        boosterStream_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        compressedStream1_blk_n = compressedStream1_empty_n;
    end else begin
        compressedStream1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((compressedStream1_empty_n == 1'b0) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (boosterStream_full_n == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
        compressedStream1_read = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        compressedStream1_read = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_compressedStream1_read;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        compressedStream1_read = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_compressedStream1_read;
    end else begin
        compressedStream1_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((compressedStream1_empty_n == 1'b0) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (boosterStream_full_n == 1'b0))) & (tmp_strobe_V_fu_137_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        lclBufStream_din = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_lclBufStream_din;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        lclBufStream_din = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_lclBufStream_din;
    end else begin
        lclBufStream_din = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_lclBufStream_din;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        lclBufStream_read = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_lclBufStream_read;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        lclBufStream_read = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_lclBufStream_read;
    end else begin
        lclBufStream_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        lclBufStream_write = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_lclBufStream_write;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        lclBufStream_write = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_lclBufStream_write;
    end else begin
        lclBufStream_write = 1'b0;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (start_full_n == 1'b0))) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((start_once_reg == 1'b0) & (real_start == 1'b1))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((compressedStream1_empty_n == 1'b0) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (boosterStream_full_n == 1'b0))) & (tmp_strobe_V_fu_137_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((compressedStream1_empty_n == 1'b0) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (boosterStream_full_n == 1'b0))) & (tmp_strobe_V_fu_137_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            if (((boosterStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state8))) begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            if (((1'b1 == ap_CS_fsm_state10) & (grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        ap_ST_fsm_state11 : begin
            if (((boosterStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state11))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (real_start == 1'b0));
end

always @ (*) begin
    ap_block_state2 = ((compressedStream1_empty_n == 1'b0) | ((tmp_strobe_V_fu_137_p3 == 1'd0) & (boosterStream_full_n == 1'b0)));
end

assign ap_ready = internal_ap_ready;

assign grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_start = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_ap_start_reg;

assign grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_start = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_init_buf_fu_101_ap_start_reg;

assign grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_start = grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_ap_start_reg;

assign p_0_fu_152_p3 = {{1'd0}, {outStreamValue_data_V_fu_64}};

assign start_out = real_start;

assign tmp_169_fu_201_p3 = {{1'd0}, {grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_left_bytes_fu_124_phi_ln174_out}};

assign tmp_data_V_fu_145_p1 = compressedStream1_dout[31:0];

assign tmp_s_fu_184_p3 = {{1'd1}, {grp_lzBooster_255_4096_16384_64_23_Pipeline_lz_booster_fu_111_outValue_V_28_out}};

assign tmp_strobe_V_fu_137_p3 = compressedStream1_dout[32'd32];

endmodule //gzipcMulticoreStreaming_lzBooster_255_4096_16384_64_23
