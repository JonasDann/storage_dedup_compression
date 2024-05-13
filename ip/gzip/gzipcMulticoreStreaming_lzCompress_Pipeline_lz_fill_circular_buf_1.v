// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_lzCompress_Pipeline_lz_fill_circular_buf_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        downStream_6_dout,
        downStream_6_num_data_valid,
        downStream_6_fifo_cap,
        downStream_6_empty_n,
        downStream_6_read,
        lclBufStream_din,
        lclBufStream_full_n,
        lclBufStream_write,
        tmp_data_V_54_reload,
        inVal_data_V_out,
        inVal_data_V_out_ap_vld,
        p_phi_out,
        p_phi_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [8:0] downStream_6_dout;
input  [5:0] downStream_6_num_data_valid;
input  [5:0] downStream_6_fifo_cap;
input   downStream_6_empty_n;
output   downStream_6_read;
output  [7:0] lclBufStream_din;
input   lclBufStream_full_n;
output   lclBufStream_write;
input  [7:0] tmp_data_V_54_reload;
output  [7:0] inVal_data_V_out;
output   inVal_data_V_out_ap_vld;
output  [8:0] p_phi_out;
output   p_phi_out_ap_vld;

reg ap_idle;
reg downStream_6_read;
reg lclBufStream_write;
reg inVal_data_V_out_ap_vld;
reg p_phi_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln261_fu_114_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    downStream_6_blk_n;
wire    ap_block_pp0_stage0;
reg    lclBufStream_blk_n;
reg   [8:0] p_phi_fu_56;
reg    ap_block_pp0_stage0_11001;
reg   [7:0] tmp_data_V_fu_60;
wire   [7:0] tmp_data_V_38_fu_135_p1;
wire    ap_loop_init;
reg   [6:0] i_2_fu_64;
wire   [6:0] add_ln261_fu_120_p2;
reg   [6:0] ap_sig_allocacmp_i;
reg    ap_block_pp0_stage0_01001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

gzipcMulticoreStreaming_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln261_fu_114_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_2_fu_64 <= add_ln261_fu_120_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_2_fu_64 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            tmp_data_V_fu_60 <= tmp_data_V_54_reload;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            tmp_data_V_fu_60 <= tmp_data_V_38_fu_135_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_phi_fu_56 <= downStream_6_dout;
    end
end

always @ (*) begin
    if (((icmp_ln261_fu_114_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i = 7'd0;
    end else begin
        ap_sig_allocacmp_i = i_2_fu_64;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        downStream_6_blk_n = downStream_6_empty_n;
    end else begin
        downStream_6_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        downStream_6_read = 1'b1;
    end else begin
        downStream_6_read = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln261_fu_114_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        inVal_data_V_out_ap_vld = 1'b1;
    end else begin
        inVal_data_V_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lclBufStream_blk_n = lclBufStream_full_n;
    end else begin
        lclBufStream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lclBufStream_write = 1'b1;
    end else begin
        lclBufStream_write = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln261_fu_114_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        p_phi_out_ap_vld = 1'b1;
    end else begin
        p_phi_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln261_fu_120_p2 = (ap_sig_allocacmp_i + 7'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((lclBufStream_full_n == 1'b0) | (downStream_6_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((lclBufStream_full_n == 1'b0) | (downStream_6_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((lclBufStream_full_n == 1'b0) | (downStream_6_empty_n == 1'b0)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((lclBufStream_full_n == 1'b0) | (downStream_6_empty_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln261_fu_114_p2 = ((ap_sig_allocacmp_i == 7'd64) ? 1'b1 : 1'b0);

assign inVal_data_V_out = tmp_data_V_fu_60;

assign lclBufStream_din = tmp_data_V_fu_60;

assign p_phi_out = p_phi_fu_56;

assign tmp_data_V_38_fu_135_p1 = downStream_6_dout[7:0];

endmodule //gzipcMulticoreStreaming_lzCompress_Pipeline_lz_fill_circular_buf_1
