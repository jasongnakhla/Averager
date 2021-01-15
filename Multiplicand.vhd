----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2020 12:33:38 AM
-- Design Name: 
-- Module Name: multiplicand - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplicand is
generic (w: integer:=6);
Port (clk,rst: in STD_LOGIC;
      sin : in STD_LOGIC_VECTOR(w-1 downto 0);
      s_out: out STD_LOGIC_VECTOR(w+1 downto 0);
      sel: in STD_LOGIC_VECTOR(1 downto 0));
end multiplicand;

architecture Behavioral of multiplicand is

signal temp: STD_LOGIC_VECTOR(w-1 downto 0):=(others=>'0');
signal a, a2, a3: std_logic_vector (7 downto 0); 

begin

process (clk,rst,sin)
    begin
        if (rst = '1') then
            temp <= (others => '0');
        elsif clk'event and clk='1' then
            temp <= sin;
       end if;
end process;

a <= "00" & temp;
a2 <= '0' & temp & '0';
a3 <= std_logic_vector(unsigned(a) + unsigned(a2));

s_out <= (others => '0') when sel = "00" else 
          a when sel = "01" else
          a2 when sel = "10" else
          a3;
          
          

end Behavioral;
