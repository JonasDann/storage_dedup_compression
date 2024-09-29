-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity gzipcMulticoreStreaming_sendBuffer_9_13 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    start_full_n : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_out : OUT STD_LOGIC;
    start_write : OUT STD_LOGIC;
    lz77Stream_6_dout : IN STD_LOGIC_VECTOR (9 downto 0);
    lz77Stream_6_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    lz77Stream_6_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    lz77Stream_6_empty_n : IN STD_LOGIC;
    lz77Stream_6_read : OUT STD_LOGIC;
    lz77PassStream_6_din : OUT STD_LOGIC_VECTOR (8 downto 0);
    lz77PassStream_6_num_data_valid : IN STD_LOGIC_VECTOR (14 downto 0);
    lz77PassStream_6_fifo_cap : IN STD_LOGIC_VECTOR (14 downto 0);
    lz77PassStream_6_full_n : IN STD_LOGIC;
    lz77PassStream_6_write : OUT STD_LOGIC;
    upsizedCntr_6_din : OUT STD_LOGIC_VECTOR (16 downto 0);
    upsizedCntr_6_num_data_valid : IN STD_LOGIC_VECTOR (5 downto 0);
    upsizedCntr_6_fifo_cap : IN STD_LOGIC_VECTOR (5 downto 0);
    upsizedCntr_6_full_n : IN STD_LOGIC;
    upsizedCntr_6_write : OUT STD_LOGIC );
end;


architecture behav of gzipcMulticoreStreaming_sendBuffer_9_13 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv15_0 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";

attribute shreg_extract : string;
    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal lz77Stream_6_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal upsizedCntr_6_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal trunc_ln145_fu_75_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal trunc_ln145_reg_111 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_strobe_V_reg_116 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_return : STD_LOGIC_VECTOR (0 downto 0);
    signal targetBlock_reg_121 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_start : STD_LOGIC;
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_done : STD_LOGIC;
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_idle : STD_LOGIC;
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_ready : STD_LOGIC;
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77Stream_6_read : STD_LOGIC;
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77PassStream_6_din : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77PassStream_6_write : STD_LOGIC;
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_sizeCntr_V_out : STD_LOGIC_VECTOR (16 downto 0);
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_sizeCntr_V_out_ap_vld : STD_LOGIC;
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_last_1_out : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_last_1_out_ap_vld : STD_LOGIC;
    signal grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal sizeCntr_V_loc_fu_46 : STD_LOGIC_VECTOR (16 downto 0);
    signal last_1_loc_fu_42 : STD_LOGIC_VECTOR (0 downto 0);
    signal brmerge_demorgan_fu_94_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component gzipcMulticoreStreaming_sendBuffer_9_13_Pipeline_buffer_main IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        lz77Stream_6_dout : IN STD_LOGIC_VECTOR (9 downto 0);
        lz77Stream_6_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
        lz77Stream_6_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
        lz77Stream_6_empty_n : IN STD_LOGIC;
        lz77Stream_6_read : OUT STD_LOGIC;
        lz77PassStream_6_din : OUT STD_LOGIC_VECTOR (8 downto 0);
        lz77PassStream_6_num_data_valid : IN STD_LOGIC_VECTOR (14 downto 0);
        lz77PassStream_6_fifo_cap : IN STD_LOGIC_VECTOR (14 downto 0);
        lz77PassStream_6_full_n : IN STD_LOGIC;
        lz77PassStream_6_write : OUT STD_LOGIC;
        empty : IN STD_LOGIC_VECTOR (8 downto 0);
        tmp_strobe_V : IN STD_LOGIC_VECTOR (0 downto 0);
        sizeCntr_V_out : OUT STD_LOGIC_VECTOR (16 downto 0);
        sizeCntr_V_out_ap_vld : OUT STD_LOGIC;
        last_1_out : OUT STD_LOGIC_VECTOR (0 downto 0);
        last_1_out_ap_vld : OUT STD_LOGIC;
        ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;



