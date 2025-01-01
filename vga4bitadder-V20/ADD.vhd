----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:01:25 11/09/2024 
-- Design Name: 
-- Module Name:    ADD - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD is port(
bin1 : in  std_logic_Vector(3 Downto 0);
bin2 : in  std_logic_Vector(3 Downto 0);
outp : out std_logic_Vector(4 Downto 0));
end ADD;

architecture Behavioral of ADD is

begin

outp <= STD_LOGIC_VECTOR(UNSIGNED('0'&(not bin1)) + UNSIGNED('0'&(not bin2)));

end Behavioral;

