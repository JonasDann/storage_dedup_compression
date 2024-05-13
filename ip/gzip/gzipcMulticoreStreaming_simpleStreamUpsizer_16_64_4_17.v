// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_simpleStreamUpsizer_16_64_4_17 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        huffStream_5_dout,
        huffStream_5_num_data_valid,
        huffStream_5_fifo_cap,
        huffStream_5_empty_n,
        huffStream_5_read,
        mergeStream_5_din,
        mergeStream_5_num_data_valid,
        mergeStream_5_fifo_cap,
        mergeStream_5_full_n,
        mergeStream_5_write
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [17:0] huffStream_5_dout;
input  [2:0] huffStream_5_num_data_valid;
input  [2:0] huffStream_5_fifo_cap;
input   huffStream_5_empty_n;
output   huffStream_5_read;
output  [67:0] mergeStream_5_din;
input  [9:0] mergeStream_5_num_data_valid;
input  [9:0] mergeStream_5_fifo_cap;
input   mergeStream_5_full_n;
output   mergeStream_5_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg huffStream_5_read;
reg[67:0] mergeStream_5_din;
reg mergeStream_5_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    huffStream_5_blk_n;
wire    ap_CS_fsm_state2;
reg    mergeStream_5_blk_n;
wire    ap_CS_fsm_state5;
wire   [7:0] tmp_data_V_fu_95_p1;
reg   [7:0] tmp_data_V_reg_144;
reg   [7:0] tmp_data_V_17_reg_149;
wire   [1:0] tmp_strobe_V_fu_109_p4;
reg   [1:0] tmp_strobe_V_reg_154;
wire   [0:0] loop_continue_fu_119_p2;
reg   [0:0] loop_continue_reg_159;
wire    grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_start;
wire    grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_done;
wire    grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_idle;
wire    grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_ready;
wire    grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_huffStream_5_read;
wire   [67:0] grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_mergeStream_5_din;
wire    grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_mergeStream_5_write;
wire   [63:0] grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_outVal_V_12_out_o;
wire    grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_outVal_V_12_out_o_ap_vld;
wire   [15:0] grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_inVal_V_27_out_o;
wire    grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_inVal_V_27_out_o_ap_vld;
wire   [0:0] grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_last_1_out;
wire    grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_last_1_out_ap_vld;
reg    grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_start_reg;
wire    ap_CS_fsm_state3;
wire    ap_CS_fsm_state4;
reg   [63:0] outVal_V_fu_58;
reg   [15:0] inVal_V_fu_54;
wire   [0:0] last_load_fu_125_p1;
reg   [4:0] ap_NS_fsm;
reg    ap_block_state1;
reg    ap_ST_fsm_state1_blk;
reg    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 5'd1;
#0 grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_start_reg = 1'b0;
end

gzipcMulticoreStreaming_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_start),
    .ap_done(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_done),
    .ap_idle(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_idle),
    .ap_ready(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_ready),
    .huffStream_5_dout(huffStream_5_dout),
    .huffStream_5_num_data_valid(3'd0),
    .huffStream_5_fifo_cap(3'd0),
    .huffStream_5_empty_n(huffStream_5_empty_n),
    .huffStream_5_read(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_huffStream_5_read),
    .mergeStream_5_din(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_mergeStream_5_din),
    .mergeStream_5_num_data_valid(10'd0),
    .mergeStream_5_fifo_cap(10'd0),
    .mergeStream_5_full_n(mergeStream_5_full_n),
    .mergeStream_5_write(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_mergeStream_5_write),
    .tmp_data_V_20(tmp_data_V_17_reg_149),
    .tmp_data_V(tmp_data_V_reg_144),
    .tmp_strobe_V_15(tmp_strobe_V_reg_154),
    .loop_continue(loop_continue_reg_159),
    .outVal_V_12_out_i(outVal_V_fu_58),
    .outVal_V_12_out_o(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_outVal_V_12_out_o),
    .outVal_V_12_out_o_ap_vld(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_outVal_V_12_out_o_ap_vld),
    .inVal_V_27_out_i(inVal_V_fu_54),
    .inVal_V_27_out_o(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_inVal_V_27_out_o),
    .inVal_V_27_out_o_ap_vld(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_inVal_V_27_out_o_ap_vld),
    .last_1_out(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_last_1_out),
    .last_1_out_ap_vld(grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_last_1_out_ap_vld)
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
        end else if (((mergeStream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (last_load_fu_125_p1 == 1'd1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_start_reg <= 1'b1;
        end else if ((grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_ready == 1'b1)) begin
            grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_inVal_V_27_out_o_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        inVal_V_fu_54 <= grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_inVal_V_27_out_o;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        loop_continue_reg_159 <= loop_continue_fu_119_p2;
        tmp_data_V_17_reg_149 <= {{huffStream_5_dout[15:8]}};
        tmp_data_V_reg_144 <= tmp_data_V_fu_95_p1;
        tmp_strobe_V_reg_154 <= {{huffStream_5_dout[17:16]}};
    end
end

always @ (posedge ap_clk) begin
    if (((grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_outVal_V_12_out_o_ap_vld == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        outVal_V_fu_58 <= grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_outVal_V_12_out_o;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b1) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((huffStream_5_empty_n == 1'b0)) begin
        ap_ST_fsm_state2_blk = 1'b1;
    end else begin
        ap_ST_fsm_state2_blk = 1'b0;
    end
end

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((mergeStream_5_full_n == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if (((mergeStream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (last_load_fu_125_p1 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
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
    if (((mergeStream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (last_load_fu_125_p1 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        huffStream_5_blk_n = huffStream_5_empty_n;
    end else begin
        huffStream_5_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((huffStream_5_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        huffStream_5_read = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        huffStream_5_read = grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_huffStream_5_read;
    end else begin
        huffStream_5_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        mergeStream_5_blk_n = mergeStream_5_full_n;
    end else begin
        mergeStream_5_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((mergeStream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        mergeStream_5_din = 68'd0;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        mergeStream_5_din = grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_mergeStream_5_din;
    end else begin
        mergeStream_5_din = grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_mergeStream_5_din;
    end
end

always @ (*) begin
    if (((mergeStream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        mergeStream_5_write = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        mergeStream_5_write = grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_mergeStream_5_write;
    end else begin
        mergeStream_5_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((huffStream_5_empty_n == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((mergeStream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (last_load_fu_125_p1 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((mergeStream_5_full_n == 1'b1) & (1'b1 == ap_CS_fsm_state5) & (last_load_fu_125_p1 == 1'd0))) begin
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

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_start = grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_ap_start_reg;

assign last_load_fu_125_p1 = grp_simpleStreamUpsizer_16_64_4_17_Pipeline_stream_upsizer_main_fu_80_last_1_out;

assign loop_continue_fu_119_p2 = ((tmp_strobe_V_fu_109_p4 != 2'd0) ? 1'b1 : 1'b0);

assign tmp_data_V_fu_95_p1 = huffStream_5_dout[7:0];

assign tmp_strobe_V_fu_109_p4 = {{huffStream_5_dout[17:16]}};

endmodule //gzipcMulticoreStreaming_simpleStreamUpsizer_16_64_4_17
