----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2020 12:28:08 AM
-- Design Name: 
-- Module Name: hadder - Behavioral
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

entity hadder is
generic (w: integer:=8);
    Port ( a : in STD_LOGIC_VECTOR(w-1 downto 0);
           b : in STD_LOGIC_VECTOR(w-1 downto 0);
           sum : out STD_LOGIC_VECTOR(w downto 0));
end hadder;

architecture Behavioral of hadder is

signal temp_sum: STD_LOGIC_VECTOR(w downto 0):=(others=>'0');

begin
process(a,b)
    begin
    temp_sum <= STD_LOGIC_VECTOR(('0' & unsigned(a)) + ('0'& unsigned(b)));
end process;

sum <= temp_sum;

end Behavioral;

