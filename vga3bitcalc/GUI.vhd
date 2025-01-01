----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:46 11/16/2024 
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
x : in integer range 0 to 1023;
y : in integer range 0 to 1023;

clk   : in  std_logic;
num1  : in  std_logic_vector(2 downto 0);
num2  : in  std_logic_vector(2 downto 0);
res   : in  std_logic_vector(3 downto 0);
op    : in  std_logic;
color : out std_logic_vector(7 downto 0));
end GUI;

architecture Behavioral of GUI is

constant enabled_c   : std_logic_vector(7 downto 0) := X"1C"; --Green
constant disabled_c  : std_logic_Vector(7 downto 0) := X"E0"; --Red
constant adding_c    : std_logic_vector(7 downto 0) := X"FC"; --Yellow
constant substract_c : std_logic_vector(7 downto 0) := X"03"; --Blue
constant border_num1 : std_logic_vector(7 downto 0) := X"FF"; --White
constant border_num2 : std_logic_vector(7 downto 0) := X"FF"; --White

begin process (clk) begin
	if rising_edge(clk) then
		-- Visible Area
		if (x<640 AND y<480) then
			-- FIRST SQUARE (row 1)
			--Draw First Square
			if (x=100 OR x=150 OR y=20 OR y=70) then
				color <= border_num1;
			
			--Fill first square
			elsif (x>100 AND x<150 AND y>20 AND y<70) then
				if (num1(2)='0') then color <= enabled_c;
				else color <= disabled_c;
				end if;
			
			--------------------------------------
			
			-- SECOND SQUARE (row 1)
			-- Draw Second Square
			elsif (x=200 OR x=250 OR y=120 OR y=170) then
				color <= border_num1;
			
			--Fill Second Square
			elsif (x>200 AND x<250 AND y>120 AND y<170) then
				if (num1(1)='0') then color <= enabled_c;
				else color <= disabled_c;
				end if;
			
			--------------------------------------
			-- THIRD SQUARE (row 1)
			-- Draw Third Square
			elsif (x=300 OR x=350 OR y=220 OR y=270) then
				color <= border_num1;
			
			--Fill Third Square
			elsif (x>300 AND x<350 AND y>220 AND y<270) then
				if (num(0)='0') then color <= enabled_c;
				else color <= disabled_c;
				end if;
			
			else color <= X"00";
			end if;
		--Blanking Area
		else color <= X"00";
		end if;
	end if;
end process;
end Behavioral;

