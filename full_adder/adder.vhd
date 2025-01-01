----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:06:58 11/04/2024 
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
num1 : in  std_logic_vector(2 downto 0);
num2 : in  std_logic_vector(2 downto 0);
outp : out std_logic_vector(3 downto 0));
end adder;

architecture Behavioral of adder is

signal bin1 : unsigned(2 downto 0);
signal bin2 : unsigned(2 downto 0);

begin
bin1 <= unsigned((NOT num1));
bin2 <= unsigned((NOT num2));

outp <= STD_LOGIC_VECTOR((bin1+bin2));

end Behavioral;

