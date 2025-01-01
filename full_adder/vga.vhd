----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:21:56 11/04/2024 
-- Design Name: 
-- Module Name:    vga - Behavioral 
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

entity vga is port(
clock  : in  std_logic;
result : in  std_logic_Vector(3 downto 0);
hsync  : out std_logic;
vsync  : out std_logic;
color  : out std_logic_vector(7 downto 0));
end vga;

architecture Behavioral of vga is

signal next_x : integer range 0 to 1023 := 0;
signal next_y : integer range 0 to 1023 := 0;

signal x : integer range 0 to 1023 := 0;
signal y : integer range 0 to 1023 := 0;

begin

video : entity colors port map(
clock => clock,
x => next_x,
y => next_y,
request => result,
color => color);

process (clock) begin if rising_edge(clock) then
	if (next_x=799) then
		next_x <= 0;
		if (next_y=525) then
			next_y <= 0;
		else next_y <= next_y + 1;
		end if;
	else next_x <= next_x + 1;
	end if;
	
	if (y >= 490 and y < 492) then vsync <= '0';
	else vsync <= '1';
	end if;
	
	if (x >= 656 and x < 752) then hsync <= '0';
	else hsync <= '1';
	end if;
	
	x <= next_x;
	y <= next_y;
end if;
end process;


end Behavioral;

