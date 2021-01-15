----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2020 12:36:20 AM
-- Design Name: 
-- Module Name: ca6_tb - Behavioral
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

entity ca6_tb is
--  Port ( );
end ca6_tb;

architecture Behavioral of ca6_tb is

component ca6 is
  Port (clk, rst, mult_en: in STD_LOGIC;
        x: in STD_LOGIC_VECTOR(9 downto 0);
        y: in STD_LOGIC_VECTOR(5 downto 0);
        product: out STD_LOGIC_VECTOR(15 downto 0));
end component;

signal clk_int, rst_int, en_int: STD_LOGIC;
signal x_int: STD_LOGIC_VECTOR(9 downto 0);
signal y_int: STD_LOGIC_VECTOR(5 downto 0);
signal product_int: STD_LOGIC_VECTOR(15 downto 0);
constant cp: time:= 10ns;

begin

uut: ca6 port map(clk => clk_int, rst => rst_int, mult_en => en_int, x => x_int, y => y_int, product => product_int);

-- clock
process
begin
clk_int <= '1';
wait for cp/2;
clk_int <= '0';
wait for cp/2;
end process;

-- reset
process
begin
rst_int <= '1';
wait for cp;
rst_int <= '0';
wait;
end process;

process
begin
wait for cp;
en_int <= '1';
wait for cp;
en_int <= '0';
wait;
end process;


-- Multiplier
process
begin
--x_int <= "0100111111";
x_int <= "1110111000";
wait;
end process;

-- Multiplicand
process
begin
--y_int <= "011110";
y_int <= "110110";
wait;
end process;
end Behavioral;

