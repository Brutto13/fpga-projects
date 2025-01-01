----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:23 11/18/2024 
-- Design Name: 
-- Module Name:    MATH - Behavioral 
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

entity MATH is port(
bin1 : in  std_logic_vector(2 downto 0);
bin2 : in  std_logic_vector(2 downto 0);
oper : in  std_logic;
res  : out std_logic_vector(3 downto 0);
sign : out std_logic);
end MATH;

architecture Behavioral of MATH is

signal result : unsigned(3 downto 0);
signal sign_t : std_logic;

--signal add_res : unsigned(3 downto 0);
--signal sub_res : unsigned(3 downto 0);

begin process (bin1, bin2, oper) begin
	CASE oper IS
		WHEN '0' =>
			--Adding
			sign_t <= '1';
			result <= unsigned('0'&(not bin1))+unsigned('0'&(not bin2));
		
		WHEN OTHERS =>
			if (unsigned(not bin1)<unsigned(not bin2)) then
				sign_t <= '0';
				result <= unsigned('0'&(not bin2))-unsigned('0'&(not bin1));
			else
				sign_t <= '1';
				result <= unsigned('0'&(not bin1))-unsigned('0'&(not bin2));
			end if;
	END CASE;
end process;

sign <= sign_t;
res <= STD_LOGIC_VECTOR(result);
			
			
--add_res <= ('0' & unsigned(not bin1)) + ('0' & unsigned(not bin2));
--sub_res <= ('0' & unsigned(not bin1)) - ('0' & unsigned(not bin2));

--WITH oper SELECT res <=
--	std_logic_vector(add_res) WHEN '0',
--	std_logic_vector(sub_res) WHEN OTHERS;



end Behavioral;

