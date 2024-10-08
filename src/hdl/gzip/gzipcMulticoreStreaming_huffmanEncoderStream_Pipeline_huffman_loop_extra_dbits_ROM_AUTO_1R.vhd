-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Tool Version Limit: 2022.04
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity gzipcMulticoreStreaming_huffmanEncoderStream_Pipeline_huffman_loop_extra_dbits_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 4; 
             AddressWidth     : integer := 5; 
             AddressRange    : integer := 30
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of gzipcMulticoreStreaming_huffmanEncoderStream_Pipeline_huffman_loop_extra_dbits_ROM_AUTO_1R is 

signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem : mem_array := (
    0 to 3=> "0000", 4 to 5=> "0001", 6 to 7=> "0010", 8 to 9=> "0011", 10 to 11=> "0100", 
    12 to 13=> "0101", 14 to 15=> "0110", 16 to 17=> "0111", 18 to 19=> "1000", 20 to 21=> "1001", 
    22 to 23=> "1010", 24 to 25=> "1011", 26 to 27=> "1100", 28 to 29=> "1101" );


begin 


memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(address0_tmp)); 
        end if;
    end if;
end process;

end rtl;

