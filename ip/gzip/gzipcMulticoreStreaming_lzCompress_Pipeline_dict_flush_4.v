// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_lzCompress_Pipeline_dict_flush_4 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        dict_V_address0,
        dict_V_ce0,
        dict_V_we0,
        dict_V_d0,
        dict_V_address1,
        dict_V_ce1,
        dict_V_we1,
        dict_V_d1
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [11:0] dict_V_address0;
output   dict_V_ce0;
output   dict_V_we0;
output  [431:0] dict_V_d0;
output  [11:0] dict_V_address1;
output   dict_V_ce1;
output   dict_V_we1;
output  [431:0] dict_V_d1;

reg ap_idle;
reg dict_V_ce0;
reg dict_V_we0;
reg dict_V_ce1;
reg dict_V_we1;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] tmp_fu_79_p3;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire   [63:0] zext_ln234_fu_87_p1;
wire   [63:0] zext_ln237_fu_102_p1;
reg   [12:0] i_fu_40;
wire   [12:0] add_ln234_fu_107_p2;
wire    ap_loop_init;
reg   [12:0] ap_sig_allocacmp_i_11;
wire   [11:0] trunc_ln234_fu_92_p1;
wire   [11:0] or_ln234_fu_96_p2;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
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
        ap_CS_fsm <= ap_ST_fsm_state1;
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
        end else if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((tmp_fu_79_p3 == 1'd0)) begin
            i_fu_40 <= add_ln234_fu_107_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_40 <= 13'd0;
        end
    end
end

always @ (*) begin
    if ((ap_start_int == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (tmp_fu_79_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i_11 = 13'd0;
    end else begin
        ap_sig_allocacmp_i_11 = i_fu_40;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        dict_V_ce0 = 1'b1;
    end else begin
        dict_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        dict_V_ce1 = 1'b1;
    end else begin
        dict_V_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (tmp_fu_79_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        dict_V_we0 = 1'b1;
    end else begin
        dict_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (tmp_fu_79_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        dict_V_we1 = 1'b1;
    end else begin
        dict_V_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln234_fu_107_p2 = (ap_sig_allocacmp_i_11 + 13'd2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign dict_V_address0 = zext_ln237_fu_102_p1;

assign dict_V_address1 = zext_ln234_fu_87_p1;

assign dict_V_d0 = 432'd11090678115427290648067406327099816567816485687858739297904344355517527431150386278551834614265618837387151732050401883924453130240;

assign dict_V_d1 = 432'd11090678115427290648067406327099816567816485687858739297904344355517527431150386278551834614265618837387151732050401883924453130240;

assign or_ln234_fu_96_p2 = (trunc_ln234_fu_92_p1 | 12'd1);

assign tmp_fu_79_p3 = ap_sig_allocacmp_i_11[32'd12];

assign trunc_ln234_fu_92_p1 = ap_sig_allocacmp_i_11[11:0];

assign zext_ln234_fu_87_p1 = ap_sig_allocacmp_i_11;

assign zext_ln237_fu_102_p1 = or_ln234_fu_96_p2;

endmodule //gzipcMulticoreStreaming_lzCompress_Pipeline_dict_flush_4
