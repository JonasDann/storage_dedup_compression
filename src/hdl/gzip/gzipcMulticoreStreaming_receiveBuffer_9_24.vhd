-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity gzipcMulticoreStreaming_receiveBuffer_9_24 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    lz77PassStream_4_dout : IN STD_LOGIC_VECTOR (8 downto 0);
    lz77PassStream_4_num_data_valid : IN STD_LOGIC_VECTOR (14 downto 0);
    lz77PassStream_4_fifo_cap : IN STD_LOGIC_VECTOR (14 downto 0);
    lz77PassStream_4_empty_n : IN STD_LOGIC;
    lz77PassStream_4_read : OUT STD_LOGIC;
    lz77DownsizedStream_4_din : OUT STD_LOGIC_VECTOR (9 downto 0);
    lz77DownsizedStream_4_num_data_valid : IN STD_LOGIC_VECTOR (5 downto 0);
    lz77DownsizedStream_4_fifo_cap : IN STD_LOGIC_VECTOR (5 downto 0);
    lz77DownsizedStream_4_full_n : IN STD_LOGIC;
    lz77DownsizedStream_4_write : OUT STD_LOGIC;
    upsizedCntr_4_dout : IN STD_LOGIC_VECTOR (16 downto 0);
    upsizedCntr_4_num_data_valid : IN STD_LOGIC_VECTOR (5 downto 0);
    upsizedCntr_4_fifo_cap : IN STD_LOGIC_VECTOR (5 downto 0);
    upsizedCntr_4_empty_n : IN STD_LOGIC;
    upsizedCntr_4_read : OUT STD_LOGIC );
end;


architecture behav of gzipcMulticoreStreaming_receiveBuffer_9_24 is 
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
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv17_0 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv15_0 : STD_LOGIC_VECTOR (14 downto 0) := "000000000000000";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal lz77DownsizedStream_4_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal upsizedCntr_4_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal inSize_V_reg_126 : STD_LOGIC_VECTOR (16 downto 0);
    signal p_0_0_032113_lcssa116_load_reg_134 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_start : STD_LOGIC;
    signal grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_done : STD_LOGIC;
    signal grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_idle : STD_LOGIC;
    signal grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_ready : STD_LOGIC;
    signal grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77PassStream_4_read : STD_LOGIC;
    signal grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77DownsizedStream_4_din : STD_LOGIC_VECTOR (9 downto 0);
    signal grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77DownsizedStream_4_write : STD_LOGIC;
    signal grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_p_phi_out : STD_LOGIC_VECTOR (8 downto 0);
    signal grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_p_phi_out_ap_vld : STD_LOGIC;
    signal grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal p_0_0_032113_lcssa116_fu_46 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_s_fu_91_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal p_02_fu_105_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal icmp_ln1065_fu_82_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component gzipcMulticoreStreaming_receiveBuffer_9_24_Pipeline_buffer_assign IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        lz77PassStream_4_dout : IN STD_LOGIC_VECTOR (8 downto 0);
        lz77PassStream_4_num_data_valid : IN STD_LOGIC_VECTOR (14 downto 0);
        lz77PassStream_4_fifo_cap : IN STD_LOGIC_VECTOR (14 downto 0);
        lz77PassStream_4_empty_n : IN STD_LOGIC;
        lz77PassStream_4_read : OUT STD_LOGIC;
        lz77DownsizedStream_4_din : OUT STD_LOGIC_VECTOR (9 downto 0);
        lz77DownsizedStream_4_num_data_valid : IN STD_LOGIC_VECTOR (5 downto 0);
        lz77DownsizedStream_4_fifo_cap : IN STD_LOGIC_VECTOR (5 downto 0);
        lz77DownsizedStream_4_full_n : IN STD_LOGIC;
        lz77DownsizedStream_4_write : OUT STD_LOGIC;
        p_0_0_032113_lcssa116 : IN STD_LOGIC_VECTOR (8 downto 0);
        inSize_V : IN STD_LOGIC_VECTOR (16 downto 0);
        p_phi_out : OUT STD_LOGIC_VECTOR (8 downto 0);
        p_phi_out_ap_vld : OUT STD_LOGIC );
    end component;



