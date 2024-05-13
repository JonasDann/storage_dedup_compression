// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_crc32_8_1 (
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
        checksumOutStream99_din,
        checksumOutStream99_num_data_valid,
        checksumOutStream99_fifo_cap,
        checksumOutStream99_full_n,
        checksumOutStream99_write
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
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
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
output  [31:0] checksumOutStream99_din;
input  [5:0] checksumOutStream99_num_data_valid;
input  [5:0] checksumOutStream99_fifo_cap;
input   checksumOutStream99_full_n;
output   checksumOutStream99_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg checksumInitStream98_read;
reg checksumStream94_read;
reg checksumSizeStream96_read;
reg checksumOutStream99_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
wire    grp_crc32_8_s_fu_65_ap_start;
wire    grp_crc32_8_s_fu_65_ap_done;
wire    grp_crc32_8_s_fu_65_ap_idle;
wire    grp_crc32_8_s_fu_65_ap_ready;
wire    grp_crc32_8_s_fu_65_checksumInitStream98_read;
wire    grp_crc32_8_s_fu_65_checksumStream94_read;
wire    grp_crc32_8_s_fu_65_checksumSizeStream96_read;
wire    grp_crc32_8_s_fu_65_endInPackLenStrm6_read;
wire   [31:0] grp_crc32_8_s_fu_65_checksumOutStream99_din;
wire    grp_crc32_8_s_fu_65_checksumOutStream99_write;
wire   [0:0] grp_crc32_8_s_fu_65_endOutStrm7_din;
wire    grp_crc32_8_s_fu_65_endOutStrm7_write;
reg    grp_crc32_8_s_fu_65_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
wire   [0:0] endInPackLenStrm_dout;
wire    endInPackLenStrm_empty_n;
reg    endInPackLenStrm_read;
wire    endOutStrm_full_n;
reg    endOutStrm_write;
reg   [0:0] endInPackLenStrm_din;
wire    endInPackLenStrm_full_n;
reg    endInPackLenStrm_write;
reg    ap_block_state1;
wire    ap_CS_fsm_state2;
wire   [0:0] endOutStrm_dout;
wire    endOutStrm_empty_n;
reg    endOutStrm_read;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 6'd1;
#0 grp_crc32_8_s_fu_65_ap_start_reg = 1'b0;
end

