----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:43:26 09/25/2024 
-- Design Name: 
-- Module Name:    display - Behavioral 
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

entity display is port(
clk : in std_logic;
x   : in integer range 0 to 1023;
y   : in integer range 0 to 1023;
color : out std_logic_vector(7 downto 0);
enabler : in std_logic_vector(2 downto 0)
);
end display;

architecture Behavioral of display is
begin
process (clk) is
begin
	if rising_edge(clk) then
		if ((x < 640) and (y < 480)) then
			if (x = 0) or (x = 639) or (y = 0) or (y = 479) then
				color <= x"00";
			else
				if (y < 200) then
					--generate red strip on the top of display
					if (enabler(0)='1') then
						color <= x"49";
					else color <= x"e0";
					end if;
				elsif (y < 370) then
					--generate green strip on the middle of display
					if enabler(1) = '1' then color <= x"1c";
					else color <= x"1c";
					end if;
				
				elsif (y < 400) then
					if enabler(2) = '1' then color <= x"03";
					else color <= x"03";
					end if;
				
				else
					--generate blue strip at the bottom of the display
					if enabler(2) = '1' then color <=x"03";
					else color <= x"03";
					end if;
				end if;
			end if;
		else
			color <= x"00";
		end if;
	end if;

end process;

end Behavioral;

