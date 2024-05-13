// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_bitPackingStatic_60_Pipeline_bitpack (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        hufCodeStream_dout,
        hufCodeStream_num_data_valid,
        hufCodeStream_fifo_cap,
        hufCodeStream_empty_n,
        hufCodeStream_read,
        huffStream_6_din,
        huffStream_6_num_data_valid,
        huffStream_6_fifo_cap,
        huffStream_6_full_n,
        huffStream_6_write,
        empty,
        outValue_data_V,
        outValue_data_V_140_out,
        outValue_data_V_140_out_ap_vld,
        outValue_data_V_139_out,
        outValue_data_V_139_out_ap_vld,
        localBits_V_7_out,
        localBits_V_7_out_ap_vld,
        last_block_out,
        last_block_out_ap_vld,
        localBits_idx_out,
        localBits_idx_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [19:0] hufCodeStream_dout;
input  [2:0] hufCodeStream_num_data_valid;
input  [2:0] hufCodeStream_fifo_cap;
input   hufCodeStream_empty_n;
output   hufCodeStream_read;
output  [17:0] huffStream_6_din;
input  [2:0] huffStream_6_num_data_valid;
input  [2:0] huffStream_6_fifo_cap;
input   huffStream_6_full_n;
output   huffStream_6_write;
input  [19:0] empty;
input  [7:0] outValue_data_V;
output  [7:0] outValue_data_V_140_out;
output   outValue_data_V_140_out_ap_vld;
output  [7:0] outValue_data_V_139_out;
output   outValue_data_V_139_out_ap_vld;
output  [31:0] localBits_V_7_out;
output   localBits_V_7_out_ap_vld;
output  [0:0] last_block_out;
output   last_block_out_ap_vld;
output  [7:0] localBits_idx_out;
output   localBits_idx_out_ap_vld;

