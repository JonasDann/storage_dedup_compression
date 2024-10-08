-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity gzipcMulticoreStreaming_sendProcTrees_Pipeline_send_bltree is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    intlHufCodeStream_din : OUT STD_LOGIC_VECTOR (58 downto 0);
    intlHufCodeStream_num_data_valid : IN STD_LOGIC_VECTOR (9 downto 0);
    intlHufCodeStream_fifo_cap : IN STD_LOGIC_VECTOR (9 downto 0);
    intlHufCodeStream_full_n : IN STD_LOGIC;
    intlHufCodeStream_write : OUT STD_LOGIC;
    ret_V : IN STD_LOGIC_VECTOR (10 downto 0);
    outCodes_address0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    outCodes_ce0 : OUT STD_LOGIC;
    outCodes_q0 : IN STD_LOGIC_VECTOR (19 downto 0);
    sext_ln174 : IN STD_LOGIC_VECTOR (10 downto 0);
    tmp_3 : IN STD_LOGIC_VECTOR (9 downto 0);
    conv3_i_i286_phi_out : OUT STD_LOGIC_VECTOR (4 downto 0);
    conv3_i_i286_phi_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of gzipcMulticoreStreaming_sendProcTrees_Pipeline_send_bltree is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv8_10 : STD_LOGIC_VECTOR (7 downto 0) := "00010000";
    constant ap_const_lv8_11 : STD_LOGIC_VECTOR (7 downto 0) := "00010001";
    constant ap_const_lv8_12 : STD_LOGIC_VECTOR (7 downto 0) := "00010010";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv8_8 : STD_LOGIC_VECTOR (7 downto 0) := "00001000";
    constant ap_const_lv8_7 : STD_LOGIC_VECTOR (7 downto 0) := "00000111";
    constant ap_const_lv8_9 : STD_LOGIC_VECTOR (7 downto 0) := "00001001";
    constant ap_const_lv8_6 : STD_LOGIC_VECTOR (7 downto 0) := "00000110";
    constant ap_const_lv8_A : STD_LOGIC_VECTOR (7 downto 0) := "00001010";
    constant ap_const_lv8_5 : STD_LOGIC_VECTOR (7 downto 0) := "00000101";
    constant ap_const_lv8_B : STD_LOGIC_VECTOR (7 downto 0) := "00001011";
    constant ap_const_lv8_4 : STD_LOGIC_VECTOR (7 downto 0) := "00000100";
    constant ap_const_lv8_C : STD_LOGIC_VECTOR (7 downto 0) := "00001100";
    constant ap_const_lv8_3 : STD_LOGIC_VECTOR (7 downto 0) := "00000011";
    constant ap_const_lv8_D : STD_LOGIC_VECTOR (7 downto 0) := "00001101";
    constant ap_const_lv8_2 : STD_LOGIC_VECTOR (7 downto 0) := "00000010";
    constant ap_const_lv8_E : STD_LOGIC_VECTOR (7 downto 0) := "00001110";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv8_F : STD_LOGIC_VECTOR (7 downto 0) := "00001111";
    constant ap_const_lv9_13E : STD_LOGIC_VECTOR (8 downto 0) := "100111110";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv5_14 : STD_LOGIC_VECTOR (4 downto 0) := "10100";
    constant ap_const_lv9_A0 : STD_LOGIC_VECTOR (8 downto 0) := "010100000";
    constant ap_const_lv14_C00 : STD_LOGIC_VECTOR (13 downto 0) := "00110000000000";

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
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln1073_fu_175_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal intlHufCodeStream_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal sext_ln174_cast_fu_159_p1 : STD_LOGIC_VECTOR (14 downto 0);
    signal sext_ln174_cast_reg_307 : STD_LOGIC_VECTOR (14 downto 0);
    signal zext_ln587_fu_241_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal conv3_i_i286_phi_fu_106 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln5_fu_251_p4 : STD_LOGIC_VECTOR (4 downto 0);
    signal rank_V_fu_110 : STD_LOGIC_VECTOR (9 downto 0);
    signal rank_V_2_fu_181_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_rank_V_1 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln1073_fu_171_p1 : STD_LOGIC_VECTOR (10 downto 0);
    signal rhs_V_fu_187_p21 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln1541_1_fu_231_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal ret_V_2_fu_235_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal zext_ln174_4_cast_fu_261_p7 : STD_LOGIC_VECTOR (57 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component gzipcMulticoreStreaming_mux_1910_8_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        din3_WIDTH : INTEGER;
        din4_WIDTH : INTEGER;
        din5_WIDTH : INTEGER;
        din6_WIDTH : INTEGER;
        din7_WIDTH : INTEGER;
        din8_WIDTH : INTEGER;
        din9_WIDTH : INTEGER;
        din10_WIDTH : INTEGER;
        din11_WIDTH : INTEGER;
        din12_WIDTH : INTEGER;
        din13_WIDTH : INTEGER;
        din14_WIDTH : INTEGER;
        din15_WIDTH : INTEGER;
        din16_WIDTH : INTEGER;
        din17_WIDTH : INTEGER;
        din18_WIDTH : INTEGER;
        din19_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (7 downto 0);
        din3 : IN STD_LOGIC_VECTOR (7 downto 0);
        din4 : IN STD_LOGIC_VECTOR (7 downto 0);
        din5 : IN STD_LOGIC_VECTOR (7 downto 0);
        din6 : IN STD_LOGIC_VECTOR (7 downto 0);
        din7 : IN STD_LOGIC_VECTOR (7 downto 0);
        din8 : IN STD_LOGIC_VECTOR (7 downto 0);
        din9 : IN STD_LOGIC_VECTOR (7 downto 0);
        din10 : IN STD_LOGIC_VECTOR (7 downto 0);
        din11 : IN STD_LOGIC_VECTOR (7 downto 0);
        din12 : IN STD_LOGIC_VECTOR (7 downto 0);
        din13 : IN STD_LOGIC_VECTOR (7 downto 0);
        din14 : IN STD_LOGIC_VECTOR (7 downto 0);
        din15 : IN STD_LOGIC_VECTOR (7 downto 0);
        din16 : IN STD_LOGIC_VECTOR (7 downto 0);
        din17 : IN STD_LOGIC_VECTOR (7 downto 0);
        din18 : IN STD_LOGIC_VECTOR (7 downto 0);
        din19 : IN STD_LOGIC_VECTOR (9 downto 0);
        dout : OUT STD_LOGIC_VECTOR (7 downto 0) );
    end component;


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
    mux_1910_8_1_1_U1724 : component gzipcMulticoreStreaming_mux_1910_8_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 8,
        din3_WIDTH => 8,
        din4_WIDTH => 8,
        din5_WIDTH => 8,
        din6_WIDTH => 8,
        din7_WIDTH => 8,
        din8_WIDTH => 8,
        din9_WIDTH => 8,
        din10_WIDTH => 8,
        din11_WIDTH => 8,
        din12_WIDTH => 8,
        din13_WIDTH => 8,
        din14_WIDTH => 8,
        din15_WIDTH => 8,
        din16_WIDTH => 8,
        din17_WIDTH => 8,
        din18_WIDTH => 8,
        din19_WIDTH => 10,
        dout_WIDTH => 8)
    port map (
        din0 => ap_const_lv8_10,
        din1 => ap_const_lv8_11,
        din2 => ap_const_lv8_12,
        din3 => ap_const_lv8_0,
        din4 => ap_const_lv8_8,
        din5 => ap_const_lv8_7,
        din6 => ap_const_lv8_9,
        din7 => ap_const_lv8_6,
        din8 => ap_const_lv8_A,
        din9 => ap_const_lv8_5,
        din10 => ap_const_lv8_B,
        din11 => ap_const_lv8_4,
        din12 => ap_const_lv8_C,
        din13 => ap_const_lv8_3,
        din14 => ap_const_lv8_D,
        din15 => ap_const_lv8_2,
        din16 => ap_const_lv8_E,
        din17 => ap_const_lv8_1,
        din18 => ap_const_lv8_F,
        din19 => ap_sig_allocacmp_rank_V_1,
        dout => rhs_V_fu_187_p21);

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
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    rank_V_fu_110_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln1073_fu_175_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    rank_V_fu_110 <= rank_V_2_fu_181_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    rank_V_fu_110 <= ap_const_lv10_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                conv3_i_i286_phi_fu_106 <= outCodes_q0(19 downto 15);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                sext_ln174_cast_reg_307 <= sext_ln174_cast_fu_159_p1;
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
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter1, intlHufCodeStream_full_n)
    begin
                ap_block_pp0_stage0_01001 <= ((intlHufCodeStream_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter1, intlHufCodeStream_full_n)
    begin
                ap_block_pp0_stage0_11001 <= ((intlHufCodeStream_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter1, intlHufCodeStream_full_n)
    begin
                ap_block_pp0_stage0_subdone <= ((intlHufCodeStream_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state2_pp0_stage0_iter1_assign_proc : process(intlHufCodeStream_full_n)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (intlHufCodeStream_full_n = ap_const_logic_0);
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln1073_fu_175_p2)
    begin
        if (((icmp_ln1073_fu_175_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    ap_sig_allocacmp_rank_V_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, rank_V_fu_110, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_rank_V_1 <= ap_const_lv10_0;
        else 
            ap_sig_allocacmp_rank_V_1 <= rank_V_fu_110;
        end if; 
    end process;

    conv3_i_i286_phi_out <= conv3_i_i286_phi_fu_106;

    conv3_i_i286_phi_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln1073_fu_175_p2, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln1073_fu_175_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            conv3_i_i286_phi_out_ap_vld <= ap_const_logic_1;
        else 
            conv3_i_i286_phi_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln1073_fu_175_p2 <= "1" when (unsigned(zext_ln1073_fu_171_p1) < unsigned(ret_V)) else "0";

    intlHufCodeStream_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, intlHufCodeStream_full_n, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            intlHufCodeStream_blk_n <= intlHufCodeStream_full_n;
        else 
            intlHufCodeStream_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    intlHufCodeStream_din <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln174_4_cast_fu_261_p7),59));

    intlHufCodeStream_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            intlHufCodeStream_write <= ap_const_logic_1;
        else 
            intlHufCodeStream_write <= ap_const_logic_0;
        end if; 
    end process;

    outCodes_address0 <= zext_ln587_fu_241_p1(9 - 1 downto 0);

    outCodes_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            outCodes_ce0 <= ap_const_logic_1;
        else 
            outCodes_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    rank_V_2_fu_181_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_rank_V_1) + unsigned(ap_const_lv10_1));
    ret_V_2_fu_235_p2 <= std_logic_vector(unsigned(zext_ln1541_1_fu_231_p1) + unsigned(ap_const_lv9_13E));
        sext_ln174_cast_fu_159_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln174),15));

    trunc_ln5_fu_251_p4 <= outCodes_q0(19 downto 15);
    zext_ln1073_fu_171_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ap_sig_allocacmp_rank_V_1),11));
    zext_ln1541_1_fu_231_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_V_fu_187_p21),9));
    zext_ln174_4_cast_fu_261_p7 <= (((((ap_const_lv5_14 & sext_ln174_cast_reg_307) & ap_const_lv9_A0) & tmp_3) & ap_const_lv14_C00) & trunc_ln5_fu_251_p4);
    zext_ln587_fu_241_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ret_V_2_fu_235_p2),64));
end behav;
