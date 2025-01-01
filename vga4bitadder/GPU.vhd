----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:32:58 11/07/2024 
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
GPUClk  : in  std_logic;
request : in  std_logic_vector(4 downto 0);
hsync   : out std_logic;
vsync	  : out std_logic;
color   : out std_logic_Vector(7 Downto 0));
end GPU;

architecture Behavioral of GPU is

signal x : integer range 1023 downto 0 := 0;
signal y : integer range 1023 downto 0 := 0;

signal next_x : integer range 1023 downto 0 := 0;
signal next_y : integer range 1023 downto 0 := 0;

begin process (GPUClk) is begin
	if rising_edge(GPUClk) then
		if (next_x=799) then
			next_x <= 0;
			if (next_y=525) then
				next_y <= 0;
			else next_y <= next_y + 1;
			end if;
		else next_x <= next_x + 1;
		end if;
		
		-- VSYNC signal
		if (y >= 490) AND (y < 492) then vsync <= '0';
		else vsync <= '1';
		end if;
		
		-- HSYNC signal
		if (x >= 656) AND (x < 752) then hsync <= '0';
		else hsync <= '1';
		end if;
		
		x <= next_x;
		y <= next_y;
	end if;
end process;


video : entity Video port map(
clk => GPUClk,
x => next_x,
y => next_y,
r => request,
c => color);

end Behavioral;

