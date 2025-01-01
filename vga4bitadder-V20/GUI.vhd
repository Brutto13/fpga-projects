----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:28 11/09/2024 
-- Design Name: 
-- Module Name:    GUI - Behavioral 
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

entity GUI is port(
x : integer range 0 to 1023;
y : integer range 0 to 1023;
clk    : in  std_logic;
val1   : in  std_logic_vector(3 downto 0);
val2   : in  std_logic_vector(3 downto 0);
result : in  std_logic_vector(4 downto 0);
color  : out std_logic_vector(7 downto 0));
end GUI;

architecture Behavioral of GUI is

begin process (clk) begin
	if rising_edge(clk) then
		
		-- Visible Area
		if (x < 640) AND (y < 480) then

			-- First (1st) Zone (Y < 160)
			if (y < 160) then
				-- 1st segment (VAL_1 4th bit)
				if (x > 0 AND x < 160) then
					if val1(3)='0' then color <= X"FF";
					else color <= X"00";
					end if;
				
				-- 2nd segment (VAL_1 3rd bit)
				elsif (x > 160 AND x < 320) then
					if val1(2)='0' then color <= X"FF";
					else color <= X"00";
					end if;
				
				--3rd segment (VAL_1 2nd bit)
				elsif (x > 320 AND x < 480) then
					if val1(1)='0' then color <= X"FF";
					else color <= X"00";
					end if;
				
				-- 4th segment (VAL_1 1st bit)
				elsif (x > 480 AND x < 640) then
					if val1(0)='0' then color <= X"FF";
					else color <= X"00";
					end if;
				
				-- Segment Separators
				else color <= X"F4";
				end if;
				
			
			--Separator 1st and 2nd zone (y=160)
			elsif (y=160) then color <= B"10000000";
			
			-- Second (2nd) Zone (Y > 160 AND Y < 320)
			elsif (y > 160 AND Y < 320) then
				-- 1st Segment (VAL_2 4th bit)
				if (x > 0 AND x < 160) then
					if val2(3)='0' then color <= X"FF";
					else color <= X"00";
					end if;
				
				--2nd segment (VAL_2 3rd bit)
				elsif (x > 160 AND x < 320) then
					if val2(2)='0' then color <= X"FF";
					else color <= X"00";
					end if;
				
				--3rd segment (VAL_2 2nd bit)
				elsif (x > 320 AND x < 480) then
					if val2(1)='0' then color <= X"FF";
					else color <= X"00";
					end if;
				
				--4th segment (VAL_2 1st bit)
				elsif (x > 480 AND x < 640) then
					if val2(0)='0' then color <= X"FF";
					else color <= X"00";
					end if;
				
				-- Segment Separators
				else color <= X"F4";
				end if;
			
			-- Separator Zones 2ND and 3RD (y=320)
			elsif (y=320) then color <= B"00111000";
			
			--Zone 3rd (y > 320 AND y < 460)
			elsif (y > 320 AND y<480) then
				--Segment 1 (RESULT 5th bit)
				if (x > 0 AND x < 128) then
					if result(4)='1' then color <= X"FF";
					else color <= X"00";
					end if;
				
				--Segment 2 (RESULT 4th bit)
				elsif (x > 128 AND x < 256) then
					if result(3)='1' then color <= X"FF";
					else color <= X"00";
					end if;
				
				--Segment 3 (RESULT 3rd bit)
				elsif (x > 256 AND x < 384) then
					if result(2)='1' then color <= X"FF";
					else color <= X"00";
					end if;
				
				--Segment 4 (RESULT 2nd bit)
				elsif (x > 384 AND x < 512) then
					if result(1)='1' then color <= X"FF";
					else color <= X"00";
					end if;
				
				--Segment 5 (RESULT 1st bit)
				elsif (x > 512 AND x < 640) then
					if result(0)='1' then color <= X"FF";
					else color <= X"00";
					end if;
				
				--Segment Separator
				else color <= X"1C";
				end if;
			
			-- End Of Display (y=480)
			else color <= X"FF";
			end if;
		
		-- Blanking Area
		else color <= X"00";
		end if;
	end if;
end process;
			
end Behavioral;