gzipcMulticoreStreaming_crc32_8_s grp_crc32_8_s_fu_65(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_crc32_8_s_fu_65_ap_start),
    .ap_done(grp_crc32_8_s_fu_65_ap_done),
    .ap_idle(grp_crc32_8_s_fu_65_ap_idle),
    .ap_ready(grp_crc32_8_s_fu_65_ap_ready),
    .checksumInitStream98_dout(checksumInitStream98_dout),
    .checksumInitStream98_num_data_valid(3'd0),
    .checksumInitStream98_fifo_cap(3'd0),
    .checksumInitStream98_empty_n(checksumInitStream98_empty_n),
    .checksumInitStream98_read(grp_crc32_8_s_fu_65_checksumInitStream98_read),
    .checksumStream94_dout(checksumStream94_dout),
    .checksumStream94_num_data_valid(3'd0),
    .checksumStream94_fifo_cap(3'd0),
    .checksumStream94_empty_n(checksumStream94_empty_n),
    .checksumStream94_read(grp_crc32_8_s_fu_65_checksumStream94_read),
    .checksumSizeStream96_dout(checksumSizeStream96_dout),
    .checksumSizeStream96_num_data_valid(3'd0),
    .checksumSizeStream96_fifo_cap(3'd0),
    .checksumSizeStream96_empty_n(checksumSizeStream96_empty_n),
    .checksumSizeStream96_read(grp_crc32_8_s_fu_65_checksumSizeStream96_read),
    .endInPackLenStrm6_dout(endInPackLenStrm_dout),
    .endInPackLenStrm6_empty_n(endInPackLenStrm_empty_n),
    .endInPackLenStrm6_read(grp_crc32_8_s_fu_65_endInPackLenStrm6_read),
    .checksumOutStream99_din(grp_crc32_8_s_fu_65_checksumOutStream99_din),
    .checksumOutStream99_num_data_valid(6'd0),
    .checksumOutStream99_fifo_cap(6'd0),
    .checksumOutStream99_full_n(checksumOutStream99_full_n),
    .checksumOutStream99_write(grp_crc32_8_s_fu_65_checksumOutStream99_write),
    .endOutStrm7_din(grp_crc32_8_s_fu_65_endOutStrm7_din),
    .endOutStrm7_full_n(endOutStrm_full_n),
    .endOutStrm7_write(grp_crc32_8_s_fu_65_endOutStrm7_write)
);

gzipcMulticoreStreaming_fifo_w1_d4_S endInPackLenStrm_fifo_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(endInPackLenStrm_din),
    .if_full_n(endInPackLenStrm_full_n),
    .if_write(endInPackLenStrm_write),
    .if_dout(endInPackLenStrm_dout),
    .if_empty_n(endInPackLenStrm_empty_n),
    .if_read(endInPackLenStrm_read)
);

gzipcMulticoreStreaming_fifo_w1_d4_S endOutStrm_fifo_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(grp_crc32_8_s_fu_65_endOutStrm7_din),
    .if_full_n(endOutStrm_full_n),
    .if_write(endOutStrm_write),
    .if_dout(endOutStrm_dout),
    .if_empty_n(endOutStrm_empty_n),
    .if_read(endOutStrm_read)
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
        end else if (((endOutStrm_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_crc32_8_s_fu_65_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_crc32_8_s_fu_65_ap_start_reg <= 1'b1;
        end else if ((grp_crc32_8_s_fu_65_ap_ready == 1'b1)) begin
            grp_crc32_8_s_fu_65_ap_start_reg <= 1'b0;
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

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (endInPackLenStrm_full_n == 1'b0) | (real_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((endInPackLenStrm_full_n == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_crc32_8_s_fu_65_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((endOutStrm_empty_n == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((endOutStrm_empty_n == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if (((endOutStrm_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
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
    if ((1'b1 == ap_CS_fsm_state4)) begin
        checksumInitStream98_read = grp_crc32_8_s_fu_65_checksumInitStream98_read;
    end else begin
        checksumInitStream98_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        checksumOutStream99_write = grp_crc32_8_s_fu_65_checksumOutStream99_write;
    end else begin
        checksumOutStream99_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        checksumSizeStream96_read = grp_crc32_8_s_fu_65_checksumSizeStream96_read;
    end else begin
        checksumSizeStream96_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        checksumStream94_read = grp_crc32_8_s_fu_65_checksumStream94_read;
    end else begin
        checksumStream94_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (endInPackLenStrm_full_n == 1'b1))) begin
        endInPackLenStrm_din = 1'd1;
    end else if ((~((ap_done_reg == 1'b1) | (endInPackLenStrm_full_n == 1'b0) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        endInPackLenStrm_din = 1'd0;
    end else begin
        endInPackLenStrm_din = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        endInPackLenStrm_read = grp_crc32_8_s_fu_65_endInPackLenStrm6_read;
    end else begin
        endInPackLenStrm_read = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_CS_fsm_state2) & (endInPackLenStrm_full_n == 1'b1)) | (~((ap_done_reg == 1'b1) | (endInPackLenStrm_full_n == 1'b0) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1)))) begin
        endInPackLenStrm_write = 1'b1;
    end else begin
        endInPackLenStrm_write = 1'b0;
    end
end

always @ (*) begin
    if ((((endOutStrm_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state6)) | ((endOutStrm_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state5)))) begin
        endOutStrm_read = 1'b1;
    end else begin
        endOutStrm_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        endOutStrm_write = grp_crc32_8_s_fu_65_endOutStrm7_write;
    end else begin
        endOutStrm_write = 1'b0;
    end
end

always @ (*) begin
    if (((endOutStrm_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
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
            if ((~((ap_done_reg == 1'b1) | (endInPackLenStrm_full_n == 1'b0) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (endInPackLenStrm_full_n == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_crc32_8_s_fu_65_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((endOutStrm_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((endOutStrm_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
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

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (endInPackLenStrm_full_n == 1'b0) | (real_start == 1'b0));
end

assign ap_ready = internal_ap_ready;

assign checksumOutStream99_din = grp_crc32_8_s_fu_65_checksumOutStream99_din;

assign grp_crc32_8_s_fu_65_ap_start = grp_crc32_8_s_fu_65_ap_start_reg;

assign start_out = real_start;

endmodule //gzipcMulticoreStreaming_crc32_8_1
