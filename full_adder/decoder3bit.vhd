----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:04 11/04/2024 
-- Design Name: 
-- Module Name:    decoder2bit - Behavioral 
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

entity decoder3bit is port(
input  : in  std_logic_vector(2 downto 0);
output : out std_logic_vector(7 downto 0));
end decoder3bit;

architecture Behavioral of decoder3bit is begin

WITH input SELECT output <=
	"00000011" WHEN "000", -- 0
	"10011111" WHEN "001", -- 1
	"00100101" WHEN "010", -- 2
	"00001101" WHEN "011", -- 3
	"10011001" WHEN "100", -- 4
	"01001001" WHEN "101", -- 5
	"01000001" WHEN "110", -- 6
	"00011111" WHEN OTHERS;

end Behavioral;

