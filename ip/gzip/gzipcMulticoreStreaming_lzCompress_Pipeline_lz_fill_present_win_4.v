// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_lzCompress_Pipeline_lz_fill_present_win_4 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        downStream_3_dout,
        downStream_3_num_data_valid,
        downStream_3_fifo_cap,
        downStream_3_empty_n,
        downStream_3_read,
        present_window_84,
        present_window_83,
        present_window_82,
        present_window_81,
        present_window,
        empty,
        present_window_89_out,
        present_window_89_out_ap_vld,
        present_window_88_out,
        present_window_88_out_ap_vld,
        present_window_87_out,
        present_window_87_out_ap_vld,
        present_window_86_out,
        present_window_86_out_ap_vld,
        present_window_85_out,
        present_window_85_out_ap_vld,
        tmp_data_V_69_out,
        tmp_data_V_69_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [8:0] downStream_3_dout;
input  [5:0] downStream_3_num_data_valid;
input  [5:0] downStream_3_fifo_cap;
input   downStream_3_empty_n;
output   downStream_3_read;
input  [7:0] present_window_84;
input  [7:0] present_window_83;
input  [7:0] present_window_82;
input  [7:0] present_window_81;
input  [7:0] present_window;
input  [7:0] empty;
output  [7:0] present_window_89_out;
output   present_window_89_out_ap_vld;
output  [7:0] present_window_88_out;
output   present_window_88_out_ap_vld;
output  [7:0] present_window_87_out;
output   present_window_87_out_ap_vld;
output  [7:0] present_window_86_out;
output   present_window_86_out_ap_vld;
output  [7:0] present_window_85_out;
output   present_window_85_out_ap_vld;
output  [7:0] tmp_data_V_69_out;
output   tmp_data_V_69_out_ap_vld;

reg ap_idle;
reg downStream_3_read;
reg present_window_89_out_ap_vld;
reg present_window_88_out_ap_vld;
reg present_window_87_out_ap_vld;
reg present_window_86_out_ap_vld;
reg present_window_85_out_ap_vld;
reg tmp_data_V_69_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] icmp_ln253_reg_342;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln253_fu_214_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    downStream_3_blk_n;
wire    ap_block_pp0_stage0;
reg   [2:0] iIdx_4_reg_338;
reg    ap_block_pp0_stage0_11001;
reg   [2:0] iIdx_fu_64;
wire   [2:0] add_ln257_fu_220_p2;
wire    ap_loop_init;
reg   [2:0] ap_sig_allocacmp_iIdx_4;
reg   [7:0] present_window_25_fu_68;
reg   [7:0] present_window_26_fu_72;
reg   [7:0] present_window_27_fu_76;
reg   [7:0] present_window_28_fu_80;
wire   [7:0] trunc_ln257_fu_235_p1;
reg   [7:0] present_window_29_fu_84;
reg   [7:0] present_window_30_fu_88;
reg    ap_block_pp0_stage0_01001;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_216;
reg    ap_condition_219;
reg    ap_condition_222;
reg    ap_condition_226;
reg    ap_condition_232;
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if (((ap_loop_exit_ready == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_loop_exit_ready_pp0_iter1_reg <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_11001)) begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln253_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            iIdx_fu_64 <= add_ln257_fu_220_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            iIdx_fu_64 <= 3'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            present_window_25_fu_68 <= present_window;
        end else if ((1'b1 == ap_condition_216)) begin
            present_window_25_fu_68 <= present_window_28_fu_80;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            present_window_26_fu_72 <= present_window_81;
        end else if ((1'b1 == ap_condition_219)) begin
            present_window_26_fu_72 <= present_window_28_fu_80;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            present_window_27_fu_76 <= present_window_82;
        end else if ((1'b1 == ap_condition_222)) begin
            present_window_27_fu_76 <= present_window_28_fu_80;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            present_window_28_fu_80 <= empty;
        end else if (((icmp_ln253_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            present_window_28_fu_80 <= trunc_ln257_fu_235_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            present_window_29_fu_84 <= present_window_83;
        end else if ((1'b1 == ap_condition_226)) begin
            present_window_29_fu_84 <= present_window_28_fu_80;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            present_window_30_fu_88 <= present_window_84;
        end else if ((1'b1 == ap_condition_232)) begin
            present_window_30_fu_88 <= present_window_28_fu_80;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        iIdx_4_reg_338 <= ap_sig_allocacmp_iIdx_4;
        icmp_ln253_reg_342 <= icmp_ln253_fu_214_p2;
    end
end

always @ (*) begin
    if (((icmp_ln253_fu_214_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
        ap_sig_allocacmp_iIdx_4 = 3'd0;
    end else begin
        ap_sig_allocacmp_iIdx_4 = iIdx_fu_64;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln253_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        downStream_3_blk_n = downStream_3_empty_n;
    end else begin
        downStream_3_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln253_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        downStream_3_read = 1'b1;
    end else begin
        downStream_3_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln253_reg_342 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        present_window_85_out_ap_vld = 1'b1;
    end else begin
        present_window_85_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln253_reg_342 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        present_window_86_out_ap_vld = 1'b1;
    end else begin
        present_window_86_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln253_reg_342 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        present_window_87_out_ap_vld = 1'b1;
    end else begin
        present_window_87_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln253_reg_342 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        present_window_88_out_ap_vld = 1'b1;
    end else begin
        present_window_88_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln253_reg_342 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        present_window_89_out_ap_vld = 1'b1;
    end else begin
        present_window_89_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln253_reg_342 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_data_V_69_out_ap_vld = 1'b1;
    end else begin
        tmp_data_V_69_out_ap_vld = 1'b0;
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

assign add_ln257_fu_220_p2 = (ap_sig_allocacmp_iIdx_4 + 3'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((icmp_ln253_reg_342 == 1'd0) & (downStream_3_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((icmp_ln253_reg_342 == 1'd0) & (downStream_3_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((icmp_ln253_reg_342 == 1'd0) & (downStream_3_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((icmp_ln253_reg_342 == 1'd0) & (downStream_3_empty_n == 1'b0));
end

always @ (*) begin
    ap_condition_216 = ((iIdx_4_reg_338 == 3'd0) & (icmp_ln253_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_219 = ((iIdx_4_reg_338 == 3'd1) & (icmp_ln253_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_222 = ((iIdx_4_reg_338 == 3'd2) & (icmp_ln253_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_226 = ((iIdx_4_reg_338 == 3'd3) & (icmp_ln253_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_232 = (~(iIdx_4_reg_338 == 3'd3) & ~(iIdx_4_reg_338 == 3'd2) & ~(iIdx_4_reg_338 == 3'd1) & ~(iIdx_4_reg_338 == 3'd0) & (icmp_ln253_reg_342 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln253_fu_214_p2 = ((ap_sig_allocacmp_iIdx_4 == 3'd5) ? 1'b1 : 1'b0);

assign present_window_85_out = present_window_25_fu_68;

assign present_window_86_out = present_window_26_fu_72;

assign present_window_87_out = present_window_27_fu_76;

assign present_window_88_out = present_window_29_fu_84;

assign present_window_89_out = present_window_30_fu_88;

assign tmp_data_V_69_out = present_window_28_fu_80;

assign trunc_ln257_fu_235_p1 = downStream_3_dout[7:0];

endmodule //gzipcMulticoreStreaming_lzCompress_Pipeline_lz_fill_present_win_4
