// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_lz77DivideStatic_24_Pipeline_lz77_divide (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        boosterStream_dout,
        boosterStream_num_data_valid,
        boosterStream_fifo_cap,
        boosterStream_empty_n,
        boosterStream_read,
        lz77Stream_1_din,
        lz77Stream_1_num_data_valid,
        lz77Stream_1_fifo_cap,
        lz77Stream_1_full_n,
        lz77Stream_1_write,
        conv2_i_i220_lcssa227229,
        conv2_i_i225_out,
        conv2_i_i225_out_ap_vld,
        just_started_1_out,
        just_started_1_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [32:0] boosterStream_dout;
input  [2:0] boosterStream_num_data_valid;
input  [2:0] boosterStream_fifo_cap;
input   boosterStream_empty_n;
output   boosterStream_read;
output  [9:0] lz77Stream_1_din;
input  [2:0] lz77Stream_1_num_data_valid;
input  [2:0] lz77Stream_1_fifo_cap;
input   lz77Stream_1_full_n;
output   lz77Stream_1_write;
input  [8:0] conv2_i_i220_lcssa227229;
output  [8:0] conv2_i_i225_out;
output   conv2_i_i225_out_ap_vld;
output  [0:0] just_started_1_out;
output   just_started_1_out_ap_vld;

