----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:39 11/15/2024 
-- Design Name: 
-- Module Name:    GPU - Behavioral 
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

entity GPU is port(
clock  	 : in std_logic;
number1   : in std_logic_vector(2 downto 0);
number2   : in std_logic_vector(2 downto 0);
result 	 : in std_logic;
operation : in std_logic_vector(1 downto 0);

hsync : out std_logic;
vsync : out std_logic;
color : out std_logic_vector(7 downto 0));
end GPU;

architecture Behavioral of GPU is

signal x : integer range 0 to 1023;
signal y : integer range 0 to 1023;

signal next_x : integer range 0 to 1023;
signal next_y : integer range 0 to 1023;



begin process (clock) begin
	if rising_edge(clock) then
		
		-- Generate Newline
		if (next_x=832) then
			next_x <= 0;
			if (next_y=520) then
				next_y <= 0;
			else next_y <= next_y + 1;
			end if;
		else next_x <= next_x + 1;
		end if;
		
		--  Generate HSYNC
		-- Visible Area: 640
		-- Front Porch:  24
		-- Sync Pulse:   40
		-- Back Porch:   128
		---------------------
		
		if (x > 664 AND x < 704) then hsync <= '0';
		else hsync <= '1';
		end if;
		
		--  Generate VsyNC
		-- Visible Area: 480
		-- Front Porch:  9
		-- Sync Pulse:   2
		-- Back Porch:   29
		---------------------
		
		if (y > 489 AND y < 491) then vsync <= '0';
		else vsync <= '1';
		end if;

		x <= next_x;
		y <= next_y;
	end if;
end process;

Video : ENTITY GUI PORT MAP(
clk => clock,
num1 => number1,
num2 => number2,
res => result,
op => operation,
color => color,
x => next_x,
y => next_y);

end Behavioral;

