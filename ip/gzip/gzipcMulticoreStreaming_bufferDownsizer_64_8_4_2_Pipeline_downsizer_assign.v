// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module gzipcMulticoreStreaming_bufferDownsizer_64_8_4_2_Pipeline_downsizer_assign (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        distStream_2_dout,
        distStream_2_num_data_valid,
        distStream_2_fifo_cap,
        distStream_2_empty_n,
        distStream_2_read,
        downStream_2_din,
        downStream_2_num_data_valid,
        downStream_2_fifo_cap,
        downStream_2_full_n,
        downStream_2_write,
        outVal_data_V,
        inVal_V_72,
        inSize_V_24,
        zext_ln1541,
        outVal_data_V_42_out,
        outVal_data_V_42_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [67:0] distStream_2_dout;
input  [9:0] distStream_2_num_data_valid;
input  [9:0] distStream_2_fifo_cap;
input   distStream_2_empty_n;
output   distStream_2_read;
output  [8:0] downStream_2_din;
input  [5:0] downStream_2_num_data_valid;
input  [5:0] downStream_2_fifo_cap;
input   downStream_2_full_n;
output   downStream_2_write;
input  [7:0] outVal_data_V;
input  [67:0] inVal_V_72;
input  [3:0] inSize_V_24;
input  [3:0] zext_ln1541;
output  [7:0] outVal_data_V_42_out;
output   outVal_data_V_42_out_ap_vld;

reg ap_idle;
reg distStream_2_read;
reg downStream_2_write;
reg outVal_data_V_42_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire   [0:0] icmp_ln1081_fu_168_p2;
wire   [0:0] icmp_ln1065_fu_190_p2;
reg    ap_predicate_op34_read_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    downStream_2_blk_n;
wire    ap_block_pp0_stage0;
reg    distStream_2_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln1065_reg_318;
reg   [67:0] inVal_V_32_reg_322;
reg   [3:0] dsize_V_fu_72;
wire   [3:0] dsize_V_24_fu_180_p2;
wire    ap_loop_init;
reg   [67:0] p_Val2_s_fu_76;
wire   [67:0] zext_ln1044_fu_247_p1;
reg   [7:0] outVal_data_V_42_fu_80;
wire   [7:0] outVal_data_V_43_fu_227_p4;
reg   [34:0] outSizeV_V_fu_84;
wire   [34:0] zext_ln1541_6_fu_205_p1;
wire   [34:0] zext_ln1541_cast_fu_136_p1;
reg   [3:0] inSize_V_16_fu_88;
wire   [3:0] inSize_V_23_fu_201_p1;
reg    ap_block_pp0_stage0_01001;
wire   [34:0] zext_ln1065_fu_186_p1;
wire   [59:0] inVal_V_fu_237_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
reg    ap_condition_242;
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
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1065_fu_190_p2 == 1'd1) & (icmp_ln1081_fu_168_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1)))) begin
        dsize_V_fu_72 <= 4'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1065_fu_190_p2 == 1'd0) & (icmp_ln1081_fu_168_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dsize_V_fu_72 <= dsize_V_24_fu_180_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            inSize_V_16_fu_88 <= inSize_V_24;
        end else if ((1'b1 == ap_condition_242)) begin
            inSize_V_16_fu_88 <= inSize_V_23_fu_201_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
                        outSizeV_V_fu_84[3 : 0] <= zext_ln1541_cast_fu_136_p1[3 : 0];
        end else if ((1'b1 == ap_condition_242)) begin
                        outSizeV_V_fu_84[3 : 0] <= zext_ln1541_6_fu_205_p1[3 : 0];
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            outVal_data_V_42_fu_80 <= outVal_data_V;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            outVal_data_V_42_fu_80 <= {{p_Val2_s_fu_76[11:4]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            p_Val2_s_fu_76 <= inVal_V_72;
        end else if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln1065_reg_318 == 1'd1))) begin
            p_Val2_s_fu_76 <= inVal_V_32_reg_322;
        end else if (((ap_enable_reg_pp0_iter2 == 1'b1) & (icmp_ln1065_reg_318 == 1'd0))) begin
            p_Val2_s_fu_76 <= zext_ln1044_fu_247_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1081_fu_168_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln1065_reg_318 <= icmp_ln1065_fu_190_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op34_read_state2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        inVal_V_32_reg_322 <= distStream_2_dout;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln1081_fu_168_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
        distStream_2_blk_n = distStream_2_empty_n;
    end else begin
        distStream_2_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op34_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        distStream_2_read = 1'b1;
    end else begin
        distStream_2_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        downStream_2_blk_n = downStream_2_full_n;
    end else begin
        downStream_2_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        downStream_2_write = 1'b1;
    end else begin
        downStream_2_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1081_fu_168_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        outVal_data_V_42_out_ap_vld = 1'b1;
    end else begin
        outVal_data_V_42_out_ap_vld = 1'b0;
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
    ap_block_pp0_stage0_01001 = (((downStream_2_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_predicate_op34_read_state2 == 1'b1) & (distStream_2_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((downStream_2_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_predicate_op34_read_state2 == 1'b1) & (distStream_2_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((downStream_2_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_predicate_op34_read_state2 == 1'b1) & (distStream_2_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op34_read_state2 == 1'b1) & (distStream_2_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = (downStream_2_full_n == 1'b0);
end

always @ (*) begin
    ap_condition_242 = ((icmp_ln1065_fu_190_p2 == 1'd1) & (icmp_ln1081_fu_168_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

always @ (*) begin
    ap_predicate_op34_read_state2 = ((icmp_ln1065_fu_190_p2 == 1'd1) & (icmp_ln1081_fu_168_p2 == 1'd0));
end

assign downStream_2_din = {{1'd1}, {outVal_data_V_43_fu_227_p4}};

assign dsize_V_24_fu_180_p2 = (dsize_V_fu_72 + 4'd1);

assign icmp_ln1065_fu_190_p2 = ((zext_ln1065_fu_186_p1 == outSizeV_V_fu_84) ? 1'b1 : 1'b0);

assign icmp_ln1081_fu_168_p2 = ((inSize_V_16_fu_88 == 4'd0) ? 1'b1 : 1'b0);

assign inSize_V_23_fu_201_p1 = distStream_2_dout[3:0];

assign inVal_V_fu_237_p4 = {{p_Val2_s_fu_76[67:8]}};

assign outVal_data_V_42_out = outVal_data_V_42_fu_80;

assign outVal_data_V_43_fu_227_p4 = {{p_Val2_s_fu_76[11:4]}};

assign zext_ln1044_fu_247_p1 = inVal_V_fu_237_p4;

assign zext_ln1065_fu_186_p1 = dsize_V_24_fu_180_p2;

assign zext_ln1541_6_fu_205_p1 = inSize_V_23_fu_201_p1;

assign zext_ln1541_cast_fu_136_p1 = zext_ln1541;

always @ (posedge ap_clk) begin
    outSizeV_V_fu_84[34:4] <= 31'b0000000000000000000000000000000;
end

endmodule //gzipcMulticoreStreaming_bufferDownsizer_64_8_4_2_Pipeline_downsizer_assign
