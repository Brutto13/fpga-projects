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
input  : std_logic_vector(2 downto 0);
output : std_logic_vector(7 downto 0));
end decoder3bit;

architecture Behavioral of decoder3bit is begin

WITH input SELECT output <=
	"11111100" WHEN "00",
	"10011111" WHEN "01",
	"00100101" WHEN "10",
	"

end Behavioral;

