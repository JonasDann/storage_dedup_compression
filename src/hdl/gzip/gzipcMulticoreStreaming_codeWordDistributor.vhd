-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity gzipcMulticoreStreaming_codeWordDistributor is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ldCodes_dout : IN STD_LOGIC_VECTOR (20 downto 0);
    ldCodes_num_data_valid : IN STD_LOGIC_VECTOR (4 downto 0);
    ldCodes_fifo_cap : IN STD_LOGIC_VECTOR (4 downto 0);
    ldCodes_empty_n : IN STD_LOGIC;
    ldCodes_read : OUT STD_LOGIC;
    ldCodes1_din : OUT STD_LOGIC_VECTOR (20 downto 0);
    ldCodes1_num_data_valid : IN STD_LOGIC_VECTOR (9 downto 0);
    ldCodes1_fifo_cap : IN STD_LOGIC_VECTOR (9 downto 0);
    ldCodes1_full_n : IN STD_LOGIC;
    ldCodes1_write : OUT STD_LOGIC;
    ldCodes2_din : OUT STD_LOGIC_VECTOR (20 downto 0);
    ldCodes2_num_data_valid : IN STD_LOGIC_VECTOR (10 downto 0);
    ldCodes2_fifo_cap : IN STD_LOGIC_VECTOR (10 downto 0);
    ldCodes2_full_n : IN STD_LOGIC;
    ldCodes2_write : OUT STD_LOGIC;
    ldMaxCodes21_dout : IN STD_LOGIC_VECTOR (9 downto 0);
    ldMaxCodes21_num_data_valid : IN STD_LOGIC_VECTOR (4 downto 0);
    ldMaxCodes21_fifo_cap : IN STD_LOGIC_VECTOR (4 downto 0);
    ldMaxCodes21_empty_n : IN STD_LOGIC;
    ldMaxCodes21_read : OUT STD_LOGIC;
    ldMaxCodes122_din : OUT STD_LOGIC_VECTOR (9 downto 0);
    ldMaxCodes122_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    ldMaxCodes122_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    ldMaxCodes122_full_n : IN STD_LOGIC;
    ldMaxCodes122_write : OUT STD_LOGIC;
    ldMaxCodes223_din : OUT STD_LOGIC_VECTOR (9 downto 0);
    ldMaxCodes223_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
    ldMaxCodes223_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
    ldMaxCodes223_full_n : IN STD_LOGIC;
    ldMaxCodes223_write : OUT STD_LOGIC;
    eoBlocks_0_dout : IN STD_LOGIC_VECTOR (0 downto 0);
    eoBlocks_0_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
    eoBlocks_0_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
    eoBlocks_0_empty_n : IN STD_LOGIC;
    eoBlocks_0_read : OUT STD_LOGIC );
end;


architecture behav of gzipcMulticoreStreaming_codeWordDistributor is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal hctMeta_4_address0 : STD_LOGIC_VECTOR (0 downto 0);
    signal hctMeta_4_ce0 : STD_LOGIC;
    signal hctMeta_4_q0 : STD_LOGIC_VECTOR (8 downto 0);
    signal ldMaxCodes21_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ldMaxCodes122_blk_n : STD_LOGIC;
    signal ldMaxCodes223_blk_n : STD_LOGIC;
    signal eoBlocks_0_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal add_ln2300_fu_125_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal add_ln2300_reg_142 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal hctMeta_4_load_reg_152 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_start : STD_LOGIC;
    signal grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_done : STD_LOGIC;
    signal grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_idle : STD_LOGIC;
    signal grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_ready : STD_LOGIC;
    signal grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes_read : STD_LOGIC;
    signal grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes1_din : STD_LOGIC_VECTOR (20 downto 0);
    signal grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes1_write : STD_LOGIC;
    signal grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes2_din : STD_LOGIC_VECTOR (20 downto 0);
    signal grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes2_write : STD_LOGIC;
    signal i_reg_95 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal tmp_read_fu_54_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_start_reg : STD_LOGIC := '0';
    signal zext_ln2300_fu_131_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_state4 : BOOLEAN;
    signal icmp_ln2300_fu_119_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component gzipcMulticoreStreaming_codeWordDistributor_Pipeline_distribute_hufcodes_main IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ldCodes_dout : IN STD_LOGIC_VECTOR (20 downto 0);
        ldCodes_num_data_valid : IN STD_LOGIC_VECTOR (4 downto 0);
        ldCodes_fifo_cap : IN STD_LOGIC_VECTOR (4 downto 0);
        ldCodes_empty_n : IN STD_LOGIC;
        ldCodes_read : OUT STD_LOGIC;
        ldCodes1_din : OUT STD_LOGIC_VECTOR (20 downto 0);
        ldCodes1_num_data_valid : IN STD_LOGIC_VECTOR (9 downto 0);
        ldCodes1_fifo_cap : IN STD_LOGIC_VECTOR (9 downto 0);
        ldCodes1_full_n : IN STD_LOGIC;
        ldCodes1_write : OUT STD_LOGIC;
        ldCodes2_din : OUT STD_LOGIC_VECTOR (20 downto 0);
        ldCodes2_num_data_valid : IN STD_LOGIC_VECTOR (10 downto 0);
        ldCodes2_fifo_cap : IN STD_LOGIC_VECTOR (10 downto 0);
        ldCodes2_full_n : IN STD_LOGIC;
        ldCodes2_write : OUT STD_LOGIC;
        hctMeta_4_load : IN STD_LOGIC_VECTOR (8 downto 0) );
    end component;


    component gzipcMulticoreStreaming_filterRadixSortPart1_286_10_14_1_s_hctMeta_3_ROM_AUTO_1R IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (0 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (8 downto 0) );
    end component;



