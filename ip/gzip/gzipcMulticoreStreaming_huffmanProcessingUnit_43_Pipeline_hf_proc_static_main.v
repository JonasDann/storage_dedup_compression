// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_huffmanProcessingUnit_43_Pipeline_hf_proc_static_main (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        lz77Stream_1_dout,
        lz77Stream_1_num_data_valid,
        lz77Stream_1_fifo_cap,
        lz77Stream_1_empty_n,
        lz77Stream_1_read,
        encodedOutStream_din,
        encodedOutStream_num_data_valid,
        encodedOutStream_fifo_cap,
        encodedOutStream_full_n,
        encodedOutStream_write,
        empty,
        outValue_data_V_120_out,
        outValue_data_V_120_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [9:0] lz77Stream_1_dout;
input  [2:0] lz77Stream_1_num_data_valid;
input  [2:0] lz77Stream_1_fifo_cap;
input   lz77Stream_1_empty_n;
output   lz77Stream_1_read;
output  [32:0] encodedOutStream_din;
input  [2:0] encodedOutStream_num_data_valid;
input  [2:0] encodedOutStream_fifo_cap;
input   encodedOutStream_full_n;
output   encodedOutStream_write;
input  [8:0] empty;
output  [31:0] outValue_data_V_120_out;
output   outValue_data_V_120_out_ap_vld;

