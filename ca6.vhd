----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2020 12:30:54 AM
-- Design Name: 
-- Module Name: ca6 - Behavioral
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

entity ca6 is
  Port (clk, rst, mult_en: in STD_LOGIC;
        x: in STD_LOGIC_VECTOR(9 downto 0);
        y: in STD_LOGIC_VECTOR(5 downto 0);
        product: out STD_LOGIC_VECTOR(15 downto 0));
end ca6;

architecture Behavioral of ca6 is

component hadder is
generic (w: integer:=8);
    Port ( a : in STD_LOGIC_VECTOR(w-1 downto 0);
           b : in STD_LOGIC_VECTOR(w-1 downto 0);
           sum : out STD_LOGIC_VECTOR(w downto 0));
end component;

component multiplier is
generic (w: integer:=10);
 Port (clk, rst, ld_en: in STD_LOGIC;
       si: in STD_LOGIC_VECTOR(w-1 downto 0);
       sout: out STD_LOGIC_VECTOR(1 downto 0));
end component;

component multiplicand is
generic (w: integer:=6);
Port (clk,rst: in STD_LOGIC;
      sin : in STD_LOGIC_VECTOR(w-1 downto 0);
      s_out: out STD_LOGIC_VECTOR(w+1 downto 0);
      sel: in STD_LOGIC_VECTOR(1 downto 0));
end component;

component DWPP is
    Port ( clk : in STD_LOGIC;
           rst: in STD_LOGIC;
           d : in STD_LOGIC_VECTOR(8 downto 0);
           q_hadder : out STD_LOGIC_VECTOR(7 downto 0);
           q_product : out STD_LOGIC_VECTOR(15 downto 0));
end component;


signal xj: STD_LOGIC_VECTOR(1 downto 0);
signal hadder_cout: STD_LOGIC:='0';
signal mux_a, multiplicand_out: STD_LOGIC_VECTOR(7 downto 0);
signal add_cout, DWPP_out: STD_LOGIC_VECTOR(7 downto 0);
signal hadder_sum: STD_LOGIC_VECTOR(8 downto 0);
signal final_output: STD_LOGIC_VECTOR(15 downto 0);
begin


multiplier_x:  multiplier port map(clk => clk, rst => rst, ld_en => mult_en, si => x, sout => xj);
Multiplicand_a: multiplicand port map(clk => clk, rst => rst, sin => y, s_out => multiplicand_out, sel => xj);

half_adder: hadder port map( a => multiplicand_out, b => DWPP_out, sum => hadder_sum);
DWPP_shift: DWPP port map(clk => clk, rst => rst, d => hadder_sum, q_hadder => DWPP_out, q_product => final_output); 

product <= final_output;

end Behavioral;
