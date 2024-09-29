-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity gzipcMulticoreStreaming_lzCompress_Pipeline_lz_fill_present_win_3 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    downStream_4_dout : IN STD_LOGIC_VECTOR (8 downto 0);
    downStream_4_num_data_valid : IN STD_LOGIC_VECTOR (5 downto 0);
    downStream_4_fifo_cap : IN STD_LOGIC_VECTOR (5 downto 0);
    downStream_4_empty_n : IN STD_LOGIC;
    downStream_4_read : OUT STD_LOGIC;
    present_window_64 : IN STD_LOGIC_VECTOR (7 downto 0);
    present_window_63 : IN STD_LOGIC_VECTOR (7 downto 0);
    present_window_62 : IN STD_LOGIC_VECTOR (7 downto 0);
    present_window_61 : IN STD_LOGIC_VECTOR (7 downto 0);
    present_window : IN STD_LOGIC_VECTOR (7 downto 0);
    empty : IN STD_LOGIC_VECTOR (7 downto 0);
    present_window_69_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    present_window_69_out_ap_vld : OUT STD_LOGIC;
    present_window_68_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    present_window_68_out_ap_vld : OUT STD_LOGIC;
    present_window_67_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    present_window_67_out_ap_vld : OUT STD_LOGIC;
    present_window_66_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    present_window_66_out_ap_vld : OUT STD_LOGIC;
    present_window_65_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    present_window_65_out_ap_vld : OUT STD_LOGIC;
    tmp_data_V_66_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    tmp_data_V_66_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of gzipcMulticoreStreaming_lzCompress_Pipeline_lz_fill_present_win_3 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv3_2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_const_lv3_3 : STD_LOGIC_VECTOR (2 downto 0) := "011";
    constant ap_const_lv3_5 : STD_LOGIC_VECTOR (2 downto 0) := "101";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal icmp_ln253_reg_342 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln253_fu_214_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal downStream_4_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal iIdx_5_reg_338 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal iIdx_fu_64 : STD_LOGIC_VECTOR (2 downto 0);
    signal add_ln257_fu_220_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_iIdx_5 : STD_LOGIC_VECTOR (2 downto 0);
    signal present_window_33_fu_68 : STD_LOGIC_VECTOR (7 downto 0);
    signal present_window_34_fu_72 : STD_LOGIC_VECTOR (7 downto 0);
    signal present_window_35_fu_76 : STD_LOGIC_VECTOR (7 downto 0);
    signal present_window_36_fu_80 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln257_fu_235_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal present_window_37_fu_84 : STD_LOGIC_VECTOR (7 downto 0);
    signal present_window_38_fu_88 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_condition_216 : BOOLEAN;
    signal ap_condition_219 : BOOLEAN;
    signal ap_condition_222 : BOOLEAN;
    signal ap_condition_226 : BOOLEAN;
    signal ap_condition_232 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component gzipcMulticoreStreaming_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component gzipcMulticoreStreaming_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_loop_exit_ready_pp0_iter1_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then
                if (((ap_loop_exit_ready = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_loop_exit_ready_pp0_iter1_reg <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then 
                    ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                end if;
            end if; 
        end if;
    end process;

    iIdx_fu_64_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln253_fu_214_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    iIdx_fu_64 <= add_ln257_fu_220_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    iIdx_fu_64 <= ap_const_lv3_0;
                end if;
            end if; 
        end if;
    end process;

    present_window_33_fu_68_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    present_window_33_fu_68 <= present_window;
                elsif ((ap_const_boolean_1 = ap_condition_216)) then 
                    present_window_33_fu_68 <= present_window_36_fu_80;
                end if;
            end if; 
        end if;
    end process;

    present_window_34_fu_72_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    present_window_34_fu_72 <= present_window_61;
                elsif ((ap_const_boolean_1 = ap_condition_219)) then 
                    present_window_34_fu_72 <= present_window_36_fu_80;
                end if;
            end if; 
        end if;
    end process;

    present_window_35_fu_76_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    present_window_35_fu_76 <= present_window_62;
                elsif ((ap_const_boolean_1 = ap_condition_222)) then 
                    present_window_35_fu_76 <= present_window_36_fu_80;
                end if;
            end if; 
        end if;
    end process;

    present_window_36_fu_80_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    present_window_36_fu_80 <= empty;
                elsif (((icmp_ln253_reg_342 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    present_window_36_fu_80 <= trunc_ln257_fu_235_p1;
                end if;
            end if; 
        end if;
    end process;

    present_window_37_fu_84_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    present_window_37_fu_84 <= present_window_63;
                elsif ((ap_const_boolean_1 = ap_condition_226)) then 
                    present_window_37_fu_84 <= present_window_36_fu_80;
                end if;
            end if; 
        end if;
    end process;

    present_window_38_fu_88_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    present_window_38_fu_88 <= present_window_64;
                elsif ((ap_const_boolean_1 = ap_condition_232)) then 
                    present_window_38_fu_88 <= present_window_36_fu_80;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                iIdx_5_reg_338 <= ap_sig_allocacmp_iIdx_5;
                icmp_ln253_reg_342 <= icmp_ln253_fu_214_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln257_fu_220_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_iIdx_5) + unsigned(ap_const_lv3_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, downStream_4_empty_n, icmp_ln253_reg_342)
    begin
                ap_block_pp0_stage0_01001 <= ((icmp_ln253_reg_342 = ap_const_lv1_0) and (downStream_4_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, downStream_4_empty_n, icmp_ln253_reg_342)
    begin
                ap_block_pp0_stage0_11001 <= ((icmp_ln253_reg_342 = ap_const_lv1_0) and (downStream_4_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, downStream_4_empty_n, icmp_ln253_reg_342)
    begin
                ap_block_pp0_stage0_subdone <= ((icmp_ln253_reg_342 = ap_const_lv1_0) and (downStream_4_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state2_pp0_stage0_iter1_assign_proc : process(downStream_4_empty_n, icmp_ln253_reg_342)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((icmp_ln253_reg_342 = ap_const_lv1_0) and (downStream_4_empty_n = ap_const_logic_0));
    end process;


    ap_condition_216_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln253_reg_342, iIdx_5_reg_338)
    begin
                ap_condition_216 <= ((iIdx_5_reg_338 = ap_const_lv3_0) and (icmp_ln253_reg_342 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_condition_219_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln253_reg_342, iIdx_5_reg_338)
    begin
                ap_condition_219 <= ((iIdx_5_reg_338 = ap_const_lv3_1) and (icmp_ln253_reg_342 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_condition_222_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln253_reg_342, iIdx_5_reg_338)
    begin
                ap_condition_222 <= ((iIdx_5_reg_338 = ap_const_lv3_2) and (icmp_ln253_reg_342 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_condition_226_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln253_reg_342, iIdx_5_reg_338)
    begin
                ap_condition_226 <= ((iIdx_5_reg_338 = ap_const_lv3_3) and (icmp_ln253_reg_342 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_condition_232_assign_proc : process(ap_enable_reg_pp0_iter1, icmp_ln253_reg_342, iIdx_5_reg_338)
    begin
                ap_condition_232 <= (not((iIdx_5_reg_338 = ap_const_lv3_3)) and not((iIdx_5_reg_338 = ap_const_lv3_2)) and not((iIdx_5_reg_338 = ap_const_lv3_1)) and not((iIdx_5_reg_338 = ap_const_lv3_0)) and (icmp_ln253_reg_342 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln253_fu_214_p2)
    begin
        if (((icmp_ln253_fu_214_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter1_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_iIdx_5_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, iIdx_fu_64, ap_loop_init)
    begin
        if (((ap_loop_init = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_iIdx_5 <= ap_const_lv3_0;
        else 
            ap_sig_allocacmp_iIdx_5 <= iIdx_fu_64;
        end if; 
    end process;


    downStream_4_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, downStream_4_empty_n, icmp_ln253_reg_342, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (icmp_ln253_reg_342 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            downStream_4_blk_n <= downStream_4_empty_n;
        else 
            downStream_4_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    downStream_4_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln253_reg_342, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln253_reg_342 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            downStream_4_read <= ap_const_logic_1;
        else 
            downStream_4_read <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln253_fu_214_p2 <= "1" when (ap_sig_allocacmp_iIdx_5 = ap_const_lv3_5) else "0";
    present_window_65_out <= present_window_33_fu_68;

    present_window_65_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln253_reg_342, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln253_reg_342 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            present_window_65_out_ap_vld <= ap_const_logic_1;
        else 
            present_window_65_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    present_window_66_out <= present_window_34_fu_72;

    present_window_66_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln253_reg_342, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln253_reg_342 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            present_window_66_out_ap_vld <= ap_const_logic_1;
        else 
            present_window_66_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    present_window_67_out <= present_window_35_fu_76;

    present_window_67_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln253_reg_342, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln253_reg_342 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            present_window_67_out_ap_vld <= ap_const_logic_1;
        else 
            present_window_67_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    present_window_68_out <= present_window_37_fu_84;

    present_window_68_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln253_reg_342, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln253_reg_342 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            present_window_68_out_ap_vld <= ap_const_logic_1;
        else 
            present_window_68_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    present_window_69_out <= present_window_38_fu_88;

    present_window_69_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln253_reg_342, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln253_reg_342 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            present_window_69_out_ap_vld <= ap_const_logic_1;
        else 
            present_window_69_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    tmp_data_V_66_out <= present_window_36_fu_80;

    tmp_data_V_66_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln253_reg_342, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln253_reg_342 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            tmp_data_V_66_out_ap_vld <= ap_const_logic_1;
        else 
            tmp_data_V_66_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    trunc_ln257_fu_235_p1 <= downStream_4_dout(8 - 1 downto 0);
end behav;