begin
    grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67 : component gzipcMulticoreStreaming_receiveBuffer_9_24_Pipeline_buffer_assign
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_start,
        ap_done => grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_done,
        ap_idle => grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_idle,
        ap_ready => grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_ready,
        lz77PassStream_4_dout => lz77PassStream_4_dout,
        lz77PassStream_4_num_data_valid => ap_const_lv15_0,
        lz77PassStream_4_fifo_cap => ap_const_lv15_0,
        lz77PassStream_4_empty_n => lz77PassStream_4_empty_n,
        lz77PassStream_4_read => grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77PassStream_4_read,
        lz77DownsizedStream_4_din => grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77DownsizedStream_4_din,
        lz77DownsizedStream_4_num_data_valid => ap_const_lv6_0,
        lz77DownsizedStream_4_fifo_cap => ap_const_lv6_0,
        lz77DownsizedStream_4_full_n => lz77DownsizedStream_4_full_n,
        lz77DownsizedStream_4_write => grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77DownsizedStream_4_write,
        p_0_0_032113_lcssa116 => p_0_0_032113_lcssa116_load_reg_134,
        inSize_V => inSize_V_reg_126,
        p_phi_out => grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_p_phi_out,
        p_phi_out_ap_vld => grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_p_phi_out_ap_vld);





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
                elsif (((lz77DownsizedStream_4_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_ready = ap_const_logic_1)) then 
                    grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                inSize_V_reg_126 <= upsizedCntr_4_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((lz77DownsizedStream_4_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                p_0_0_032113_lcssa116_fu_46 <= grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_p_phi_out;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                p_0_0_032113_lcssa116_load_reg_134 <= p_0_0_032113_lcssa116_fu_46;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, lz77DownsizedStream_4_full_n, upsizedCntr_4_empty_n, ap_CS_fsm_state5, ap_CS_fsm_state6, ap_CS_fsm_state2, grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_done, ap_CS_fsm_state4, icmp_ln1065_fu_82_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((upsizedCntr_4_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln1065_fu_82_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                elsif (((upsizedCntr_4_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln1065_fu_82_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                if (((lz77DownsizedStream_4_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                if (((lz77DownsizedStream_4_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;
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


    ap_ST_fsm_state2_blk_assign_proc : process(upsizedCntr_4_empty_n)
    begin
        if ((upsizedCntr_4_empty_n = ap_const_logic_0)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_done)
    begin
        if ((grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state5_blk_assign_proc : process(lz77DownsizedStream_4_full_n)
    begin
        if ((lz77DownsizedStream_4_full_n = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state6_blk_assign_proc : process(lz77DownsizedStream_4_full_n)
    begin
        if ((lz77DownsizedStream_4_full_n = ap_const_logic_0)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, lz77DownsizedStream_4_full_n, ap_CS_fsm_state6)
    begin
        if (((lz77DownsizedStream_4_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
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


    ap_ready_assign_proc : process(lz77DownsizedStream_4_full_n, ap_CS_fsm_state6)
    begin
        if (((lz77DownsizedStream_4_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_start <= grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_ap_start_reg;
    icmp_ln1065_fu_82_p2 <= "1" when (upsizedCntr_4_dout = ap_const_lv17_0) else "0";

    lz77DownsizedStream_4_blk_n_assign_proc : process(lz77DownsizedStream_4_full_n, ap_CS_fsm_state5, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) or (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            lz77DownsizedStream_4_blk_n <= lz77DownsizedStream_4_full_n;
        else 
            lz77DownsizedStream_4_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    lz77DownsizedStream_4_din_assign_proc : process(lz77DownsizedStream_4_full_n, ap_CS_fsm_state5, ap_CS_fsm_state6, grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77DownsizedStream_4_din, ap_CS_fsm_state4, tmp_s_fu_91_p3, p_02_fu_105_p3)
    begin
        if (((lz77DownsizedStream_4_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state6))) then 
            lz77DownsizedStream_4_din <= p_02_fu_105_p3;
        elsif (((lz77DownsizedStream_4_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            lz77DownsizedStream_4_din <= tmp_s_fu_91_p3;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            lz77DownsizedStream_4_din <= grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77DownsizedStream_4_din;
        else 
            lz77DownsizedStream_4_din <= grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77DownsizedStream_4_din;
        end if; 
    end process;


    lz77DownsizedStream_4_write_assign_proc : process(lz77DownsizedStream_4_full_n, ap_CS_fsm_state5, ap_CS_fsm_state6, grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77DownsizedStream_4_write, ap_CS_fsm_state4)
    begin
        if ((((lz77DownsizedStream_4_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state6)) or ((lz77DownsizedStream_4_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5)))) then 
            lz77DownsizedStream_4_write <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            lz77DownsizedStream_4_write <= grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77DownsizedStream_4_write;
        else 
            lz77DownsizedStream_4_write <= ap_const_logic_0;
        end if; 
    end process;


    lz77PassStream_4_read_assign_proc : process(grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77PassStream_4_read, ap_CS_fsm_state4)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            lz77PassStream_4_read <= grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_lz77PassStream_4_read;
        else 
            lz77PassStream_4_read <= ap_const_logic_0;
        end if; 
    end process;

    p_02_fu_105_p3 <= (ap_const_lv1_0 & p_0_0_032113_lcssa116_fu_46);
    tmp_s_fu_91_p3 <= (ap_const_lv1_0 & grp_receiveBuffer_9_24_Pipeline_buffer_assign_fu_67_p_phi_out);

    upsizedCntr_4_blk_n_assign_proc : process(upsizedCntr_4_empty_n, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            upsizedCntr_4_blk_n <= upsizedCntr_4_empty_n;
        else 
            upsizedCntr_4_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    upsizedCntr_4_read_assign_proc : process(upsizedCntr_4_empty_n, ap_CS_fsm_state2)
    begin
        if (((upsizedCntr_4_empty_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            upsizedCntr_4_read <= ap_const_logic_1;
        else 
            upsizedCntr_4_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;