reg ap_idle;
reg lz77Stream_1_read;
reg encodedOutStream_write;
reg outValue_data_V_120_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state2_pp0_stage0_iter1;
reg   [31:0] next_state_load_reg_343;
reg   [0:0] tokenFlag_reg_347;
reg    ap_predicate_op59_write_state3;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] tmp_strobe_V_fu_171_p3;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    lz77Stream_1_blk_n;
wire    ap_block_pp0_stage0;
reg    encodedOutStream_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [31:0] next_state_load_load_fu_156_p1;
wire   [0:0] tokenFlag_fu_159_p3;
reg   [0:0] tmp_strobe_V_reg_351;
wire   [31:0] p_Result_72_fu_183_p5;
wire   [31:0] p_Result_71_fu_235_p5;
wire   [31:0] ap_phi_reg_pp0_iter0_outValue_data_V_40_reg_112;
reg   [31:0] ap_phi_reg_pp0_iter1_outValue_data_V_40_reg_112;
reg   [31:0] ap_phi_reg_pp0_iter2_outValue_data_V_40_reg_112;
reg   [8:0] inValue_V_in_in_in_fu_70;
wire   [8:0] trunc_ln145_fu_167_p1;
wire    ap_loop_init;
reg   [0:0] outValue_strobe_V_fu_74;
wire   [0:0] grp_fu_127_p2;
reg   [31:0] next_state_fu_78;
reg   [31:0] p_Val2_s_fu_82;
wire   [31:0] p_Result_70_fu_204_p5;
wire   [31:0] p_Result_s_fu_265_p5;
reg    ap_block_pp0_stage0_01001;
wire   [7:0] trunc_ln414_8_fu_179_p1;
wire   [7:0] trunc_ln414_fu_200_p1;
wire   [7:0] trunc_ln674_fu_231_p1;
wire   [15:0] tmp_fu_257_p3;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_124;
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
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
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_loop_exit_ready == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_124)) begin
        if ((next_state_load_load_fu_156_p1 == 32'd3)) begin
            ap_phi_reg_pp0_iter2_outValue_data_V_40_reg_112 <= p_Result_72_fu_183_p5;
        end else if (((tokenFlag_fu_159_p3 == 1'd0) & (next_state_load_load_fu_156_p1 == 32'd0))) begin
            ap_phi_reg_pp0_iter2_outValue_data_V_40_reg_112 <= p_Result_71_fu_235_p5;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter2_outValue_data_V_40_reg_112 <= ap_phi_reg_pp0_iter1_outValue_data_V_40_reg_112;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            inValue_V_in_in_in_fu_70 <= empty;
        end else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            inValue_V_in_in_in_fu_70 <= trunc_ln145_fu_167_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tokenFlag_fu_159_p3 == 1'd1) & (next_state_load_load_fu_156_p1 == 32'd0))) begin
                next_state_fu_78[0] <= 1'b0;
        next_state_fu_78[1] <= 1'b1;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & ((next_state_load_load_fu_156_p1 == 32'd3) | ((tokenFlag_fu_159_p3 == 1'd0) & (next_state_load_load_fu_156_p1 == 32'd0)))) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1)))) begin
                next_state_fu_78[0] <= 1'b0;
        next_state_fu_78[1] <= 1'b0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (next_state_load_load_fu_156_p1 == 32'd2))) begin
                next_state_fu_78[0] <= 1'b1;
        next_state_fu_78[1] <= 1'b1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
        outValue_strobe_V_fu_74 <= 1'd1;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (next_state_load_load_fu_156_p1 == 32'd2)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (next_state_load_load_fu_156_p1 == 32'd3)))) begin
        outValue_strobe_V_fu_74 <= grp_fu_127_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tokenFlag_fu_159_p3 == 1'd1) & (next_state_load_load_fu_156_p1 == 32'd0))) begin
        p_Val2_s_fu_82 <= p_Result_s_fu_265_p5;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & ((next_state_load_load_fu_156_p1 == 32'd3) | ((tokenFlag_fu_159_p3 == 1'd0) & (next_state_load_load_fu_156_p1 == 32'd0)))) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1)))) begin
        p_Val2_s_fu_82 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (next_state_load_load_fu_156_p1 == 32'd2))) begin
        p_Val2_s_fu_82 <= p_Result_70_fu_204_p5;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_reg_pp0_iter1_outValue_data_V_40_reg_112 <= ap_phi_reg_pp0_iter0_outValue_data_V_40_reg_112;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        next_state_load_reg_343[1 : 0] <= next_state_fu_78[1 : 0];
        tmp_strobe_V_reg_351 <= lz77Stream_1_dout[32'd9];
        tokenFlag_reg_347 <= inValue_V_in_in_in_fu_70[32'd8];
    end
end

always @ (*) begin
    if (((tmp_strobe_V_fu_171_p3 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op59_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        encodedOutStream_blk_n = encodedOutStream_full_n;
    end else begin
        encodedOutStream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op59_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        encodedOutStream_write = 1'b1;
    end else begin
        encodedOutStream_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lz77Stream_1_blk_n = lz77Stream_1_empty_n;
    end else begin
        lz77Stream_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        lz77Stream_1_read = 1'b1;
    end else begin
        lz77Stream_1_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_strobe_V_reg_351 == 1'd0))) begin
        outValue_data_V_120_out_ap_vld = 1'b1;
    end else begin
        outValue_data_V_120_out_ap_vld = 1'b0;
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
    ap_block_pp0_stage0_01001 = (((ap_predicate_op59_write_state3 == 1'b1) & (encodedOutStream_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((lz77Stream_1_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_predicate_op59_write_state3 == 1'b1) & (encodedOutStream_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((lz77Stream_1_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_predicate_op59_write_state3 == 1'b1) & (encodedOutStream_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((lz77Stream_1_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (lz77Stream_1_empty_n == 1'b0);
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((ap_predicate_op59_write_state3 == 1'b1) & (encodedOutStream_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_124 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_phi_reg_pp0_iter0_outValue_data_V_40_reg_112 = 'bx;

always @ (*) begin
    ap_predicate_op59_write_state3 = ((next_state_load_reg_343 == 32'd3) | ((tokenFlag_reg_347 == 1'd0) & (next_state_load_reg_343 == 32'd0)));
end

assign encodedOutStream_din = {{outValue_strobe_V_fu_74}, {ap_phi_reg_pp0_iter2_outValue_data_V_40_reg_112}};

assign grp_fu_127_p2 = (outValue_strobe_V_fu_74 ^ 1'd1);

assign next_state_load_load_fu_156_p1 = next_state_fu_78;

assign outValue_data_V_120_out = p_Val2_s_fu_82;

assign p_Result_70_fu_204_p5 = {{p_Val2_s_fu_82[31:24]}, {trunc_ln414_fu_200_p1}, {p_Val2_s_fu_82[15:0]}};

assign p_Result_71_fu_235_p5 = {{p_Val2_s_fu_82[31:8]}, {trunc_ln674_fu_231_p1}};

assign p_Result_72_fu_183_p5 = {{trunc_ln414_8_fu_179_p1}, {p_Val2_s_fu_82[23:0]}};

assign p_Result_s_fu_265_p5 = {{p_Val2_s_fu_82[31:16]}, {tmp_fu_257_p3}};

assign tmp_fu_257_p3 = {{trunc_ln674_fu_231_p1}, {8'd0}};

assign tmp_strobe_V_fu_171_p3 = lz77Stream_1_dout[32'd9];

assign tokenFlag_fu_159_p3 = inValue_V_in_in_in_fu_70[32'd8];

assign trunc_ln145_fu_167_p1 = lz77Stream_1_dout[8:0];

assign trunc_ln414_8_fu_179_p1 = inValue_V_in_in_in_fu_70[7:0];

assign trunc_ln414_fu_200_p1 = inValue_V_in_in_in_fu_70[7:0];

assign trunc_ln674_fu_231_p1 = inValue_V_in_in_in_fu_70[7:0];

always @ (posedge ap_clk) begin
    next_state_load_reg_343[31:2] <= 30'b000000000000000000000000000000;
    next_state_fu_78[31:2] <= 30'b000000000000000000000000000000;
end

endmodule //gzipcMulticoreStreaming_huffmanProcessingUnit_43_Pipeline_hf_proc_static_main
