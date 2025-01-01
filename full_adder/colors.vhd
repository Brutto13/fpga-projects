----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:37 11/04/2024 
-- Design Name: 
-- Module Name:    colors - Behavioral 
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

entity colors is port(
clock   : in  std_logic;
request : in  std_logic_vector(3 downto 0);
color   : out std_logic_Vector(7 downto 0);
x : in integer range 0 to 1023;
y : in integer range 0 to 1023);
end colors;

architecture Behavioral of colors is

begin process (clock) begin if rising_edge(clock) then
	if (x<640) and (y<480) then
		if (x=0) or (x=639) or (y=0) or (y=479) then
			color <= X"FF";
		else
			if (x < 115) then
				if request(0)='1' then color <= X"FF";
				else color <= X"00";
				end if;
				
			elsif (x < 230) then
				if request(1)='1' then color <= X"FF";
				else color <= X"00";
				end if;
			
			elsif (x < 480) then
				if request(2)='1' then color <= X"FF";
				else color <= X"00";
				end if;

			else
				if request(3)='1' then color <= X"FF";
				else color <= X"00";
				end if;

			end if;
		end if;
	else color <= X"00";
	end if;
end if;
end process;


end Behavioral;

