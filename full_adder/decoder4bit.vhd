----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:16:10 11/04/2024 
-- Design Name: 
-- Module Name:    decoder4bit - Behavioral 
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

entity decoder4bit is port(
input  : in  std_logic_vector(3 downto 0);
output : out std_logic_vector(7 downto 0));
end decoder4bit;

architecture Behavioral of decoder4bit is

begin

WITH input SELECT output <=
	"00000011" WHEN "0000", -- 0
	"10011111" WHEN "0001", -- 1
	"00100101" WHEN "0010", -- 2
	"00001101" WHEN "0011", -- 3
	"10011001" WHEN "0100", -- 4
	"01001001" WHEN "0101", -- 5
	"01000001" WHEN "0110", -- 6
	"00011111" WHEN "0111", -- 7
	"00000001" WHEN "1000", -- 8
	"00001001" WHEN "1001", -- 9
	"00010001" WHEN "1010", -- A
	"11000001" WHEN "1011", -- B (b)
	"11100101" WHEN "1100", -- C (c)
	"10000101" WHEN "1101", -- D (d)
	"01100001" WHEN "1110", -- E
	"01110001" WHEN OTHERS; -- F

end Behavioral;

