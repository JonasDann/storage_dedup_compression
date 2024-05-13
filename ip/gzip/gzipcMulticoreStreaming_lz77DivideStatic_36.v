// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_lz77DivideStatic_36 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        boosterStream_dout,
        boosterStream_num_data_valid,
        boosterStream_fifo_cap,
        boosterStream_empty_n,
        boosterStream_read,
        lz77Stream_5_din,
        lz77Stream_5_num_data_valid,
        lz77Stream_5_fifo_cap,
        lz77Stream_5_full_n,
        lz77Stream_5_write
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [32:0] boosterStream_dout;
input  [2:0] boosterStream_num_data_valid;
input  [2:0] boosterStream_fifo_cap;
input   boosterStream_empty_n;
output   boosterStream_read;
output  [9:0] lz77Stream_5_din;
input  [2:0] lz77Stream_5_num_data_valid;
input  [2:0] lz77Stream_5_fifo_cap;
input   lz77Stream_5_full_n;
output   lz77Stream_5_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg boosterStream_read;
reg[9:0] lz77Stream_5_din;
reg lz77Stream_5_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    lz77Stream_5_blk_n;
wire    ap_CS_fsm_state4;
wire    grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_start;
wire    grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_done;
wire    grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_idle;
wire    grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_ready;
wire    grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_boosterStream_read;
wire   [9:0] grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_lz77Stream_5_din;
wire    grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_lz77Stream_5_write;
wire   [8:0] grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_conv2_i_i225_out;
wire    grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_conv2_i_i225_out_ap_vld;
wire   [0:0] grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_just_started_1_out;
wire    grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_just_started_1_out_ap_vld;
reg    grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
reg   [8:0] conv2_i_i220_lcssa227229_fu_32;
wire   [0:0] last_block_load_fu_69_p1;
wire   [9:0] tmp_s_fu_72_p3;
reg   [3:0] ap_NS_fsm;
reg    ap_block_state1;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 4'd1;
#0 grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_start_reg = 1'b0;
end

gzipcMulticoreStreaming_lz77DivideStatic_36_Pipeline_lz77_divide grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_start),
    .ap_done(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_done),
    .ap_idle(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_idle),
    .ap_ready(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_ready),
    .boosterStream_dout(boosterStream_dout),
    .boosterStream_num_data_valid(3'd0),
    .boosterStream_fifo_cap(3'd0),
    .boosterStream_empty_n(boosterStream_empty_n),
    .boosterStream_read(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_boosterStream_read),
    .lz77Stream_5_din(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_lz77Stream_5_din),
    .lz77Stream_5_num_data_valid(3'd0),
    .lz77Stream_5_fifo_cap(3'd0),
    .lz77Stream_5_full_n(lz77Stream_5_full_n),
    .lz77Stream_5_write(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_lz77Stream_5_write),
    .conv2_i_i220_lcssa227229(conv2_i_i220_lcssa227229_fu_32),
    .conv2_i_i225_out(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_conv2_i_i225_out),
    .conv2_i_i225_out_ap_vld(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_conv2_i_i225_out_ap_vld),
    .just_started_1_out(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_just_started_1_out),
    .just_started_1_out_ap_vld(grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_just_started_1_out_ap_vld)
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
        end else if (((last_block_load_fu_69_p1 == 1'd1) & (lz77Stream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_start_reg <= 1'b1;
        end else if ((grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_ready == 1'b1)) begin
            grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((lz77Stream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        conv2_i_i220_lcssa227229_fu_32 <= grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_conv2_i_i225_out;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) | (ap_done_reg == 1'b1))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

always @ (*) begin
    if ((lz77Stream_5_full_n == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if (((last_block_load_fu_69_p1 == 1'd1) & (lz77Stream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
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
    if (((last_block_load_fu_69_p1 == 1'd1) & (lz77Stream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        boosterStream_read = grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_boosterStream_read;
    end else begin
        boosterStream_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        lz77Stream_5_blk_n = lz77Stream_5_full_n;
    end else begin
        lz77Stream_5_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((lz77Stream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        lz77Stream_5_din = tmp_s_fu_72_p3;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        lz77Stream_5_din = grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_lz77Stream_5_din;
    end else begin
        lz77Stream_5_din = grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_lz77Stream_5_din;
    end
end

always @ (*) begin
    if (((lz77Stream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        lz77Stream_5_write = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        lz77Stream_5_write = grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_lz77Stream_5_write;
    end else begin
        lz77Stream_5_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((last_block_load_fu_69_p1 == 1'd1) & (lz77Stream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((last_block_load_fu_69_p1 == 1'd0) & (lz77Stream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
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

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_start = grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_ap_start_reg;

assign last_block_load_fu_69_p1 = grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_just_started_1_out;

assign tmp_s_fu_72_p3 = {{1'd0}, {grp_lz77DivideStatic_36_Pipeline_lz77_divide_fu_51_conv2_i_i225_out}};

endmodule //gzipcMulticoreStreaming_lz77DivideStatic_36
