----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2020 12:25:27 AM
-- Design Name: 
-- Module Name: multiplier - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
generic (w: integer:=10);
 Port (clk, rst, ld_en: in STD_LOGIC;
       si: in STD_LOGIC_VECTOR(w-1 downto 0);
       sout: out STD_LOGIC_VECTOR(1 downto 0));
end multiplier;

architecture Behavioral of multiplier is

signal temp: STD_LOGIC_VECTOR(w-1 downto 0):=(others=>'0');

begin

process (clk,rst,si)
    begin
        if (rst ='1') then
            temp <= (others => '0');
            elsif (rising_edge(clk)) then
                if (ld_en = '1') then
                    temp <= si;
                else
                    temp <= "00" & temp(9 downto 2);
          end if;
       end if;
end process;
sout <= temp(1 downto 0);

end Behavioral;

