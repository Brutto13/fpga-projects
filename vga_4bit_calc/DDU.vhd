----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:33:56 11/19/2024 
-- Design Name: 
-- Module Name:    DDU - Behavioral 
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

entity DDU is port(
num   : in  std_logic_vector(3 downto 0);
sgn   : in  std_logic;
disp1 : out std_logic_vector(7 downto 0);
disp2 : out std_logic_vector(7 downto 0);
disp3 : out std_logic_vector(7 downto 0));
end DDU;

architecture Behavioral of DDU is

--signal number : unsigned(3 downto 0);

begin process (num, sgn) begin
	case num is
		when "0000" => -- 0
			if sgn='1' then disp2 <= X"FF";
			else disp2 <= "00111111";
			end if;
			disp3 <= "01000000";
			disp1 <= X"FF";
		
		when "0001" => -- 1
			if sgn='1' then disp2 <= X"FF";
			else disp2 <= "10111111";
			end if;
			disp3 <= "01111001";
			disp1 <= X"FF";
		
		when "0010" => -- 2
			if sgn='1' then disp2 <= X"FF";
			else disp2 <= "10111111";
			end if;
			disp3 <= "10100100";
			disp1 <= X"FF";
		
		when "0011" => -- 3
			if sgn='1' then disp2 <= X"FF";
			else disp2 <= "10111111";
			end if;
			disp3 <= "10110000";
			disp1 <= X"FF";
		
		when "0100" => -- 4
			if sgn='1' then disp2 <= X"FF";
			else disp2 <= "10111111";
			end if;
			disp3 <= "00011001";
			disp1 <= X"FF";
		
		when "0101" => -- 5
			if sgn='1' then disp2 <= X"FF";
			else disp2 <= "10111111";
			end if;
			disp3 <= "00010010";
			disp1 <= X"FF";
		
		when "0110" => -- 6
			if sgn='1' then disp2 <= X"FF";
			else disp2 <= "10111111";
			end if;
			disp3 <= "00000010";
			disp1 <= X"FF";
		
		when "0111" => -- 7
			if sgn='1' then disp2 <= X"FF";
			else disp2 <= "10111111";
			end if;
			disp3 <= "01111000";
			disp1 <= X"FF";
		
		when "1000" => -- 8
			if sgn='1' then disp2 <= X"FF";
			else disp2 <= "10111111";
			end if;
			disp3 <= "00000000";
			disp1 <= X"FF";
		
		when "1001" => -- 9
			if sgn='1' then disp2 <= X"FF";
			else disp2 <= "10111111";
			end if;
			disp3 <= "00010000";
			disp1 <= X"FF";
		
		when "1010" => -- 10
			if sgn='1' then disp1 <= X"FF";
			else disp1 <= "01111111";
			end if;
			disp2 <= "11111001";
			disp3 <= "11000000";
		
		when "1011" => -- 11
			if sgn='1' then disp1 <= X"FF";
			else disp1 <= "01111111";
			end if;
			disp2 <= "11111001";
			disp3 <= "11111001";
		
		when "1100" => -- 12
			if sgn='1' then disp1 <= X"FF";
			else disp1 <= "01111111";
			end if;
			disp2 <= "11111001";
			disp3 <= "10100100";
		
		when "1101" => --13
			if sgn='1' then disp1 <= X"FF";
			else disp1 <= "01111111";
			end if;
			disp2 <= "11111001";
			disp3 <= "10110000";
		
		when "1110" => -- 14
			if sgn='1' then disp1 <= X"FF";
			else disp1 <= "01111111";
			end if;
			disp2 <= "11111001";
			disp3 <= "10011001";
		
		when others => -- 15
			if sgn='1' then disp1 <= X"FF";
			else disp1 <= "01111111";
			end if;
			disp2 <= "11111001";
			disp3 <= "10010010";
		
	end case;
	
end process;

--disp1 <= X"ff";


--WITH sgn SELECT disp1 <=
--	x"ff" 		WHEN '0',
--	B"11111101" WHEN OTHERS;
--disp1 <= X"FF";
end Behavioral;

