----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:34:27 11/07/2024 
-- Design Name: 
-- Module Name:    adder - Behavioral 
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

entity adder is port(
bin1 : in  std_logic_Vector(3 downto 0);
bin2 : in  std_logic_Vector(3 downto 0);
outp : out std_logic_Vector(4 downto 0));
end adder;

architecture Behavioral of adder is

signal binary1 : signed(3 downto 0);
signal binary2 : signed(3 downto 0);
signal result  : signed(4 downto 0);

begin
binary1 <= SIGNED(not bin1);
binary2 <= SIGNED(not bin2);

result <= ('0'&binary1) + ('0'&binary2);
outp <= STD_LOGIC_VECTOR(result);


end Behavioral;