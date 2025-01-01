----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:02:44 11/09/2024 
-- Design Name: 
-- Module Name:    SDU - Behavioral 
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

entity SDU is port(
clock    : in  std_logic;
number   : in  std_logic_vector(4 downto 0);
display  : out std_logic_vector(7 downto 0);
enablers : out std_logic_vector(2 downto 0));
end SDU;

architecture Behavioral of SDU is

SIGNAL display_t : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL enabler_t : STD_LOGIC_VECTOR(2 DOWNTO 0);

signal current_en : integer range 0 to 2 := 0;


signal disp1 : std_logic_vector(7 downto 0);
signal disp2 : std_logic_vector(7 downto 0);
signal disp3 : std_logic_vector(7 downto 0);

constant maxenabler : integer := 2;

begin

Decoding : entity DCD port map(
number => number,
disp1 => disp1,
disp2 => disp2,
disp3 => disp3);

process (clock) begin
	if rising_edge(clock) then
		if (current_en=maxenabler) then
			current_en <= 0;
		else current_en <= current_en + 1;
		end if;
		
		case current_en is
			when 0 =>
				enabler_t <= "110";
				display_t <= disp1;
			
			when 1 =>
				enabler_t <= "101";
				display_t <= disp2;
			
			when 2 =>
				enabler_t <= "011";
				display_t <= disp3;
			
		end case;
		

	end if;
end process;

display <= display_t;
enablers <= enabler_t;

end Behavioral;