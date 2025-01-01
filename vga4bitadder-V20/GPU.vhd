----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:14:16 11/09/2024 
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
-- VGA 640x480 @ 73Hz
--
-- hysnc:
--  Visible     : 640
--  Front Porch : 24
--  Sync Pulse  : 40
--  Back Porch  : 128
--  Whole line  : 832
--
--
-- vsync:
--   Visible     : 480
--   Front Porch : 9
--   Sync Pulse  : 2
--   Back Porch  : 29
--   Whole Frame : 520
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
clock  : in  std_logic;
value1 : in  std_logic_vector(3 Downto 0);
value2 : in  std_logic_vector(3 Downto 0);
result : in  std_logic_vector(4 Downto 0);
hsync  : out std_logic;
vsync  : out std_logic;
color  : out std_logic_vector(7 Downto 0)); 
end GPU;

architecture Behavioral of GPU is

signal x : integer range 0 to 1023;
signal y : integer range 0 to 1023;

signal next_x : integer range 0 to 1023;
signal next_y : integer range 0 to 1023;

begin process (clock) begin
	if rising_edge(clock) then
		if (next_x = 832) then
			next_x <= 0;
			if (next_y = 520) then next_y <= 0;
			else next_y <= next_y + 1;
			end if;

		else next_x <= next_x + 1;
		end if;
		
		-- HSYNC signal timing
		if (x > 664) AND (x < 704) then hsync <= '0';
		else hsync <= '1';
		end if;
		
		-- VSYNC signal timing
		if (y > 489) AND (y < 491) then vsync <= '0';
		else vsync <= '1';
		end if;
	
	x <= next_x;
	y <= next_y;
	
	end if;
end process;

Video : entity GUI port map(
x => next_x,
y => next_y,
clk => clock,
val1 => value1,
val2 => value2,
result => result,
color => color);


end Behavioral;

