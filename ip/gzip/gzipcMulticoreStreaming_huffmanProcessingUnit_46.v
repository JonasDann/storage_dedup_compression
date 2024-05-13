// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_huffmanProcessingUnit_46 (
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
        lz77Stream_2_dout,
        lz77Stream_2_num_data_valid,
        lz77Stream_2_fifo_cap,
        lz77Stream_2_empty_n,
        lz77Stream_2_read,
        encodedOutStream_din,
        encodedOutStream_num_data_valid,
        encodedOutStream_fifo_cap,
        encodedOutStream_full_n,
        encodedOutStream_write
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

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
input  [9:0] lz77Stream_2_dout;
input  [2:0] lz77Stream_2_num_data_valid;
input  [2:0] lz77Stream_2_fifo_cap;
input   lz77Stream_2_empty_n;
output   lz77Stream_2_read;
output  [32:0] encodedOutStream_din;
input  [2:0] encodedOutStream_num_data_valid;
input  [2:0] encodedOutStream_fifo_cap;
input   encodedOutStream_full_n;
output   encodedOutStream_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg lz77Stream_2_read;
reg[32:0] encodedOutStream_din;
reg encodedOutStream_write;

reg    real_start;
reg    start_once_reg;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    lz77Stream_2_blk_n;
wire    ap_CS_fsm_state2;
reg    encodedOutStream_blk_n;
wire    ap_CS_fsm_state5;
wire   [0:0] tmp_strobe_V_fu_73_p3;
wire   [8:0] trunc_ln145_fu_69_p1;
reg   [8:0] trunc_ln145_reg_122;
wire    grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_start;
wire    grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_done;
wire    grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_idle;
wire    grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_ready;
wire    grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_lz77Stream_2_read;
wire   [32:0] grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_encodedOutStream_din;
wire    grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_encodedOutStream_write;
wire   [31:0] grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_outValue_data_V_112_out;
wire    grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_outValue_data_V_112_out_ap_vld;
reg    grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_start_reg;
reg   [4:0] ap_NS_fsm;
wire    ap_NS_fsm_state3;
wire    ap_CS_fsm_state4;
reg   [31:0] outValue_data_V_fu_38;
reg    ap_block_state2;
wire   [32:0] p_s_fu_84_p3;
wire   [32:0] tmp_s_fu_96_p3;
reg    ap_block_state1;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 start_once_reg = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_start_reg = 1'b0;
end

gzipcMulticoreStreaming_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_start),
    .ap_done(grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_done),
    .ap_idle(grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_idle),
    .ap_ready(grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_ready),
    .lz77Stream_2_dout(lz77Stream_2_dout),
    .lz77Stream_2_num_data_valid(3'd0),
    .lz77Stream_2_fifo_cap(3'd0),
    .lz77Stream_2_empty_n(lz77Stream_2_empty_n),
    .lz77Stream_2_read(grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_lz77Stream_2_read),
    .encodedOutStream_din(grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_encodedOutStream_din),
    .encodedOutStream_num_data_valid(3'd0),
    .encodedOutStream_fifo_cap(3'd0),
    .encodedOutStream_full_n(encodedOutStream_full_n),
    .encodedOutStream_write(grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_encodedOutStream_write),
    .empty(trunc_ln145_reg_122),
    .outValue_data_V_112_out(grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_outValue_data_V_112_out),
    .outValue_data_V_112_out_ap_vld(grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_outValue_data_V_112_out_ap_vld)
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
        end else if ((~((lz77Stream_2_empty_n == 1'b0) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (encodedOutStream_full_n == 1'b0))) & (tmp_strobe_V_fu_73_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_NS_fsm_state3) & (1'b1 == ap_CS_fsm_state2))) begin
            grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_start_reg <= 1'b1;
        end else if ((grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_ready == 1'b1)) begin
            grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_start_reg <= 1'b0;
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
    if (((encodedOutStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        outValue_data_V_fu_38 <= grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_outValue_data_V_112_out;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        trunc_ln145_reg_122 <= trunc_ln145_fu_69_p1;
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
    if (((lz77Stream_2_empty_n == 1'b0) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (encodedOutStream_full_n == 1'b0)))) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((encodedOutStream_full_n == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((lz77Stream_2_empty_n == 1'b0) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (encodedOutStream_full_n == 1'b0))) & (tmp_strobe_V_fu_73_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
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
    if (((1'b1 == ap_CS_fsm_state5) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        encodedOutStream_blk_n = encodedOutStream_full_n;
    end else begin
        encodedOutStream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((encodedOutStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        encodedOutStream_din = tmp_s_fu_96_p3;
    end else if ((~((lz77Stream_2_empty_n == 1'b0) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (encodedOutStream_full_n == 1'b0))) & (tmp_strobe_V_fu_73_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        encodedOutStream_din = p_s_fu_84_p3;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        encodedOutStream_din = grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_encodedOutStream_din;
    end else begin
        encodedOutStream_din = grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_encodedOutStream_din;
    end
end

always @ (*) begin
    if (((~((lz77Stream_2_empty_n == 1'b0) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (encodedOutStream_full_n == 1'b0))) & (tmp_strobe_V_fu_73_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2)) | ((encodedOutStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5)))) begin
        encodedOutStream_write = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        encodedOutStream_write = grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_encodedOutStream_write;
    end else begin
        encodedOutStream_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((lz77Stream_2_empty_n == 1'b0) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (encodedOutStream_full_n == 1'b0))) & (tmp_strobe_V_fu_73_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        lz77Stream_2_blk_n = lz77Stream_2_empty_n;
    end else begin
        lz77Stream_2_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((lz77Stream_2_empty_n == 1'b0) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (encodedOutStream_full_n == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
        lz77Stream_2_read = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        lz77Stream_2_read = grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_lz77Stream_2_read;
    end else begin
        lz77Stream_2_read = 1'b0;
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
            if ((~((lz77Stream_2_empty_n == 1'b0) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (encodedOutStream_full_n == 1'b0))) & (tmp_strobe_V_fu_73_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((lz77Stream_2_empty_n == 1'b0) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (encodedOutStream_full_n == 1'b0))) & (tmp_strobe_V_fu_73_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((encodedOutStream_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
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

assign ap_NS_fsm_state3 = ap_NS_fsm[32'd2];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (real_start == 1'b0));
end

always @ (*) begin
    ap_block_state2 = ((lz77Stream_2_empty_n == 1'b0) | ((tmp_strobe_V_fu_73_p3 == 1'd0) & (encodedOutStream_full_n == 1'b0)));
end

assign ap_ready = internal_ap_ready;

assign grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_start = grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_ap_start_reg;

assign p_s_fu_84_p3 = {{1'd0}, {outValue_data_V_fu_38}};

assign start_out = real_start;

assign tmp_s_fu_96_p3 = {{1'd0}, {grp_huffmanProcessingUnit_46_Pipeline_hf_proc_static_main_fu_59_outValue_data_V_112_out}};

assign tmp_strobe_V_fu_73_p3 = lz77Stream_2_dout[32'd9];

assign trunc_ln145_fu_69_p1 = lz77Stream_2_dout[8:0];

endmodule //gzipcMulticoreStreaming_huffmanProcessingUnit_46
