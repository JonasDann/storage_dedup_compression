// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_simpleStreamUpsizer_16_64_4_Pipeline_stream_upsizer_main (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        huffStream_0_dout,
        huffStream_0_num_data_valid,
        huffStream_0_fifo_cap,
        huffStream_0_empty_n,
        huffStream_0_read,
        mergeStream_0_din,
        mergeStream_0_num_data_valid,
        mergeStream_0_fifo_cap,
        mergeStream_0_full_n,
        mergeStream_0_write,
        tmp_data_V_44,
        tmp_data_V,
        tmp_strobe_V_31,
        loop_continue,
        outVal_V_24_out_i,
        outVal_V_24_out_o,
        outVal_V_24_out_o_ap_vld,
        inVal_V_55_out_i,
        inVal_V_55_out_o,
        inVal_V_55_out_o_ap_vld,
        last_1_out,
        last_1_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [17:0] huffStream_0_dout;
input  [2:0] huffStream_0_num_data_valid;
input  [2:0] huffStream_0_fifo_cap;
input   huffStream_0_empty_n;
output   huffStream_0_read;
output  [67:0] mergeStream_0_din;
input  [9:0] mergeStream_0_num_data_valid;
input  [9:0] mergeStream_0_fifo_cap;
input   mergeStream_0_full_n;
output   mergeStream_0_write;
input  [7:0] tmp_data_V_44;
input  [7:0] tmp_data_V;
input  [1:0] tmp_strobe_V_31;
input  [0:0] loop_continue;
input  [63:0] outVal_V_24_out_i;
output  [63:0] outVal_V_24_out_o;
output   outVal_V_24_out_o_ap_vld;
input  [15:0] inVal_V_55_out_i;
output  [15:0] inVal_V_55_out_o;
output   inVal_V_55_out_o_ap_vld;
output  [0:0] last_1_out;
output   last_1_out_ap_vld;