begin
    hctMeta_4_U : component gzipcMulticoreStreaming_filterRadixSortPart1_286_10_14_1_s_hctMeta_3_ROM_AUTO_1R
    generic map (
        DataWidth => 9,
        AddressRange => 2,
        AddressWidth => 1)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => hctMeta_4_address0,
        ce0 => hctMeta_4_ce0,
        q0 => hctMeta_4_q0);

    grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107 : component gzipcMulticoreStreaming_codeWordDistributor_Pipeline_distribute_hufcodes_main
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_start,
        ap_done => grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_done,
        ap_idle => grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_idle,
        ap_ready => grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_ready,
        ldCodes_dout => ldCodes_dout,
        ldCodes_num_data_valid => ap_const_lv5_0,
        ldCodes_fifo_cap => ap_const_lv5_0,
        ldCodes_empty_n => ldCodes_empty_n,
        ldCodes_read => grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes_read,
        ldCodes1_din => grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes1_din,
        ldCodes1_num_data_valid => ap_const_lv10_0,
        ldCodes1_fifo_cap => ap_const_lv10_0,
        ldCodes1_full_n => ldCodes1_full_n,
        ldCodes1_write => grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes1_write,
        ldCodes2_din => grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes2_din,
        ldCodes2_num_data_valid => ap_const_lv11_0,
        ldCodes2_fifo_cap => ap_const_lv11_0,
        ldCodes2_full_n => ldCodes2_full_n,
        ldCodes2_write => grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes2_write,
        hctMeta_4_load => hctMeta_4_load_reg_152);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
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
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((eoBlocks_0_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2) and (tmp_read_fu_54_p2 = ap_const_lv1_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                    grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_ready = ap_const_logic_1)) then 
                    grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_reg_95_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((eoBlocks_0_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2) and (tmp_read_fu_54_p2 = ap_const_lv1_0))) then 
                i_reg_95 <= ap_const_lv2_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state6) and (grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_done = ap_const_logic_1))) then 
                i_reg_95 <= add_ln2300_reg_142;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                add_ln2300_reg_142 <= add_ln2300_fu_125_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                hctMeta_4_load_reg_152 <= hctMeta_4_q0;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ldMaxCodes21_empty_n, ldMaxCodes122_full_n, ldMaxCodes223_full_n, eoBlocks_0_empty_n, ap_CS_fsm_state4, ap_CS_fsm_state2, ap_CS_fsm_state3, grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_done, ap_CS_fsm_state6, tmp_read_fu_54_p2, icmp_ln2300_fu_119_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((eoBlocks_0_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2) and (tmp_read_fu_54_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif (((eoBlocks_0_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2) and (tmp_read_fu_54_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state3) and (icmp_ln2300_fu_119_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state4 => 
                if ((not(((ldMaxCodes223_full_n = ap_const_logic_0) or (ldMaxCodes122_full_n = ap_const_logic_0) or (ldMaxCodes21_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state6) and (grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
    add_ln2300_fu_125_p2 <= std_logic_vector(unsigned(i_reg_95) + unsigned(ap_const_lv2_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg)
    begin
        if (((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(eoBlocks_0_empty_n)
    begin
        if ((eoBlocks_0_empty_n = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(ldMaxCodes21_empty_n, ldMaxCodes122_full_n, ldMaxCodes223_full_n)
    begin
        if (((ldMaxCodes223_full_n = ap_const_logic_0) or (ldMaxCodes122_full_n = ap_const_logic_0) or (ldMaxCodes21_empty_n = ap_const_logic_0))) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_ST_fsm_state6_blk_assign_proc : process(grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_done)
    begin
        if ((grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_block_state4_assign_proc : process(ldMaxCodes21_empty_n, ldMaxCodes122_full_n, ldMaxCodes223_full_n)
    begin
                ap_block_state4 <= ((ldMaxCodes223_full_n = ap_const_logic_0) or (ldMaxCodes122_full_n = ap_const_logic_0) or (ldMaxCodes21_empty_n = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, eoBlocks_0_empty_n, ap_CS_fsm_state2, tmp_read_fu_54_p2)
    begin
        if (((eoBlocks_0_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2) and (tmp_read_fu_54_p2 = ap_const_lv1_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(eoBlocks_0_empty_n, ap_CS_fsm_state2, tmp_read_fu_54_p2)
    begin
        if (((eoBlocks_0_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2) and (tmp_read_fu_54_p2 = ap_const_lv1_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    eoBlocks_0_blk_n_assign_proc : process(eoBlocks_0_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            eoBlocks_0_blk_n <= eoBlocks_0_empty_n;
        else 
            eoBlocks_0_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    eoBlocks_0_read_assign_proc : process(eoBlocks_0_empty_n, ap_CS_fsm_state2)
    begin
        if (((eoBlocks_0_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            eoBlocks_0_read <= ap_const_logic_1;
        else 
            eoBlocks_0_read <= ap_const_logic_0;
        end if; 
    end process;

    grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_start <= grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ap_start_reg;
    hctMeta_4_address0 <= zext_ln2300_fu_131_p1(1 - 1 downto 0);

    hctMeta_4_ce0_assign_proc : process(ldMaxCodes21_empty_n, ldMaxCodes122_full_n, ldMaxCodes223_full_n, ap_CS_fsm_state4)
    begin
        if ((not(((ldMaxCodes223_full_n = ap_const_logic_0) or (ldMaxCodes122_full_n = ap_const_logic_0) or (ldMaxCodes21_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            hctMeta_4_ce0 <= ap_const_logic_1;
        else 
            hctMeta_4_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln2300_fu_119_p2 <= "1" when (i_reg_95 = ap_const_lv2_2) else "0";
    ldCodes1_din <= grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes1_din;

    ldCodes1_write_assign_proc : process(grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes1_write, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ldCodes1_write <= grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes1_write;
        else 
            ldCodes1_write <= ap_const_logic_0;
        end if; 
    end process;

    ldCodes2_din <= grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes2_din;

    ldCodes2_write_assign_proc : process(grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes2_write, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ldCodes2_write <= grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes2_write;
        else 
            ldCodes2_write <= ap_const_logic_0;
        end if; 
    end process;


    ldCodes_read_assign_proc : process(grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes_read, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ldCodes_read <= grp_codeWordDistributor_Pipeline_distribute_hufcodes_main_fu_107_ldCodes_read;
        else 
            ldCodes_read <= ap_const_logic_0;
        end if; 
    end process;


    ldMaxCodes122_blk_n_assign_proc : process(ldMaxCodes122_full_n, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ldMaxCodes122_blk_n <= ldMaxCodes122_full_n;
        else 
            ldMaxCodes122_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    ldMaxCodes122_din <= ldMaxCodes21_dout;

    ldMaxCodes122_write_assign_proc : process(ldMaxCodes21_empty_n, ldMaxCodes122_full_n, ldMaxCodes223_full_n, ap_CS_fsm_state4)
    begin
        if ((not(((ldMaxCodes223_full_n = ap_const_logic_0) or (ldMaxCodes122_full_n = ap_const_logic_0) or (ldMaxCodes21_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            ldMaxCodes122_write <= ap_const_logic_1;
        else 
            ldMaxCodes122_write <= ap_const_logic_0;
        end if; 
    end process;


    ldMaxCodes21_blk_n_assign_proc : process(ldMaxCodes21_empty_n, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ldMaxCodes21_blk_n <= ldMaxCodes21_empty_n;
        else 
            ldMaxCodes21_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ldMaxCodes21_read_assign_proc : process(ldMaxCodes21_empty_n, ldMaxCodes122_full_n, ldMaxCodes223_full_n, ap_CS_fsm_state4)
    begin
        if ((not(((ldMaxCodes223_full_n = ap_const_logic_0) or (ldMaxCodes122_full_n = ap_const_logic_0) or (ldMaxCodes21_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            ldMaxCodes21_read <= ap_const_logic_1;
        else 
            ldMaxCodes21_read <= ap_const_logic_0;
        end if; 
    end process;


    ldMaxCodes223_blk_n_assign_proc : process(ldMaxCodes223_full_n, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            ldMaxCodes223_blk_n <= ldMaxCodes223_full_n;
        else 
            ldMaxCodes223_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    ldMaxCodes223_din <= ldMaxCodes21_dout;

    ldMaxCodes223_write_assign_proc : process(ldMaxCodes21_empty_n, ldMaxCodes122_full_n, ldMaxCodes223_full_n, ap_CS_fsm_state4)
    begin
        if ((not(((ldMaxCodes223_full_n = ap_const_logic_0) or (ldMaxCodes122_full_n = ap_const_logic_0) or (ldMaxCodes21_empty_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            ldMaxCodes223_write <= ap_const_logic_1;
        else 
            ldMaxCodes223_write <= ap_const_logic_0;
        end if; 
    end process;

    tmp_read_fu_54_p2 <= eoBlocks_0_dout;
    zext_ln2300_fu_131_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_reg_95),64));
end behav;
