// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_zlibHuffmanEncoderStatic_14 (
        ap_start,
        start_full_n,
        start_out,
        start_write,
        lz77Stream_4_dout,
        lz77Stream_4_empty_n,
        lz77Stream_4_read,
        huffStream_4_din,
        huffStream_4_full_n,
        huffStream_4_write,
        ap_clk,
        ap_rst,
        ap_done,
        ap_ready,
        ap_idle,
        ap_continue
);


input   ap_start;
input   start_full_n;
output   start_out;
output   start_write;
input  [9:0] lz77Stream_4_dout;
input   lz77Stream_4_empty_n;
output   lz77Stream_4_read;
output  [17:0] huffStream_4_din;
input   huffStream_4_full_n;
output   huffStream_4_write;
input   ap_clk;
input   ap_rst;
output   ap_done;
output   ap_ready;
output   ap_idle;
input   ap_continue;

reg start_write;

reg    real_start;
reg    start_once_reg;
wire    internal_ap_ready;
wire    huffmanProcessingUnit_52_U0_ap_start;
wire    huffmanProcessingUnit_52_U0_ap_done;
wire    huffmanProcessingUnit_52_U0_ap_continue;
wire    huffmanProcessingUnit_52_U0_ap_idle;
wire    huffmanProcessingUnit_52_U0_ap_ready;
wire    huffmanProcessingUnit_52_U0_start_out;
wire    huffmanProcessingUnit_52_U0_start_write;
wire    huffmanProcessingUnit_52_U0_lz77Stream_4_read;
wire   [32:0] huffmanProcessingUnit_52_U0_encodedOutStream_din;
wire    huffmanProcessingUnit_52_U0_encodedOutStream_write;
wire    huffmanEncoderStatic_53_U0_ap_start;
wire    huffmanEncoderStatic_53_U0_ap_done;
wire    huffmanEncoderStatic_53_U0_ap_continue;
wire    huffmanEncoderStatic_53_U0_ap_idle;
wire    huffmanEncoderStatic_53_U0_ap_ready;
wire    huffmanEncoderStatic_53_U0_start_out;
wire    huffmanEncoderStatic_53_U0_start_write;
wire    huffmanEncoderStatic_53_U0_encodedOutStream_read;
wire   [19:0] huffmanEncoderStatic_53_U0_hufCodeStream_din;
wire    huffmanEncoderStatic_53_U0_hufCodeStream_write;
wire    bitPackingStatic_54_U0_ap_start;
wire    bitPackingStatic_54_U0_ap_done;
wire    bitPackingStatic_54_U0_ap_continue;
wire    bitPackingStatic_54_U0_ap_idle;
wire    bitPackingStatic_54_U0_ap_ready;
wire    bitPackingStatic_54_U0_hufCodeStream_read;
wire   [17:0] bitPackingStatic_54_U0_huffStream_4_din;
wire    bitPackingStatic_54_U0_huffStream_4_write;
wire    encodedOutStream_full_n;
wire   [32:0] encodedOutStream_dout;
wire   [2:0] encodedOutStream_num_data_valid;
wire   [2:0] encodedOutStream_fifo_cap;
wire    encodedOutStream_empty_n;
wire    hufCodeStream_full_n;
wire   [19:0] hufCodeStream_dout;
wire   [2:0] hufCodeStream_num_data_valid;
wire   [2:0] hufCodeStream_fifo_cap;
wire    hufCodeStream_empty_n;
wire    ap_sync_ready;
wire   [0:0] start_for_huffmanEncoderStatic_53_U0_din;
wire    start_for_huffmanEncoderStatic_53_U0_full_n;
wire   [0:0] start_for_huffmanEncoderStatic_53_U0_dout;
wire    start_for_huffmanEncoderStatic_53_U0_empty_n;
wire   [0:0] start_for_bitPackingStatic_54_U0_din;
wire    start_for_bitPackingStatic_54_U0_full_n;
wire   [0:0] start_for_bitPackingStatic_54_U0_dout;
wire    start_for_bitPackingStatic_54_U0_empty_n;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
end