reg ap_idle;
reg huffStream_0_read;
reg mergeStream_0_write;
reg[63:0] outVal_V_24_out_o;
reg outVal_V_24_out_o_ap_vld;
reg[15:0] inVal_V_55_out_o;
reg inVal_V_55_out_o_ap_vld;
reg last_1_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
reg   [0:0] ap_phi_mux_loop_continue_2_phi_fu_176_p4;
wire   [0:0] icmp_ln1073_fu_285_p2;
reg    ap_predicate_op53_read_state1;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] loop_continue_2_reg_173;
reg   [0:0] icmp_ln233_reg_493;
reg    ap_predicate_op67_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    mergeStream_0_blk_n;
wire    ap_block_pp0_stage0;
reg    huffStream_0_blk_n;
reg   [0:0] last_reg_160;
reg   [0:0] loop_continue_1_reg_194;
reg   [3:0] dsize_V_1_reg_488;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln233_fu_248_p2;
wire   [15:0] inVal_V_3_fu_331_p3;
reg   [15:0] inVal_V_3_reg_501;
wire    ap_loop_init;
reg   [3:0] ap_phi_mux_dsize_V_2_phi_fu_187_p4;
wire   [3:0] ap_phi_reg_pp0_iter0_dsize_V_2_reg_184;
wire   [0:0] loop_continue_3_fu_257_p2;
wire   [0:0] ap_phi_reg_pp0_iter0_loop_continue_1_reg_194;
reg   [1:0] ap_phi_mux_inStVal_strobe_V_phi_fu_209_p4;
wire   [1:0] ap_phi_reg_pp0_iter0_inStVal_strobe_V_reg_206;
wire   [63:0] p_Result_2_fu_437_p3;
reg   [1:0] tmp_strobe_V_fu_96;
reg   [1:0] ap_sig_allocacmp_tmp_strobe_V_load;
reg   [1:0] ap_sig_allocacmp_tmp_strobe_V_load_1;
reg   [7:0] byteIdx_fu_100;
wire   [7:0] byteIdx_2_fu_339_p2;
reg   [7:0] ap_sig_allocacmp_byteIdx_load;
reg   [7:0] ap_sig_allocacmp_byteIdx_1;
reg   [3:0] dsize_V_fu_104;
wire   [3:0] dsize_V_3_fu_349_p2;
reg   [3:0] ap_sig_allocacmp_dsize_V_1;
reg   [7:0] tmp_data_V_1_fu_108;
wire   [7:0] tmp_data_V_3_fu_355_p1;
reg   [7:0] ap_sig_allocacmp_tmp_data_V_1_load;
reg   [7:0] tmp_data_V_2_fu_112;
reg   [7:0] ap_sig_allocacmp_tmp_data_V_2_load;
reg    ap_block_pp0_stage0_01001;
wire   [15:0] p_Result_s_fu_291_p5;
wire   [15:0] inVal_V_fu_303_p3;
wire   [0:0] tmp_fu_311_p3;
wire   [15:0] p_Result_1_fu_319_p5;
wire   [3:0] zext_ln886_fu_345_p1;
wire   [47:0] outVal_V_s_fu_427_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_325;
reg    ap_condition_331;
reg    ap_condition_136;
reg    ap_condition_336;
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
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        byteIdx_fu_100 <= byteIdx_2_fu_339_p2;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln233_fu_248_p2 == 1'd1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1)))) begin
        byteIdx_fu_100 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (ap_start_int == 1'b1))) begin
            dsize_V_fu_104 <= dsize_V_3_fu_349_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            dsize_V_fu_104 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_331)) begin
            last_reg_160 <= 1'd0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_init == 1'b1))) begin
            last_reg_160 <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_136)) begin
        if (((ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (icmp_ln233_fu_248_p2 == 1'd0))) begin
            loop_continue_1_reg_194 <= 1'd1;
        end else if (((ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (icmp_ln233_fu_248_p2 == 1'd1))) begin
            loop_continue_1_reg_194 <= loop_continue_3_fu_257_p2;
        end else if (~(ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd0)) begin
            loop_continue_1_reg_194 <= ap_phi_reg_pp0_iter0_loop_continue_1_reg_194;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_331)) begin
            loop_continue_2_reg_173 <= loop_continue_1_reg_194;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_init == 1'b1))) begin
            loop_continue_2_reg_173 <= loop_continue;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_336)) begin
            tmp_data_V_1_fu_108 <= tmp_data_V_3_fu_355_p1;
        end else if ((ap_loop_init == 1'b1)) begin
            tmp_data_V_1_fu_108 <= tmp_data_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_336)) begin
            tmp_data_V_2_fu_112 <= {{huffStream_0_dout[15:8]}};
        end else if ((ap_loop_init == 1'b1)) begin
            tmp_data_V_2_fu_112 <= tmp_data_V_44;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (ap_start_int == 1'b1))) begin
            tmp_strobe_V_fu_96 <= ap_phi_mux_inStVal_strobe_V_phi_fu_209_p4;
        end else if ((ap_loop_init == 1'b1)) begin
            tmp_strobe_V_fu_96 <= tmp_strobe_V_31;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dsize_V_1_reg_488 <= ap_sig_allocacmp_dsize_V_1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln233_reg_493 <= icmp_ln233_fu_248_p2;
        inVal_V_3_reg_501 <= inVal_V_3_fu_331_p3;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if ((ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1)) begin
        if ((icmp_ln233_fu_248_p2 == 1'd0)) begin
            ap_phi_mux_dsize_V_2_phi_fu_187_p4 = ap_sig_allocacmp_dsize_V_1;
        end else if ((icmp_ln233_fu_248_p2 == 1'd1)) begin
            ap_phi_mux_dsize_V_2_phi_fu_187_p4 = 4'd0;
        end else begin
            ap_phi_mux_dsize_V_2_phi_fu_187_p4 = ap_phi_reg_pp0_iter0_dsize_V_2_reg_184;
        end
    end else begin
        ap_phi_mux_dsize_V_2_phi_fu_187_p4 = ap_phi_reg_pp0_iter0_dsize_V_2_reg_184;
    end
end

always @ (*) begin
    if ((ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1)) begin
        if ((icmp_ln1073_fu_285_p2 == 1'd1)) begin
            ap_phi_mux_inStVal_strobe_V_phi_fu_209_p4 = 2'd0;
        end else if ((icmp_ln1073_fu_285_p2 == 1'd0)) begin
            ap_phi_mux_inStVal_strobe_V_phi_fu_209_p4 = {{huffStream_0_dout[17:16]}};
        end else begin
            ap_phi_mux_inStVal_strobe_V_phi_fu_209_p4 = ap_phi_reg_pp0_iter0_inStVal_strobe_V_reg_206;
        end
    end else begin
        ap_phi_mux_inStVal_strobe_V_phi_fu_209_p4 = ap_phi_reg_pp0_iter0_inStVal_strobe_V_reg_206;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
        if ((1'b1 == ap_condition_325)) begin
            ap_phi_mux_loop_continue_2_phi_fu_176_p4 = loop_continue_1_reg_194;
        end else if ((ap_loop_init == 1'b1)) begin
            ap_phi_mux_loop_continue_2_phi_fu_176_p4 = loop_continue;
        end else begin
            ap_phi_mux_loop_continue_2_phi_fu_176_p4 = loop_continue_1_reg_194;
        end
    end else begin
        ap_phi_mux_loop_continue_2_phi_fu_176_p4 = loop_continue_1_reg_194;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln233_fu_248_p2 == 1'd1)) | ((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1)))) begin
        ap_sig_allocacmp_byteIdx_1 = 8'd0;
    end else begin
        ap_sig_allocacmp_byteIdx_1 = byteIdx_fu_100;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_byteIdx_load = 8'd0;
    end else begin
        ap_sig_allocacmp_byteIdx_load = byteIdx_fu_100;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_dsize_V_1 = 4'd0;
    end else begin
        ap_sig_allocacmp_dsize_V_1 = dsize_V_fu_104;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_tmp_data_V_1_load = tmp_data_V;
    end else begin
        ap_sig_allocacmp_tmp_data_V_1_load = tmp_data_V_1_fu_108;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_tmp_data_V_2_load = tmp_data_V_44;
    end else begin
        ap_sig_allocacmp_tmp_data_V_2_load = tmp_data_V_2_fu_112;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_tmp_strobe_V_load = tmp_strobe_V_31;
    end else begin
        ap_sig_allocacmp_tmp_strobe_V_load = tmp_strobe_V_fu_96;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_tmp_strobe_V_load_1 = tmp_strobe_V_31;
    end else begin
        ap_sig_allocacmp_tmp_strobe_V_load_1 = tmp_strobe_V_fu_96;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op53_read_state1 == 1'b1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        huffStream_0_blk_n = huffStream_0_empty_n;
    end else begin
        huffStream_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op53_read_state1 == 1'b1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        huffStream_0_read = 1'b1;
    end else begin
        huffStream_0_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        inVal_V_55_out_o = inVal_V_3_fu_331_p3;
    end else begin
        inVal_V_55_out_o = inVal_V_55_out_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        inVal_V_55_out_o_ap_vld = 1'b1;
    end else begin
        inVal_V_55_out_o_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        last_1_out_ap_vld = 1'b1;
    end else begin
        last_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op67_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mergeStream_0_blk_n = mergeStream_0_full_n;
    end else begin
        mergeStream_0_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op67_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        mergeStream_0_write = 1'b1;
    end else begin
        mergeStream_0_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (loop_continue_2_reg_173 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        outVal_V_24_out_o = p_Result_2_fu_437_p3;
    end else begin
        outVal_V_24_out_o = outVal_V_24_out_i;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (loop_continue_2_reg_173 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        outVal_V_24_out_o_ap_vld = 1'b1;
    end else begin
        outVal_V_24_out_o_ap_vld = 1'b0;
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
    ap_block_pp0_stage0_01001 = (((ap_predicate_op67_write_state2 == 1'b1) & (mergeStream_0_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_predicate_op53_read_state1 == 1'b1) & (huffStream_0_empty_n == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_predicate_op67_write_state2 == 1'b1) & (mergeStream_0_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_predicate_op53_read_state1 == 1'b1) & (huffStream_0_empty_n == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_predicate_op67_write_state2 == 1'b1) & (mergeStream_0_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_predicate_op53_read_state1 == 1'b1) & (huffStream_0_empty_n == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_predicate_op53_read_state1 == 1'b1) & (huffStream_0_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op67_write_state2 == 1'b1) & (mergeStream_0_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_136 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_325 = ((1'b0 == ap_block_pp0_stage0) & (loop_continue_2_reg_173 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_331 = ((1'b0 == ap_block_pp0_stage0_11001) & (loop_continue_2_reg_173 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_336 = ((icmp_ln1073_fu_285_p2 == 1'd0) & (ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1) & (ap_start_int == 1'b1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_phi_reg_pp0_iter0_dsize_V_2_reg_184 = 'bx;

assign ap_phi_reg_pp0_iter0_inStVal_strobe_V_reg_206 = 'bx;

assign ap_phi_reg_pp0_iter0_loop_continue_1_reg_194 = 'bx;

always @ (*) begin
    ap_predicate_op53_read_state1 = ((icmp_ln1073_fu_285_p2 == 1'd0) & (ap_phi_mux_loop_continue_2_phi_fu_176_p4 == 1'd1));
end

always @ (*) begin
    ap_predicate_op67_write_state2 = ((icmp_ln233_reg_493 == 1'd1) & (loop_continue_2_reg_173 == 1'd1));
end

assign byteIdx_2_fu_339_p2 = (ap_sig_allocacmp_byteIdx_1 + 8'd1);

assign dsize_V_3_fu_349_p2 = (ap_phi_mux_dsize_V_2_phi_fu_187_p4 + zext_ln886_fu_345_p1);

assign icmp_ln1073_fu_285_p2 = ((ap_sig_allocacmp_tmp_strobe_V_load_1 == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln233_fu_248_p2 = ((ap_sig_allocacmp_byteIdx_load == 8'd4) ? 1'b1 : 1'b0);

assign inVal_V_3_fu_331_p3 = ((tmp_fu_311_p3[0:0] == 1'b1) ? p_Result_1_fu_319_p5 : inVal_V_fu_303_p3);

assign inVal_V_fu_303_p3 = ((icmp_ln1073_fu_285_p2[0:0] == 1'b1) ? inVal_V_55_out_i : p_Result_s_fu_291_p5);

assign last_1_out = last_reg_160;

assign loop_continue_3_fu_257_p2 = ((ap_sig_allocacmp_tmp_strobe_V_load != 2'd0) ? 1'b1 : 1'b0);

assign mergeStream_0_din = {{outVal_V_24_out_i}, {dsize_V_1_reg_488}};

assign outVal_V_s_fu_427_p4 = {{outVal_V_24_out_i[63:16]}};

assign p_Result_1_fu_319_p5 = {{ap_sig_allocacmp_tmp_data_V_2_load}, {inVal_V_fu_303_p3[7:0]}};

assign p_Result_2_fu_437_p3 = {{inVal_V_3_reg_501}, {outVal_V_s_fu_427_p4}};

assign p_Result_s_fu_291_p5 = {{inVal_V_55_out_i[15:8]}, {ap_sig_allocacmp_tmp_data_V_1_load}};

assign tmp_data_V_3_fu_355_p1 = huffStream_0_dout[7:0];

assign tmp_fu_311_p3 = ap_sig_allocacmp_tmp_strobe_V_load_1[32'd1];

assign zext_ln886_fu_345_p1 = ap_sig_allocacmp_tmp_strobe_V_load_1;

endmodule //gzipcMulticoreStreaming_simpleStreamUpsizer_16_64_4_Pipeline_stream_upsizer_main
