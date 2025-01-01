----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:39 11/14/2024 
-- Design Name: 
-- Module Name:    MPU - Behavioral 
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
-- Lines 44, 50, 52-56 for Division and Multiplication
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

entity MPU is port(
num1 		 : in  std_logic_vector(2 downto 0);
num2 		 : in  std_logic_vector(2 downto 0);
operation : in  std_logic;
result    : out std_logic_vector(3 downto 0));
end MPU;

architecture Behavioral of MPU is

signal add_res : std_logic_vector(3 downto 0);
signal sub_res : std_logic_vector(2 downto 0);
--signal mul_res : std_logic_vector(6 downto 0);
--signal div_res : std_logic_vector(3 downto 0);

begin
--Addition/Substraction/Multiplication/Division Calculations here:
add_res <= STD_LOGIC_VECTOR(UNSIGNED('0'&num1) + UNSIGNED('0'&num2));
sub_res <= STD_LOGIC_VECTOR(UNSIGNED('0'&num1) - UNSIGNED('0'&num2));
--mul_res <= STD_LOGIC_VECTOR(UNSIGNED(num1) * UNSIGNED(num2));

--Division : Process (num1, num2) begin
--	if (UNSIGNED(num2) /= 0) then div_res <= STD_LOGIC_VECTOR((UNSIGNED(num1)/UNSIGNED(num2)));
--	else div_res <= "1111";
--	end if;
--End Process Division;

WITH operation SELECT result <=
	add_res     WHEN '0',
	'0'&sub_res WHEN OTHERS;


end Behavioral;

