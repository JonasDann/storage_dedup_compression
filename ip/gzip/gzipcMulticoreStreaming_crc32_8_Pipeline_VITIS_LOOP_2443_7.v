// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_crc32_8_Pipeline_VITIS_LOOP_2443_7 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        checksumStream94_dout,
        checksumStream94_num_data_valid,
        checksumStream94_fifo_cap,
        checksumStream94_empty_n,
        checksumStream94_read,
        crc_V_4_reload,
        in_data_V_reload,
        tmp_V_19_reload,
        tmp_V_20_out,
        tmp_V_20_out_ap_vld,
        p_ZN2xf8security8internalL7table16E_0_address0,
        p_ZN2xf8security8internalL7table16E_0_ce0,
        p_ZN2xf8security8internalL7table16E_0_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [63:0] checksumStream94_dout;
input  [2:0] checksumStream94_num_data_valid;
input  [2:0] checksumStream94_fifo_cap;
input   checksumStream94_empty_n;
output   checksumStream94_read;
input  [31:0] crc_V_4_reload;
input  [63:0] in_data_V_reload;
input  [4:0] tmp_V_19_reload;
output  [31:0] tmp_V_20_out;
output   tmp_V_20_out_ap_vld;
output  [10:0] p_ZN2xf8security8internalL7table16E_0_address0;
output   p_ZN2xf8security8internalL7table16E_0_ce0;
input  [31:0] p_ZN2xf8security8internalL7table16E_0_q0;

