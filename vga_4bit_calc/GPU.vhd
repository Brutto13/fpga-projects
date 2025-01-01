----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:54:21 11/18/2024 
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
clock : in  std_logic;
bin1  : in  std_logic_vector(2 downto 0);
bin2  : in  std_logic_vector(2 downto 0);
res   : in  std_logic_vector(3 downto 0);
oper  : in  std_logic;
sign  : in  std_logic;
hsync : out std_logic;
vsync : out std_logic;
color : out std_logic_vector(7 downto 0));
end GPU;

architecture Behavioral of GPU is

signal x : integer range 0 to 1023;
signal y : integer range 0 to 1023;

signal next_x : integer range 0 to 1023;
signal next_y : integer range 0 to 1023;

component GUI is port(
clk   : in  std_logic;
b1    : in  std_logic_vector(2 downto 0);
b2    : in  std_logic_vector(2 downto 0);
oper  : in  std_logic;
res   : in  std_logic_vector(3 downto 0);
sign  : in  std_logic;
x     : in  integer range 0 to 1023;
y     : in  integer range 0 to 1023;
color : out std_logic_vector(7 downto 0));
end component;

begin process (clock) begin
	if rising_edge(clock) then
		
		--Newline (\n)
		if (next_x=831) then
			next_x <= 0;
			if (next_y=519) then next_y <= 0;
			else next_y <= next_y + 1;
			end if;
		else next_x <= next_x + 1;
		end if;
		
		-- HSYNC timing
		-- Visible Area : 640
		-- Front Porch  :  24
		-- Sync Pulse   :  40
		-- Back Porch   : 128
		-- Whole Line   : 832
		
		if (x>664 AND x<704) then hsync <= '0';
		else hsync <= '1';
		end if;
		
		
		-- VSYNC timing
		-- Visible Area : 480
		-- Front Porch  :   9
		-- Sync Pulse   :   2
		-- Back Porch   :  29
		-- Whole Frame  : 520
		
		if (y>489 AND y<491) then vsync <= '0';
		else vsync <= '1';
		end if;
		
		x <= next_x;
		y <= next_y;
	end if;
end process;

Video : GUI port map(
clk => clock,
oper => oper,
sign => sign,
x => next_x,
y => next_y,
b1 => bin1,
b2 => bin2,
res => res,
color => color);

end Behavioral;

