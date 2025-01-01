----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:55:57 11/10/2024 
-- Design Name: 
-- Module Name:    DCD - Behavioral 
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
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DCD is port(
numberI : in  std_logic_vector(4 downto 0);
disp1   : out std_logic_vector(7 downto 0);
disp2   : out std_logic_vector(7 downto 0);
disp3   : out std_logic_vector(7 downto 0));
end DCD;

architecture Behavioral of DCD is

signal number : integer;

begin process (number) begin
	case number is
		when (number < 10) =>
			disp1 <= X"FF";
			disp2 <= X"FF";
			if    (number=0) then disp3 <= B"00000011";
			elsif (number=1) then disp3 <= B"10011111";
			elsif (number=2) then disp3 <= B"00100101";
			elsif (number=3) then disp3 <= B"00001101";
			elsif (number=4) then disp3 <= B"10011001";
			elsif (number=5) then disp3 <= B"01001001";
			elsif (number=6) then disp3 <= B"01000001";
			elsif (number=7) then disp3 <= B"00011111";
			elsif (number=8) then disp3 <= B"00000001";
			else disp3 <= B"00011001";
			end if;
		
		when ((number >= 10) AND (number < 20)) =>
			disp1 <= X"FF";
			disp2 <= B"01100000";
			
			if    (number=10) then disp3 <= B"00000011";
			elsif (number=11) then disp3 <= B"10011111";
			elsif (number=12) then disp3 <= B"00100101";
			elsif (number=13) then disp3 <= B"00001101";
			elsif (number=14) then disp3 <= B"10011001";
			elsif (number=15) then disp3 <= B"01001001";
			elsif (number=16) then disp3 <= B"01000001";
			elsif (number=17) then disp3 <= B"00011111";
			elsif (number=18) then disp3 <= B"00000001";
			else disp3 <= B"00011001";
			end if;
		
		when ((number >= 20) AND (number < 30)) =>
			disp1 <= X"FF";
			disp2 <= B"00100101";
			
			if    (number=20) then disp3 <= B"00000011";
			elsif (number=21) then disp3 <= B"10011111";
			elsif (number=22) then disp3 <= B"00100101";
			elsif (number=23) then disp3 <= B"00001101";
			elsif (number=24) then disp3 <= B"10011001";
			elsif (number=25) then disp3 <= B"01001001";
			elsif (number=26) then disp3 <= B"01000001";
			elsif (number=27) then disp3 <= B"00011111";
			elsif (number=28) then disp3 <= B"00000001";
			else disp3 <= B"00011001";
			end if;
		
		when ((number >= 30) AND (number < 32)) =>
			disp1 <= X"FF";
			disp2 <= "00001101";
			
			if    (number=30) then disp3 <= B"00000011";
			elsif (number=31) then disp3 <= B"10011111";
			elsif (number=32) then disp3 <= B"00100101";
			else disp3 <= B"11111111";
			end if;
		
		--Err code
		when others =>
			disp1 <= B"01100001"; --E
			disp2 <= B"11011101"; --r
			disp3 <= B"11011101"; --r
	end case;
end process;

number <= to_integer(UNSIGNED(numberI));

end Behavioral;