reg ap_idle;
reg checksumStream94_read;
reg tmp_V_20_out_ap_vld;
reg p_ZN2xf8security8internalL7table16E_0_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] icmp_ln1065_reg_379;
reg    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln2443_fu_146_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    checksumStream94_blk_n;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
reg   [4:0] i_V_1_reg_369;
reg   [4:0] i_V_1_reg_369_pp0_iter1_reg;
reg   [0:0] icmp_ln2443_reg_375;
reg   [0:0] icmp_ln2443_reg_375_pp0_iter1_reg;
reg   [0:0] icmp_ln2443_reg_375_pp0_iter2_reg;
wire   [0:0] icmp_ln1065_fu_158_p2;
wire   [6:0] sub_ln357_3_fu_263_p2;
reg   [6:0] sub_ln357_3_reg_383;
wire   [63:0] lshr_ln357_fu_273_p2;
reg   [63:0] lshr_ln357_reg_388;
reg   [23:0] r_V_reg_393;
wire   [63:0] zext_ln1545_1_fu_324_p1;
reg   [31:0] p_Val2_s_fu_72;
wire   [31:0] ret_V_3_fu_332_p2;
reg   [31:0] ap_sig_allocacmp_p_Val2_load_49;
wire    ap_loop_init;
reg   [4:0] i_V_fu_76;
wire   [4:0] i_V_2_fu_152_p2;
reg   [4:0] ap_sig_allocacmp_i_V_1;
reg   [63:0] in_data_V_fu_80;
reg    ap_block_pp0_stage0_01001;
wire   [7:0] Lo_fu_180_p3;
wire   [7:0] Hi_fu_187_p2;
wire   [3:0] trunc_ln598_fu_177_p1;
wire   [6:0] tmp_fu_199_p3;
wire   [6:0] trunc_ln357_1_fu_207_p1;
wire   [0:0] icmp_ln357_fu_193_p2;
wire   [6:0] sub_ln357_fu_221_p2;
wire   [6:0] sub_ln357_2_fu_233_p2;
reg   [63:0] tmp_262_fu_211_p4;
wire   [6:0] sub_ln357_1_fu_227_p2;
wire   [6:0] select_ln357_fu_239_p3;
wire   [6:0] select_ln357_2_fu_255_p3;
wire   [63:0] select_ln357_1_fu_247_p3;
wire   [63:0] zext_ln357_fu_269_p1;
wire   [63:0] zext_ln357_1_fu_296_p1;
wire   [63:0] lshr_ln357_1_fu_299_p2;
wire   [63:0] p_Result_s_fu_305_p2;
wire   [7:0] lhs_V_fu_292_p1;
wire   [10:0] trunc_ln357_2_fu_310_p1;
wire   [10:0] zext_ln1545_fu_314_p1;
wire   [10:0] ret_V_fu_318_p2;
wire   [31:0] zext_ln1715_fu_329_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln2443_fu_146_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_V_fu_76 <= i_V_2_fu_152_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_V_fu_76 <= 5'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            in_data_V_fu_80 <= in_data_V_reload;
        end else if (((icmp_ln1065_reg_379 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            in_data_V_fu_80 <= checksumStream94_dout;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            p_Val2_s_fu_72 <= crc_V_4_reload;
        end else if ((ap_enable_reg_pp0_iter4 == 1'b1)) begin
            p_Val2_s_fu_72 <= ret_V_3_fu_332_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        i_V_1_reg_369 <= ap_sig_allocacmp_i_V_1;
        i_V_1_reg_369_pp0_iter1_reg <= i_V_1_reg_369;
        icmp_ln2443_reg_375 <= icmp_ln2443_fu_146_p2;
        icmp_ln2443_reg_375_pp0_iter1_reg <= icmp_ln2443_reg_375;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        icmp_ln2443_reg_375_pp0_iter2_reg <= icmp_ln2443_reg_375_pp0_iter1_reg;
        lshr_ln357_reg_388 <= lshr_ln357_fu_273_p2;
        r_V_reg_393 <= {{ap_sig_allocacmp_p_Val2_load_49[31:8]}};
        sub_ln357_3_reg_383[6 : 1] <= sub_ln357_3_fu_263_p2[6 : 1];
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln2443_fu_146_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln1065_reg_379 <= icmp_ln1065_fu_158_p2;
    end
end

always @ (*) begin
    if (((icmp_ln2443_fu_146_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
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
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        ap_sig_allocacmp_i_V_1 = 5'd0;
    end else begin
        ap_sig_allocacmp_i_V_1 = i_V_fu_76;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ap_sig_allocacmp_p_Val2_load_49 = ret_V_3_fu_332_p2;
    end else begin
        ap_sig_allocacmp_p_Val2_load_49 = p_Val2_s_fu_72;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (icmp_ln1065_reg_379 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        checksumStream94_blk_n = checksumStream94_empty_n;
    end else begin
        checksumStream94_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1065_reg_379 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        checksumStream94_read = 1'b1;
    end else begin
        checksumStream94_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        p_ZN2xf8security8internalL7table16E_0_ce0 = 1'b1;
    end else begin
        p_ZN2xf8security8internalL7table16E_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln2443_reg_375_pp0_iter2_reg == 1'd1))) begin
        tmp_V_20_out_ap_vld = 1'b1;
    end else begin
        tmp_V_20_out_ap_vld = 1'b0;
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

assign Hi_fu_187_p2 = (8'd7 | Lo_fu_180_p3);

assign Lo_fu_180_p3 = {{i_V_1_reg_369_pp0_iter1_reg}, {3'd0}};

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((icmp_ln1065_reg_379 == 1'd1) & (checksumStream94_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((icmp_ln1065_reg_379 == 1'd1) & (checksumStream94_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((icmp_ln1065_reg_379 == 1'd1) & (checksumStream94_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((icmp_ln1065_reg_379 == 1'd1) & (checksumStream94_empty_n == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign i_V_2_fu_152_p2 = (ap_sig_allocacmp_i_V_1 + 5'd1);

assign icmp_ln1065_fu_158_p2 = ((ap_sig_allocacmp_i_V_1 == 5'd0) ? 1'b1 : 1'b0);

assign icmp_ln2443_fu_146_p2 = ((ap_sig_allocacmp_i_V_1 == tmp_V_19_reload) ? 1'b1 : 1'b0);

assign icmp_ln357_fu_193_p2 = ((Lo_fu_180_p3 > Hi_fu_187_p2) ? 1'b1 : 1'b0);

assign lhs_V_fu_292_p1 = ap_sig_allocacmp_p_Val2_load_49[7:0];

assign lshr_ln357_1_fu_299_p2 = 64'd18446744073709551615 >> zext_ln357_1_fu_296_p1;

assign lshr_ln357_fu_273_p2 = select_ln357_1_fu_247_p3 >> zext_ln357_fu_269_p1;

assign p_Result_s_fu_305_p2 = (lshr_ln357_reg_388 & lshr_ln357_1_fu_299_p2);

assign p_ZN2xf8security8internalL7table16E_0_address0 = zext_ln1545_1_fu_324_p1;

assign ret_V_3_fu_332_p2 = (zext_ln1715_fu_329_p1 ^ p_ZN2xf8security8internalL7table16E_0_q0);

assign ret_V_fu_318_p2 = (zext_ln1545_fu_314_p1 ^ trunc_ln357_2_fu_310_p1);

assign select_ln357_1_fu_247_p3 = ((icmp_ln357_fu_193_p2[0:0] == 1'b1) ? tmp_262_fu_211_p4 : in_data_V_fu_80);

assign select_ln357_2_fu_255_p3 = ((icmp_ln357_fu_193_p2[0:0] == 1'b1) ? sub_ln357_1_fu_227_p2 : tmp_fu_199_p3);

assign select_ln357_fu_239_p3 = ((icmp_ln357_fu_193_p2[0:0] == 1'b1) ? sub_ln357_fu_221_p2 : sub_ln357_2_fu_233_p2);

assign sub_ln357_1_fu_227_p2 = (7'd63 - tmp_fu_199_p3);

assign sub_ln357_2_fu_233_p2 = (trunc_ln357_1_fu_207_p1 - tmp_fu_199_p3);

assign sub_ln357_3_fu_263_p2 = (7'd63 - select_ln357_fu_239_p3);

assign sub_ln357_fu_221_p2 = (tmp_fu_199_p3 - trunc_ln357_1_fu_207_p1);

integer ap_tvar_int_0;

always @ (in_data_V_fu_80) begin
    for (ap_tvar_int_0 = 64 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 63 - 0) begin
            tmp_262_fu_211_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_262_fu_211_p4[ap_tvar_int_0] = in_data_V_fu_80[63 - ap_tvar_int_0];
        end
    end
end

assign tmp_V_20_out = p_Val2_s_fu_72;

assign tmp_fu_199_p3 = {{trunc_ln598_fu_177_p1}, {3'd0}};

assign trunc_ln357_1_fu_207_p1 = Hi_fu_187_p2[6:0];

assign trunc_ln357_2_fu_310_p1 = p_Result_s_fu_305_p2[10:0];

assign trunc_ln598_fu_177_p1 = i_V_1_reg_369_pp0_iter1_reg[3:0];

assign zext_ln1545_1_fu_324_p1 = ret_V_fu_318_p2;

assign zext_ln1545_fu_314_p1 = lhs_V_fu_292_p1;

assign zext_ln1715_fu_329_p1 = r_V_reg_393;

assign zext_ln357_1_fu_296_p1 = sub_ln357_3_reg_383;

assign zext_ln357_fu_269_p1 = select_ln357_2_fu_255_p3;

always @ (posedge ap_clk) begin
    sub_ln357_3_reg_383[0] <= 1'b0;
end

endmodule //gzipcMulticoreStreaming_crc32_8_Pipeline_VITIS_LOOP_2443_7