reg ap_idle;
reg boosterStream_read;
reg lz77Stream_1_write;
reg conv2_i_i225_out_ap_vld;
reg just_started_1_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_predicate_op34_read_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg   [0:0] tmp_strobe_V_reg_348;
reg   [31:0] next_state_8_reg_344;
reg    ap_predicate_op56_write_state3;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] tmp_strobe_V_fu_187_p3;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    lz77Stream_1_blk_n;
wire    ap_block_pp0_stage0;
reg    boosterStream_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] just_started_fu_72;
wire    ap_loop_init;
reg   [7:0] tOffset1_8_fu_76;
reg   [7:0] tOffset2_8_fu_80;
reg   [31:0] next_state_fu_84;
wire   [0:0] icmp_ln275_fu_229_p2;
reg   [8:0] p_Result_32_fu_88;
wire   [8:0] zext_ln257_fu_156_p1;
wire   [8:0] zext_ln257_13_fu_173_p1;
wire   [8:0] p_Result_s_fu_250_p3;
wire   [8:0] zext_ln257_14_fu_268_p1;
reg    ap_block_pp0_stage0_01001;
wire   [7:0] tLen_fu_199_p4;
wire   [7:0] tCh_fu_195_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_258;
reg    ap_condition_263;
reg    ap_condition_266;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
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
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
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
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            just_started_fu_72 <= 1'd1;
        end else if ((1'b1 == ap_condition_258)) begin
            just_started_fu_72 <= 1'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~(next_state_fu_84 == 32'd1) & ~(next_state_fu_84 == 32'd2) & (tmp_strobe_V_fu_187_p3 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln275_fu_229_p2 == 1'd0))) begin
                next_state_fu_84[0] <= 1'b1;
        next_state_fu_84[1] <= 1'b0;
    end else if (((~(next_state_fu_84 == 32'd1) & ~(next_state_fu_84 == 32'd2) & (tmp_strobe_V_fu_187_p3 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln275_fu_229_p2 == 1'd1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (next_state_fu_84 == 32'd2) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1)))) begin
                next_state_fu_84[0] <= 1'b0;
        next_state_fu_84[1] <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (next_state_fu_84 == 32'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                next_state_fu_84[0] <= 1'b0;
        next_state_fu_84[1] <= 1'b1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            p_Result_32_fu_88 <= conv2_i_i220_lcssa227229;
        end else if ((1'b1 == ap_condition_266)) begin
            p_Result_32_fu_88 <= zext_ln257_14_fu_268_p1;
        end else if ((1'b1 == ap_condition_263)) begin
            p_Result_32_fu_88 <= p_Result_s_fu_250_p3;
        end else if (((next_state_fu_84 == 32'd2) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            p_Result_32_fu_88 <= zext_ln257_13_fu_173_p1;
        end else if (((next_state_fu_84 == 32'd1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            p_Result_32_fu_88 <= zext_ln257_fu_156_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            tOffset1_8_fu_76 <= 8'd0;
        end else if ((1'b1 == ap_condition_258)) begin
            tOffset1_8_fu_76 <= {{boosterStream_dout[23:16]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            tOffset2_8_fu_80 <= 8'd0;
        end else if ((1'b1 == ap_condition_258)) begin
            tOffset2_8_fu_80 <= {{boosterStream_dout[31:24]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        next_state_8_reg_344[1 : 0] <= next_state_fu_84[1 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((~(next_state_fu_84 == 32'd1) & ~(next_state_fu_84 == 32'd2) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_strobe_V_reg_348 <= boosterStream_dout[32'd32];
    end
end

always @ (*) begin
    if ((~(next_state_fu_84 == 32'd1) & ~(next_state_fu_84 == 32'd2) & (tmp_strobe_V_fu_187_p3 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
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
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op34_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        boosterStream_blk_n = boosterStream_empty_n;
    end else begin
        boosterStream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op34_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        boosterStream_read = 1'b1;
    end else begin
        boosterStream_read = 1'b0;
    end
end

always @ (*) begin
    if ((~(next_state_fu_84 == 32'd1) & ~(next_state_fu_84 == 32'd2) & (tmp_strobe_V_fu_187_p3 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        conv2_i_i225_out_ap_vld = 1'b1;
    end else begin
        conv2_i_i225_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~(next_state_fu_84 == 32'd1) & ~(next_state_fu_84 == 32'd2) & (tmp_strobe_V_fu_187_p3 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        just_started_1_out_ap_vld = 1'b1;
    end else begin
        just_started_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op56_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        lz77Stream_1_blk_n = lz77Stream_1_full_n;
    end else begin
        lz77Stream_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op56_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        lz77Stream_1_write = 1'b1;
    end else begin
        lz77Stream_1_write = 1'b0;
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

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_predicate_op56_write_state3 == 1'b1) & (lz77Stream_1_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_predicate_op34_read_state2 == 1'b1) & (boosterStream_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_predicate_op56_write_state3 == 1'b1) & (lz77Stream_1_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_predicate_op34_read_state2 == 1'b1) & (boosterStream_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_predicate_op56_write_state3 == 1'b1) & (lz77Stream_1_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_predicate_op34_read_state2 == 1'b1) & (boosterStream_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op34_read_state2 == 1'b1) & (boosterStream_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((ap_predicate_op56_write_state3 == 1'b1) & (lz77Stream_1_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_258 = (~(next_state_fu_84 == 32'd1) & ~(next_state_fu_84 == 32'd2) & (tmp_strobe_V_fu_187_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_263 = (~(next_state_fu_84 == 32'd1) & ~(next_state_fu_84 == 32'd2) & (tmp_strobe_V_fu_187_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln275_fu_229_p2 == 1'd0));
end

always @ (*) begin
    ap_condition_266 = (~(next_state_fu_84 == 32'd1) & ~(next_state_fu_84 == 32'd2) & (tmp_strobe_V_fu_187_p3 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (icmp_ln275_fu_229_p2 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

always @ (*) begin
    ap_predicate_op34_read_state2 = (~(next_state_fu_84 == 32'd1) & ~(next_state_fu_84 == 32'd2));
end

always @ (*) begin
    ap_predicate_op56_write_state3 = ((next_state_8_reg_344 == 32'd2) | ((next_state_8_reg_344 == 32'd1) | (tmp_strobe_V_reg_348 == 1'd1)));
end

assign conv2_i_i225_out = p_Result_32_fu_88;

assign icmp_ln275_fu_229_p2 = ((tLen_fu_199_p4 == 8'd0) ? 1'b1 : 1'b0);

assign just_started_1_out = just_started_fu_72;

assign lz77Stream_1_din = {{1'd1}, {p_Result_32_fu_88}};

assign p_Result_s_fu_250_p3 = {{1'd1}, {tLen_fu_199_p4}};

assign tCh_fu_195_p1 = boosterStream_dout[7:0];

assign tLen_fu_199_p4 = {{boosterStream_dout[15:8]}};

assign tmp_strobe_V_fu_187_p3 = boosterStream_dout[32'd32];

assign zext_ln257_13_fu_173_p1 = tOffset2_8_fu_80;

assign zext_ln257_14_fu_268_p1 = tCh_fu_195_p1;

assign zext_ln257_fu_156_p1 = tOffset1_8_fu_76;

always @ (posedge ap_clk) begin
    next_state_8_reg_344[31:2] <= 30'b000000000000000000000000000000;
    next_state_fu_84[31:2] <= 30'b000000000000000000000000000000;
end

endmodule //gzipcMulticoreStreaming_lz77DivideStatic_24_Pipeline_lz77_divide