gzipcMulticoreStreaming_huffmanProcessingUnit_52 huffmanProcessingUnit_52_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(huffmanProcessingUnit_52_U0_ap_start),
    .start_full_n(start_for_huffmanEncoderStatic_53_U0_full_n),
    .ap_done(huffmanProcessingUnit_52_U0_ap_done),
    .ap_continue(huffmanProcessingUnit_52_U0_ap_continue),
    .ap_idle(huffmanProcessingUnit_52_U0_ap_idle),
    .ap_ready(huffmanProcessingUnit_52_U0_ap_ready),
    .start_out(huffmanProcessingUnit_52_U0_start_out),
    .start_write(huffmanProcessingUnit_52_U0_start_write),
    .lz77Stream_4_dout(lz77Stream_4_dout),
    .lz77Stream_4_num_data_valid(3'd0),
    .lz77Stream_4_fifo_cap(3'd0),
    .lz77Stream_4_empty_n(lz77Stream_4_empty_n),
    .lz77Stream_4_read(huffmanProcessingUnit_52_U0_lz77Stream_4_read),
    .encodedOutStream_din(huffmanProcessingUnit_52_U0_encodedOutStream_din),
    .encodedOutStream_num_data_valid(encodedOutStream_num_data_valid),
    .encodedOutStream_fifo_cap(encodedOutStream_fifo_cap),
    .encodedOutStream_full_n(encodedOutStream_full_n),
    .encodedOutStream_write(huffmanProcessingUnit_52_U0_encodedOutStream_write)
);

gzipcMulticoreStreaming_huffmanEncoderStatic_53 huffmanEncoderStatic_53_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(huffmanEncoderStatic_53_U0_ap_start),
    .start_full_n(start_for_bitPackingStatic_54_U0_full_n),
    .ap_done(huffmanEncoderStatic_53_U0_ap_done),
    .ap_continue(huffmanEncoderStatic_53_U0_ap_continue),
    .ap_idle(huffmanEncoderStatic_53_U0_ap_idle),
    .ap_ready(huffmanEncoderStatic_53_U0_ap_ready),
    .start_out(huffmanEncoderStatic_53_U0_start_out),
    .start_write(huffmanEncoderStatic_53_U0_start_write),
    .encodedOutStream_dout(encodedOutStream_dout),
    .encodedOutStream_num_data_valid(encodedOutStream_num_data_valid),
    .encodedOutStream_fifo_cap(encodedOutStream_fifo_cap),
    .encodedOutStream_empty_n(encodedOutStream_empty_n),
    .encodedOutStream_read(huffmanEncoderStatic_53_U0_encodedOutStream_read),
    .hufCodeStream_din(huffmanEncoderStatic_53_U0_hufCodeStream_din),
    .hufCodeStream_num_data_valid(hufCodeStream_num_data_valid),
    .hufCodeStream_fifo_cap(hufCodeStream_fifo_cap),
    .hufCodeStream_full_n(hufCodeStream_full_n),
    .hufCodeStream_write(huffmanEncoderStatic_53_U0_hufCodeStream_write)
);

gzipcMulticoreStreaming_bitPackingStatic_54 bitPackingStatic_54_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(bitPackingStatic_54_U0_ap_start),
    .ap_done(bitPackingStatic_54_U0_ap_done),
    .ap_continue(bitPackingStatic_54_U0_ap_continue),
    .ap_idle(bitPackingStatic_54_U0_ap_idle),
    .ap_ready(bitPackingStatic_54_U0_ap_ready),
    .hufCodeStream_dout(hufCodeStream_dout),
    .hufCodeStream_num_data_valid(hufCodeStream_num_data_valid),
    .hufCodeStream_fifo_cap(hufCodeStream_fifo_cap),
    .hufCodeStream_empty_n(hufCodeStream_empty_n),
    .hufCodeStream_read(bitPackingStatic_54_U0_hufCodeStream_read),
    .huffStream_4_din(bitPackingStatic_54_U0_huffStream_4_din),
    .huffStream_4_num_data_valid(3'd0),
    .huffStream_4_fifo_cap(3'd0),
    .huffStream_4_full_n(huffStream_4_full_n),
    .huffStream_4_write(bitPackingStatic_54_U0_huffStream_4_write)
);

gzipcMulticoreStreaming_fifo_w33_d4_S_x10 encodedOutStream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(huffmanProcessingUnit_52_U0_encodedOutStream_din),
    .if_full_n(encodedOutStream_full_n),
    .if_write(huffmanProcessingUnit_52_U0_encodedOutStream_write),
    .if_dout(encodedOutStream_dout),
    .if_num_data_valid(encodedOutStream_num_data_valid),
    .if_fifo_cap(encodedOutStream_fifo_cap),
    .if_empty_n(encodedOutStream_empty_n),
    .if_read(huffmanEncoderStatic_53_U0_encodedOutStream_read)
);

