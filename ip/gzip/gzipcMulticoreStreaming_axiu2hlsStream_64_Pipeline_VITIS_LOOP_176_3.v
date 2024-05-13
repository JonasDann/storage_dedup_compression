// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_axiu2hlsStream_64_Pipeline_VITIS_LOOP_176_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        keep_V_1_reload,
        cntr_V_out,
        cntr_V_out_ap_vld
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [7:0] keep_V_1_reload;
output  [3:0] cntr_V_out;
output   cntr_V_out_ap_vld;

reg ap_idle;
reg cntr_V_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln176_fu_70_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg   [7:0] keep_V_fu_28;
wire   [7:0] zext_ln1044_fu_100_p1;
wire    ap_loop_init;
reg   [7:0] ap_sig_allocacmp_keep_V_2;
reg   [7:0] cntr_V_fu_32;
wire   [7:0] cntr_V_3_fu_84_p2;
reg   [7:0] ap_sig_allocacmp_cntr_V_2;
wire   [0:0] empty_434_fu_76_p1;
wire   [7:0] zext_ln886_fu_80_p1;
wire   [6:0] keep_V_3_fu_90_p4;
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
        if ((icmp_ln176_fu_70_p2 == 1'd0)) begin
            cntr_V_fu_32 <= cntr_V_3_fu_84_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            cntr_V_fu_32 <= 8'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        if ((icmp_ln176_fu_70_p2 == 1'd0)) begin
            keep_V_fu_28 <= zext_ln1044_fu_100_p1;
        end else if ((ap_loop_init == 1'b1)) begin
            keep_V_fu_28 <= keep_V_1_reload;
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
    if (((ap_start_int == 1'b1) & (icmp_ln176_fu_70_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
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
        ap_sig_allocacmp_cntr_V_2 = 8'd0;
    end else begin
        ap_sig_allocacmp_cntr_V_2 = cntr_V_fu_32;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_keep_V_2 = keep_V_1_reload;
    end else begin
        ap_sig_allocacmp_keep_V_2 = keep_V_fu_28;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (icmp_ln176_fu_70_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        cntr_V_out_ap_vld = 1'b1;
    end else begin
        cntr_V_out_ap_vld = 1'b0;
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

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = (ap_start_int == 1'b0);
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign cntr_V_3_fu_84_p2 = (zext_ln886_fu_80_p1 + ap_sig_allocacmp_cntr_V_2);

assign cntr_V_out = ap_sig_allocacmp_cntr_V_2[3:0];

assign empty_434_fu_76_p1 = ap_sig_allocacmp_keep_V_2[0:0];

assign icmp_ln176_fu_70_p2 = ((ap_sig_allocacmp_keep_V_2 == 8'd0) ? 1'b1 : 1'b0);

assign keep_V_3_fu_90_p4 = {{ap_sig_allocacmp_keep_V_2[7:1]}};

assign zext_ln1044_fu_100_p1 = keep_V_3_fu_90_p4;

assign zext_ln886_fu_80_p1 = empty_434_fu_76_p1;

endmodule //gzipcMulticoreStreaming_axiu2hlsStream_64_Pipeline_VITIS_LOOP_176_3