begin
    grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63 : component gzipcMulticoreStreaming_sendBuffer_9_13_Pipeline_buffer_main
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_start,
        ap_done => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_done,
        ap_idle => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_idle,
        ap_ready => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_ready,
        lz77Stream_6_dout => lz77Stream_6_dout,
        lz77Stream_6_num_data_valid => ap_const_lv3_0,
        lz77Stream_6_fifo_cap => ap_const_lv3_0,
        lz77Stream_6_empty_n => lz77Stream_6_empty_n,
        lz77Stream_6_read => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77Stream_6_read,
        lz77PassStream_6_din => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77PassStream_6_din,
        lz77PassStream_6_num_data_valid => ap_const_lv15_0,
        lz77PassStream_6_fifo_cap => ap_const_lv15_0,
        lz77PassStream_6_full_n => lz77PassStream_6_full_n,
        lz77PassStream_6_write => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77PassStream_6_write,
        empty => trunc_ln145_reg_111,
        tmp_strobe_V => tmp_strobe_V_reg_116,
        sizeCntr_V_out => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_sizeCntr_V_out,
        sizeCntr_V_out_ap_vld => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_sizeCntr_V_out_ap_vld,
        last_1_out => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_last_1_out,
        last_1_out_ap_vld => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_last_1_out_ap_vld,
        ap_return => grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_return);





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
                elsif (((upsizedCntr_6_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (brmerge_demorgan_fu_94_p2 = ap_const_lv1_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_ready = ap_const_logic_1)) then 
                    grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((internal_ap_ready = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state4) and (grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_last_1_out_ap_vld = ap_const_logic_1))) then
                last_1_loc_fu_42 <= grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_last_1_out;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state4) and (grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_sizeCntr_V_out_ap_vld = ap_const_logic_1))) then
                sizeCntr_V_loc_fu_46 <= grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_sizeCntr_V_out;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                targetBlock_reg_121 <= grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                tmp_strobe_V_reg_116 <= lz77Stream_6_dout(9 downto 9);
                trunc_ln145_reg_111 <= trunc_ln145_fu_75_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, lz77Stream_6_empty_n, upsizedCntr_6_full_n, ap_CS_fsm_state2, ap_CS_fsm_state5, ap_CS_fsm_state4, grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_done, brmerge_demorgan_fu_94_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((lz77Stream_6_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                if (((upsizedCntr_6_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (brmerge_demorgan_fu_94_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif (((upsizedCntr_6_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (brmerge_demorgan_fu_94_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(real_start, ap_done_reg)
    begin
        if (((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(lz77Stream_6_empty_n)
    begin
        if ((lz77Stream_6_empty_n = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_done)
    begin
        if ((grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state5_blk_assign_proc : process(upsizedCntr_6_full_n)
    begin
        if ((upsizedCntr_6_full_n = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(real_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, upsizedCntr_6_full_n, ap_CS_fsm_state5, brmerge_demorgan_fu_94_p2)
    begin
        if (((upsizedCntr_6_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (brmerge_demorgan_fu_94_p2 = ap_const_lv1_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (real_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;
    brmerge_demorgan_fu_94_p2 <= (targetBlock_reg_121 and last_1_loc_fu_42);
    grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_start <= grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_ap_start_reg;

    internal_ap_ready_assign_proc : process(upsizedCntr_6_full_n, ap_CS_fsm_state5, brmerge_demorgan_fu_94_p2)
    begin
        if (((upsizedCntr_6_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (brmerge_demorgan_fu_94_p2 = ap_const_lv1_1))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    lz77PassStream_6_din <= grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77PassStream_6_din;

    lz77PassStream_6_write_assign_proc : process(ap_CS_fsm_state4, grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77PassStream_6_write)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            lz77PassStream_6_write <= grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77PassStream_6_write;
        else 
            lz77PassStream_6_write <= ap_const_logic_0;
        end if; 
    end process;


    lz77Stream_6_blk_n_assign_proc : process(lz77Stream_6_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            lz77Stream_6_blk_n <= lz77Stream_6_empty_n;
        else 
            lz77Stream_6_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    lz77Stream_6_read_assign_proc : process(lz77Stream_6_empty_n, ap_CS_fsm_state2, ap_CS_fsm_state4, grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77Stream_6_read)
    begin
        if (((lz77Stream_6_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            lz77Stream_6_read <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            lz77Stream_6_read <= grp_sendBuffer_9_13_Pipeline_buffer_main_fu_63_lz77Stream_6_read;
        else 
            lz77Stream_6_read <= ap_const_logic_0;
        end if; 
    end process;


    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (start_full_n = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;

    trunc_ln145_fu_75_p1 <= lz77Stream_6_dout(9 - 1 downto 0);

    upsizedCntr_6_blk_n_assign_proc : process(upsizedCntr_6_full_n, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            upsizedCntr_6_blk_n <= upsizedCntr_6_full_n;
        else 
            upsizedCntr_6_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    upsizedCntr_6_din <= sizeCntr_V_loc_fu_46;

    upsizedCntr_6_write_assign_proc : process(upsizedCntr_6_full_n, ap_CS_fsm_state5)
    begin
        if (((upsizedCntr_6_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            upsizedCntr_6_write <= ap_const_logic_1;
        else 
            upsizedCntr_6_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;