gzipcMulticoreStreaming_fifo_w20_d4_S_x2 hufCodeStream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(huffmanEncoderStatic_53_U0_hufCodeStream_din),
    .if_full_n(hufCodeStream_full_n),
    .if_write(huffmanEncoderStatic_53_U0_hufCodeStream_write),
    .if_dout(hufCodeStream_dout),
    .if_num_data_valid(hufCodeStream_num_data_valid),
    .if_fifo_cap(hufCodeStream_fifo_cap),
    .if_empty_n(hufCodeStream_empty_n),
    .if_read(bitPackingStatic_54_U0_hufCodeStream_read)
);

gzipcMulticoreStreaming_start_for_huffmanEncoderStatic_53_U0 start_for_huffmanEncoderStatic_53_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_huffmanEncoderStatic_53_U0_din),
    .if_full_n(start_for_huffmanEncoderStatic_53_U0_full_n),
    .if_write(huffmanProcessingUnit_52_U0_start_write),
    .if_dout(start_for_huffmanEncoderStatic_53_U0_dout),
    .if_empty_n(start_for_huffmanEncoderStatic_53_U0_empty_n),
    .if_read(huffmanEncoderStatic_53_U0_ap_ready)
);

gzipcMulticoreStreaming_start_for_bitPackingStatic_54_U0 start_for_bitPackingStatic_54_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_bitPackingStatic_54_U0_din),
    .if_full_n(start_for_bitPackingStatic_54_U0_full_n),
    .if_write(huffmanEncoderStatic_53_U0_start_write),
    .if_dout(start_for_bitPackingStatic_54_U0_dout),
    .if_empty_n(start_for_bitPackingStatic_54_U0_empty_n),
    .if_read(bitPackingStatic_54_U0_ap_ready)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if (((real_start == 1'b1) & (internal_ap_ready == 1'b0))) begin
            start_once_reg <= 1'b1;
        end else if ((internal_ap_ready == 1'b1)) begin
            start_once_reg <= 1'b0;
        end
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

assign ap_done = bitPackingStatic_54_U0_ap_done;

assign ap_idle = (huffmanProcessingUnit_52_U0_ap_idle & huffmanEncoderStatic_53_U0_ap_idle & bitPackingStatic_54_U0_ap_idle);

assign ap_ready = huffmanProcessingUnit_52_U0_ap_ready;

assign ap_sync_ready = huffmanProcessingUnit_52_U0_ap_ready;

assign bitPackingStatic_54_U0_ap_continue = ap_continue;

assign bitPackingStatic_54_U0_ap_start = start_for_bitPackingStatic_54_U0_empty_n;

assign huffStream_4_din = bitPackingStatic_54_U0_huffStream_4_din;

assign huffStream_4_write = bitPackingStatic_54_U0_huffStream_4_write;

assign huffmanEncoderStatic_53_U0_ap_continue = 1'b1;

assign huffmanEncoderStatic_53_U0_ap_start = start_for_huffmanEncoderStatic_53_U0_empty_n;

assign huffmanProcessingUnit_52_U0_ap_continue = 1'b1;

assign huffmanProcessingUnit_52_U0_ap_start = real_start;

assign internal_ap_ready = ap_sync_ready;

assign lz77Stream_4_read = huffmanProcessingUnit_52_U0_lz77Stream_4_read;

assign start_for_bitPackingStatic_54_U0_din = 1'b1;

assign start_for_huffmanEncoderStatic_53_U0_din = 1'b1;

assign start_out = real_start;

endmodule //gzipcMulticoreStreaming_zlibHuffmanEncoderStatic_14
