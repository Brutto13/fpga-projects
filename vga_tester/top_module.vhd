----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:10 09/25/2024 
-- Design Name: 
-- Module Name:    top_module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is port(
clk : in std_logic;
hsync : out std_logic;
vsync : out std_logic;
red : out std_logic_vector(2 downto 0);
green : out std_logic_vector(2 downto 0);
blue : out std_logic_vector(2 downto 1);
enabler : in std_logic_vector(2 downto 0));
end top_module;

architecture Behavioral of top_module is

component pll is port(
CLKIN_IN : in std_logic;
CLKFX_OUT : out std_logic);
end component;

signal clk_pll : std_logic;

begin
pixel_clock : pll port map(CLKIN_IN => clk, CLKFX_OUT => clk_pll);
display : entity timings port map (clk => clk_pll, hsync => hsync, vsync => vsync,
red => red, green => green, blue => blue, enabler => enabler);


end Behavioral;

