// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_huffmanEncoderStatic_44 (
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
        encodedOutStream_dout,
        encodedOutStream_num_data_valid,
        encodedOutStream_fifo_cap,
        encodedOutStream_empty_n,
        encodedOutStream_read,
        hufCodeStream_din,
        hufCodeStream_num_data_valid,
        hufCodeStream_fifo_cap,
        hufCodeStream_full_n,
        hufCodeStream_write
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
input  [32:0] encodedOutStream_dout;
input  [2:0] encodedOutStream_num_data_valid;
input  [2:0] encodedOutStream_fifo_cap;
input   encodedOutStream_empty_n;
output   encodedOutStream_read;
output  [19:0] hufCodeStream_din;
input  [2:0] hufCodeStream_num_data_valid;
input  [2:0] hufCodeStream_fifo_cap;
input   hufCodeStream_full_n;
output   hufCodeStream_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg encodedOutStream_read;
reg[19:0] hufCodeStream_din;
reg hufCodeStream_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    encodedOutStream_blk_n;
wire    ap_CS_fsm_state2;
reg    hufCodeStream_blk_n;
wire   [0:0] tmp_strobe_V_fu_101_p3;
wire    ap_CS_fsm_state5;
wire    ap_CS_fsm_state6;
wire   [31:0] tmp_data_V_fu_109_p1;
reg   [31:0] tmp_data_V_reg_116;
wire    grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_start;
wire    grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_done;
wire    grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_idle;
wire    grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_ready;
wire    grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_encodedOutStream_read;
wire   [19:0] grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_hufCodeStream_din;
wire    grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_hufCodeStream_write;
reg    grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_start_reg;
reg   [5:0] ap_NS_fsm;
wire    ap_NS_fsm_state3;
wire    ap_CS_fsm_state4;
reg    ap_block_state2;
reg    ap_block_state1;
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
#0 grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_start_reg = 1'b0;
end

gzipcMulticoreStreaming_huffmanEncoderStatic_44_Pipeline_huffman_loop grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_start),
    .ap_done(grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_done),
    .ap_idle(grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_idle),
    .ap_ready(grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_ready),
    .encodedOutStream_dout(encodedOutStream_dout),
    .encodedOutStream_num_data_valid(3'd0),
    .encodedOutStream_fifo_cap(3'd0),
    .encodedOutStream_empty_n(encodedOutStream_empty_n),
    .encodedOutStream_read(grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_encodedOutStream_read),
    .hufCodeStream_din(grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_hufCodeStream_din),
    .hufCodeStream_num_data_valid(3'd0),
    .hufCodeStream_fifo_cap(3'd0),
    .hufCodeStream_full_n(hufCodeStream_full_n),
    .hufCodeStream_write(grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_hufCodeStream_write),
    .tmp_data_V(tmp_data_V_reg_116)
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
        end else if ((~((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0))) & (tmp_strobe_V_fu_101_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state2) & (1'b1 == ap_NS_fsm_state3))) begin
            grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_start_reg <= 1'b1;
        end else if ((grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_ready == 1'b1)) begin
            grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_start_reg <= 1'b0;
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
    if (((tmp_strobe_V_fu_101_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_data_V_reg_116 <= tmp_data_V_fu_109_p1;
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
    if (((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((hufCodeStream_full_n == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((hufCodeStream_full_n == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0))) & (tmp_strobe_V_fu_101_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if ((1'b1 == ap_CS_fsm_state2)) begin
        encodedOutStream_blk_n = encodedOutStream_empty_n;
    end else begin
        encodedOutStream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
        encodedOutStream_read = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        encodedOutStream_read = grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_encodedOutStream_read;
    end else begin
        encodedOutStream_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state5) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        hufCodeStream_blk_n = hufCodeStream_full_n;
    end else begin
        hufCodeStream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((hufCodeStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        hufCodeStream_din = 20'd753664;
    end else if ((((hufCodeStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state6)) | (~((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0))) & (tmp_strobe_V_fu_101_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        hufCodeStream_din = 20'd229376;
    end else if ((~((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0))) & (tmp_strobe_V_fu_101_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        hufCodeStream_din = 20'd622594;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        hufCodeStream_din = grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_hufCodeStream_din;
    end else begin
        hufCodeStream_din = grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_hufCodeStream_din;
    end
end

always @ (*) begin
    if ((((hufCodeStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state6)) | ((hufCodeStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5)) | (~((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0))) & (tmp_strobe_V_fu_101_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | (~((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0))) & (tmp_strobe_V_fu_101_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        hufCodeStream_write = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        hufCodeStream_write = grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_hufCodeStream_write;
    end else begin
        hufCodeStream_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0))) & (tmp_strobe_V_fu_101_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
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
            if ((~((ap_done_reg == 1'b1) | (real_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0))) & (tmp_strobe_V_fu_101_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0))) & (tmp_strobe_V_fu_101_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((hufCodeStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((hufCodeStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
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

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_NS_fsm_state3 = ap_NS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (real_start == 1'b0));
end

always @ (*) begin
    ap_block_state2 = ((encodedOutStream_empty_n == 1'b0) | ((tmp_strobe_V_fu_101_p3 == 1'd0) & (hufCodeStream_full_n == 1'b0)) | ((tmp_strobe_V_fu_101_p3 == 1'd1) & (hufCodeStream_full_n == 1'b0)));
end

assign ap_ready = internal_ap_ready;

assign grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_start = grp_huffmanEncoderStatic_44_Pipeline_huffman_loop_fu_72_ap_start_reg;

assign start_out = real_start;

assign tmp_data_V_fu_109_p1 = encodedOutStream_dout[31:0];

assign tmp_strobe_V_fu_101_p3 = encodedOutStream_dout[32'd32];

endmodule //gzipcMulticoreStreaming_huffmanEncoderStatic_44
