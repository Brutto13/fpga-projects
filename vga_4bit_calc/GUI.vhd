----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:24 11/18/2024 
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
clk   : in  std_logic;
b1    : in  std_logic_vector(2 downto 0);
b2    : in  std_logic_vector(2 downto 0);
res   : in  std_logic_vector(3 downto 0);
oper  : in  std_logic;
sign  : in  std_logic;
x     : in  integer range 0 to 1023;
y     : in  integer range 0 to 1023;
color : out std_logic_vector(7 downto 0));
end GUI;

architecture Behavioral of GUI is

signal active_result : std_logic_vector(7 downto 0);

constant enabled    : std_logic_vector(7 downto 0) := "00111000";
constant disabled   : std_logic_vector(7 downto 0) := "00000111";
constant background : std_logic_vector(7 downto 0) := X"00";

begin

with sign select active_result <=
	"11000000" when '0',
	"00111000" when others;

process (clk) begin
	if rising_edge(clk) then
		-- Visible Area
		IF (x<640 AND y<480) then
		
			-- Square 1 (line 1)
			if (x>=200 AND x<=300 AND y>=50 AND y<=150) then
				--Draw
				if (x=200 or x=300 or y=50 or y=150) then color <= X"FF";
				
				-- Fill
				else
					if (b1(2)='0') then color <= enabled;
					else color <= disabled;
					end if;
				end if;
			
			-- Square 2 (line 1)
			elsif (x>=350 AND x<=450 AND y>=50 AND y<=150) then
				-- Draw
				if (x=350 OR x=450 OR y=50 OR y=150) then color <= X"FF";
				
				-- Fill
				else
					if (b1(1)='0') then color <= enabled;
					else color <= disabled;
					end if;
				end if;
			
			-- Square 3 (line 1)
			elsif (x>=500 AND x<=600 AND y>=50 AND y<=150) then
				--Draw
				if (x=500 OR x=600 OR y=50 OR y=150) then color <= X"FF";
				
				--Fill
				else
					if (b1(0)='0') then color <= enabled;
					else color <= disabled;
					end if;
				end if;
			
			-- Square 1 (line 2)
			elsif (x>=200 AND x<=300 AND y>=200 AND y<=300)then
				--Draw
				if (x=200 OR x=300 OR y=200 OR y=300) then
					color <= X"FF";
				
				else
					if (b2(2)='0') then color <= enabled;
					else color <= disabled;
					end if;
				end if;
			
			-- Square 2 (line 2)
			elsif (x>=350 AND x<=450 AND y>=200 AND y<=300) then
				--Draw
				if (x=350 or x=450 or y=200 or y=300) then color <= X"FF";
				
				--Fill
				else
					if (b2(1)='0') then color <= enabled;
					else color <= disabled;
					end if;
				end if;
			
			-- Square 3 (line 2)
			elsif (x>=500 AND x<=600 AND y>=200 AND y<=300) then
				-- Draw
				if (x=500 or x=600 or y=200 or y=300) then color <= X"FF";
				else
					if (b2(0)='0') then color <= enabled;
					else color <= disabled;
					end if;
				end if;					
			
			elsif (x>=40 and x<=160 and y>=200 and y<=300) then
				if (y>240 and y<260) then
					if oper='0' then color <= enabled;
					else color <= disabled;
					end if;
				else color <= background;
				end if;
				
				if oper='0' then
					if (x>=90 and x<=110) then
						color <= enabled;
					end if;
				end if;
				
--			elsif (x>=75 AND x<=125 AND y>=200 AND y<=250) then
--				if (oper='0') then color <= "00111000";se
--				else if (y>=417 AND y<433) then color <= B"00000111";
--						else color <= background;
--						end if;
--				end if;
			
			-- Square 1 (line 3)
			elsif (x>=50 AND x<=150 AND y>=350 AND y<=450) then
				if (x=50 or x=150 or y=350 or y=450) then color <= X"FF";
				else
					if (res(3)='1') then color <= active_result;
					else color <= disabled;
					end if;
				end if;
			
			-- Square 2 (line 3)
			elsif (x>=200 AND x<=300 AND y>=350 AND y<=450) then
				if (x=200 or x=300 or y=350 or y=450) then color <= X"FF";
				else
					if (res(2)='1') then color <= active_result;
					else color <= disabled;
					end if;
				end if;
			
			-- Square 3 (line 3)
			elsif (x>=350 AND x<=450 AND y>=350 AND y <=450) then
				if (x=350 or x=450 or y=350 or y=450) then color <= X"FF";
				else
					if (res(1)='1') then color <= active_result;
					else color <= disabled;
					end if;
				end if;
			
			-- Square 4 (line 3)
			elsif (x>=500 and x<=600 and y>=350 and y<=450) then
				if (x=500 or x=600 or y=350 or y=450) then color <= X"FF";
				else
					if (res(0)='1') then color <= active_result;
					else color <= disabled;
					end if;
				end if;
			
			-- Separate lines 2 & 3
			elsif (y=325) then
				if (oper='0') then color <= B"00111000";
				else color <= B"00000111";
				end if;

			-- Unused Area
			else color <= background;
			end if;
		-- Banking Area
		else color <= X"00";
		end if;
	end if;
end process;


end Behavioral;