reg ap_idle;
reg hufCodeStream_read;
reg huffStream_6_write;
reg outValue_data_V_140_out_ap_vld;
reg outValue_data_V_139_out_ap_vld;
reg localBits_V_7_out_ap_vld;
reg last_block_out_ap_vld;
reg localBits_idx_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire   [0:0] inValue_strobe_V_fu_217_p3;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
reg   [0:0] icmp_ln57_reg_591;
reg   [0:0] icmp_ln57_reg_591_pp0_iter1_reg;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    hufCodeStream_blk_n;
wire    ap_block_pp0_stage0;
reg    huffStream_6_blk_n;
reg   [0:0] last_block_reg_176;
reg   [19:0] inValue_data_bitlen_sroa_0_0_391_in_in_in_load_reg_560;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] inValue_strobe_V_reg_565;
reg   [0:0] inValue_strobe_V_reg_565_pp0_iter1_reg;
wire   [0:0] icmp_ln390_fu_274_p2;
reg   [0:0] icmp_ln390_reg_569;
wire   [5:0] trunc_ln390_fu_280_p1;
reg   [5:0] trunc_ln390_reg_577;
wire   [5:0] trunc_ln390_3_fu_284_p1;
reg   [5:0] trunc_ln390_3_reg_585;
wire   [0:0] icmp_ln57_fu_304_p2;
wire   [15:0] trunc_ln174_fu_473_p1;
reg   [15:0] trunc_ln174_reg_595;
reg   [0:0] ap_phi_mux_last_block_phi_fu_180_p4;
wire    ap_loop_init;
reg   [7:0] localBits_idx_fu_96;
wire   [7:0] localBits_idx_16_fu_310_p2;
wire   [7:0] localBits_idx_15_fu_288_p2;
reg   [7:0] ap_sig_allocacmp_localBits_idx_load;
reg   [31:0] p_Val2_s_fu_100;
wire   [31:0] zext_ln1044_fu_455_p1;
wire   [31:0] p_Result_s_fu_439_p2;
reg   [19:0] inValue_data_bitlen_sroa_0_0_391_in_in_in_fu_104;
reg   [19:0] ap_sig_allocacmp_inValue_data_bitlen_sroa_0_0_391_in_in_in_load;
reg   [7:0] outValue_data_V_56_fu_108;
wire   [7:0] outValue_data_V_58_fu_459_p1;
reg   [7:0] outValue_data_V_57_fu_112;
reg    ap_block_pp0_stage0_01001;
wire   [3:0] trunc_ln_fu_228_p4;
wire   [8:0] zext_ln54_5_fu_246_p1;
wire   [8:0] zext_ln54_fu_238_p1;
wire   [8:0] add_ln54_fu_254_p2;
wire   [9:0] zext_ln54_7_fu_260_p1;
wire  signed [9:0] add_ln54_2_fu_264_p2;
wire   [31:0] zext_ln54_2_fu_242_p1;
wire  signed [31:0] sext_ln259_fu_270_p1;
wire   [7:0] zext_ln54_6_fu_250_p1;
wire   [3:0] tmp_281_fu_294_p4;
wire   [14:0] tmp_282_fu_334_p1;
wire   [5:0] sub_ln390_fu_341_p2;
wire   [5:0] select_ln390_fu_346_p3;
wire   [5:0] select_ln390_8_fu_356_p3;
wire   [5:0] select_ln390_7_fu_351_p3;
wire   [5:0] sub_ln390_3_fu_362_p2;
wire   [31:0] zext_ln259_fu_337_p1;
wire   [31:0] zext_ln390_fu_368_p1;
wire   [31:0] shl_ln390_fu_380_p2;
reg   [31:0] tmp_280_fu_386_p4;
wire   [31:0] zext_ln390_5_fu_372_p1;
wire   [31:0] zext_ln390_6_fu_376_p1;
wire   [31:0] shl_ln390_3_fu_403_p2;
wire   [31:0] lshr_ln390_fu_409_p2;
wire   [31:0] and_ln390_fu_415_p2;
wire   [31:0] xor_ln390_fu_421_p2;
wire   [31:0] select_ln390_9_fu_396_p3;
wire   [31:0] and_ln390_5_fu_427_p2;
wire   [31:0] and_ln390_6_fu_433_p2;
wire   [15:0] localBits_V_2_fu_445_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_394;
reg    ap_condition_397;
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((inValue_strobe_V_fu_217_p3 == 1'd1) & (ap_start_int == 1'b1))) begin
            inValue_data_bitlen_sroa_0_0_391_in_in_in_fu_104 <= hufCodeStream_dout;
        end else if ((ap_loop_init == 1'b1)) begin
            inValue_data_bitlen_sroa_0_0_391_in_in_in_fu_104 <= empty;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1) & (inValue_strobe_V_reg_565_pp0_iter1_reg == 1'd1))) begin
        last_block_reg_176 <= 1'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        last_block_reg_176 <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_397)) begin
            localBits_idx_fu_96 <= localBits_idx_15_fu_288_p2;
        end else if ((1'b1 == ap_condition_394)) begin
            localBits_idx_fu_96 <= localBits_idx_16_fu_310_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            localBits_idx_fu_96 <= 8'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            outValue_data_V_56_fu_108 <= 8'd0;
        end else if (((icmp_ln57_reg_591 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            outValue_data_V_56_fu_108 <= outValue_data_V_58_fu_459_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            outValue_data_V_57_fu_112 <= outValue_data_V;
        end else if (((icmp_ln57_reg_591 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            outValue_data_V_57_fu_112 <= {{p_Result_s_fu_439_p2[15:8]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            p_Val2_s_fu_100 <= 32'd0;
        end else if (((icmp_ln57_reg_591 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            p_Val2_s_fu_100 <= p_Result_s_fu_439_p2;
        end else if (((icmp_ln57_reg_591 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            p_Val2_s_fu_100 <= zext_ln1044_fu_455_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        icmp_ln57_reg_591_pp0_iter1_reg <= icmp_ln57_reg_591;
        inValue_data_bitlen_sroa_0_0_391_in_in_in_load_reg_560 <= ap_sig_allocacmp_inValue_data_bitlen_sroa_0_0_391_in_in_in_load;
        inValue_strobe_V_reg_565 <= ap_sig_allocacmp_inValue_data_bitlen_sroa_0_0_391_in_in_in_load[32'd19];
        inValue_strobe_V_reg_565_pp0_iter1_reg <= inValue_strobe_V_reg_565;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (inValue_strobe_V_fu_217_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln390_reg_569 <= icmp_ln390_fu_274_p2;
        icmp_ln57_reg_591 <= icmp_ln57_fu_304_p2;
        trunc_ln390_3_reg_585 <= trunc_ln390_3_fu_284_p1;
        trunc_ln390_reg_577 <= trunc_ln390_fu_280_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln57_reg_591 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        trunc_ln174_reg_595 <= trunc_ln174_fu_473_p1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (inValue_strobe_V_fu_217_p3 == 1'd0) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (inValue_strobe_V_reg_565_pp0_iter1_reg == 1'd1))) begin
        ap_phi_mux_last_block_phi_fu_180_p4 = 1'd0;
    end else begin
        ap_phi_mux_last_block_phi_fu_180_p4 = last_block_reg_176;
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
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_inValue_data_bitlen_sroa_0_0_391_in_in_in_load = empty;
    end else begin
        ap_sig_allocacmp_inValue_data_bitlen_sroa_0_0_391_in_in_in_load = inValue_data_bitlen_sroa_0_0_391_in_in_in_fu_104;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_localBits_idx_load = 8'd0;
    end else begin
        ap_sig_allocacmp_localBits_idx_load = localBits_idx_fu_96;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (inValue_strobe_V_fu_217_p3 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        hufCodeStream_blk_n = hufCodeStream_empty_n;
    end else begin
        hufCodeStream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (inValue_strobe_V_fu_217_p3 == 1'd1) & (ap_start_int == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        hufCodeStream_read = 1'b1;
    end else begin
        hufCodeStream_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln57_reg_591_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        huffStream_6_blk_n = huffStream_6_full_n;
    end else begin
        huffStream_6_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln57_reg_591_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        huffStream_6_write = 1'b1;
    end else begin
        huffStream_6_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (inValue_strobe_V_reg_565 == 1'd0))) begin
        last_block_out_ap_vld = 1'b1;
    end else begin
        last_block_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (inValue_strobe_V_reg_565 == 1'd0))) begin
        localBits_V_7_out_ap_vld = 1'b1;
    end else begin
        localBits_V_7_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (inValue_strobe_V_reg_565 == 1'd0))) begin
        localBits_idx_out_ap_vld = 1'b1;
    end else begin
        localBits_idx_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (inValue_strobe_V_reg_565 == 1'd0))) begin
        outValue_data_V_139_out_ap_vld = 1'b1;
    end else begin
        outValue_data_V_139_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (inValue_strobe_V_reg_565 == 1'd0))) begin
        outValue_data_V_140_out_ap_vld = 1'b1;
    end else begin
        outValue_data_V_140_out_ap_vld = 1'b0;
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

assign add_ln54_2_fu_264_p2 = ($signed(zext_ln54_7_fu_260_p1) + $signed(10'd1023));

assign add_ln54_fu_254_p2 = (zext_ln54_5_fu_246_p1 + zext_ln54_fu_238_p1);

assign and_ln390_5_fu_427_p2 = (xor_ln390_fu_421_p2 & p_Val2_s_fu_100);

assign and_ln390_6_fu_433_p2 = (select_ln390_9_fu_396_p3 & and_ln390_fu_415_p2);

assign and_ln390_fu_415_p2 = (shl_ln390_3_fu_403_p2 & lshr_ln390_fu_409_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((icmp_ln57_reg_591_pp0_iter1_reg == 1'd0) & (huffStream_6_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((inValue_strobe_V_fu_217_p3 == 1'd1) & (hufCodeStream_empty_n == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((icmp_ln57_reg_591_pp0_iter1_reg == 1'd0) & (huffStream_6_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((inValue_strobe_V_fu_217_p3 == 1'd1) & (hufCodeStream_empty_n == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((icmp_ln57_reg_591_pp0_iter1_reg == 1'd0) & (huffStream_6_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((inValue_strobe_V_fu_217_p3 == 1'd1) & (hufCodeStream_empty_n == 1'b0) & (ap_start_int == 1'b1)));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((inValue_strobe_V_fu_217_p3 == 1'd1) & (hufCodeStream_empty_n == 1'b0));
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((icmp_ln57_reg_591_pp0_iter1_reg == 1'd0) & (huffStream_6_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_394 = ((inValue_strobe_V_fu_217_p3 == 1'd1) & (ap_start_int == 1'b1) & (icmp_ln57_fu_304_p2 == 1'd0));
end

always @ (*) begin
    ap_condition_397 = ((inValue_strobe_V_fu_217_p3 == 1'd1) & (ap_start_int == 1'b1) & (icmp_ln57_fu_304_p2 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign huffStream_6_din = {{2'd2}, {trunc_ln174_reg_595}};

assign icmp_ln390_fu_274_p2 = ((zext_ln54_2_fu_242_p1 > sext_ln259_fu_270_p1) ? 1'b1 : 1'b0);

assign icmp_ln57_fu_304_p2 = ((tmp_281_fu_294_p4 == 4'd0) ? 1'b1 : 1'b0);

assign inValue_strobe_V_fu_217_p3 = ap_sig_allocacmp_inValue_data_bitlen_sroa_0_0_391_in_in_in_load[32'd19];

assign last_block_out = ap_phi_mux_last_block_phi_fu_180_p4;

assign localBits_V_2_fu_445_p4 = {{p_Result_s_fu_439_p2[31:16]}};

assign localBits_V_7_out = p_Val2_s_fu_100;

assign localBits_idx_15_fu_288_p2 = (ap_sig_allocacmp_localBits_idx_load + zext_ln54_6_fu_250_p1);

assign localBits_idx_16_fu_310_p2 = ($signed(localBits_idx_15_fu_288_p2) + $signed(8'd240));

assign localBits_idx_out = localBits_idx_fu_96;

assign lshr_ln390_fu_409_p2 = 32'd4294967295 >> zext_ln390_6_fu_376_p1;

assign outValue_data_V_139_out = outValue_data_V_56_fu_108;

assign outValue_data_V_140_out = outValue_data_V_57_fu_112;

assign outValue_data_V_58_fu_459_p1 = p_Result_s_fu_439_p2[7:0];

assign p_Result_s_fu_439_p2 = (and_ln390_6_fu_433_p2 | and_ln390_5_fu_427_p2);

assign select_ln390_7_fu_351_p3 = ((icmp_ln390_reg_569[0:0] == 1'b1) ? trunc_ln390_3_reg_585 : trunc_ln390_reg_577);

assign select_ln390_8_fu_356_p3 = ((icmp_ln390_reg_569[0:0] == 1'b1) ? sub_ln390_fu_341_p2 : trunc_ln390_reg_577);

assign select_ln390_9_fu_396_p3 = ((icmp_ln390_reg_569[0:0] == 1'b1) ? tmp_280_fu_386_p4 : shl_ln390_fu_380_p2);

assign select_ln390_fu_346_p3 = ((icmp_ln390_reg_569[0:0] == 1'b1) ? trunc_ln390_reg_577 : trunc_ln390_3_reg_585);

assign sext_ln259_fu_270_p1 = add_ln54_2_fu_264_p2;

assign shl_ln390_3_fu_403_p2 = 32'd4294967295 << zext_ln390_5_fu_372_p1;

assign shl_ln390_fu_380_p2 = zext_ln259_fu_337_p1 << zext_ln390_fu_368_p1;

assign sub_ln390_3_fu_362_p2 = (6'd31 - select_ln390_fu_346_p3);

assign sub_ln390_fu_341_p2 = (6'd31 - trunc_ln390_reg_577);

integer ap_tvar_int_0;

always @ (shl_ln390_fu_380_p2) begin
    for (ap_tvar_int_0 = 32 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 31 - 0) begin
            tmp_280_fu_386_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_280_fu_386_p4[ap_tvar_int_0] = shl_ln390_fu_380_p2[31 - ap_tvar_int_0];
        end
    end
end

assign tmp_281_fu_294_p4 = {{localBits_idx_15_fu_288_p2[7:4]}};

assign tmp_282_fu_334_p1 = inValue_data_bitlen_sroa_0_0_391_in_in_in_load_reg_560[14:0];

assign trunc_ln174_fu_473_p1 = p_Result_s_fu_439_p2[15:0];

assign trunc_ln390_3_fu_284_p1 = add_ln54_2_fu_264_p2[5:0];

assign trunc_ln390_fu_280_p1 = ap_sig_allocacmp_localBits_idx_load[5:0];

assign trunc_ln_fu_228_p4 = {{ap_sig_allocacmp_inValue_data_bitlen_sroa_0_0_391_in_in_in_load[18:15]}};

assign xor_ln390_fu_421_p2 = (32'd4294967295 ^ and_ln390_fu_415_p2);

assign zext_ln1044_fu_455_p1 = localBits_V_2_fu_445_p4;

assign zext_ln259_fu_337_p1 = tmp_282_fu_334_p1;

assign zext_ln390_5_fu_372_p1 = select_ln390_7_fu_351_p3;

assign zext_ln390_6_fu_376_p1 = sub_ln390_3_fu_362_p2;

assign zext_ln390_fu_368_p1 = select_ln390_8_fu_356_p3;

assign zext_ln54_2_fu_242_p1 = ap_sig_allocacmp_localBits_idx_load;

assign zext_ln54_5_fu_246_p1 = ap_sig_allocacmp_localBits_idx_load;

assign zext_ln54_6_fu_250_p1 = trunc_ln_fu_228_p4;

assign zext_ln54_7_fu_260_p1 = add_ln54_fu_254_p2;

assign zext_ln54_fu_238_p1 = trunc_ln_fu_228_p4;

endmodule //gzipcMulticoreStreaming_bitPackingStatic_60_Pipeline_bitpack
