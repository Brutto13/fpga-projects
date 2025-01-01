----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:20:27 11/19/2024 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SDU is port(
clock : in  std_logic;
res   : in  std_logic_vector(3 downto 0);
sgn   : in  std_logic;
disp  : out std_logic_vector(7 downto 0);
enab  : out std_logic_vector(2 downto 0));
end SDU;

architecture Behavioral of SDU is

signal disp_t : std_logic_vector(7 downto 0);
signal disp1  : std_logic_vector(7 downto 0);
signal disp2  : std_logic_vector(7 downto 0);
signal disp3  : std_logic_vector(7 downto 0);

signal clk : std_logic;

signal enablers : std_logic_vector(2 downto 0);

signal current_enabler : unsigned(1 downto 0) := "00";

begin

ClockDivider : entity CMS port map(
input => clock,
output => clk,
limit => 10000);

DisplayDecoding : entity DDU port map(
num => res,
sgn => sgn,
disp1 => disp1,
disp2 => disp2,
disp3 => disp3);

Switching : Process (clk) Begin
	if rising_edge(clk) then
		current_enabler <= current_enabler + 1;
		if current_enabler = 3 then current_enabler <= B"00";
		end if;
		
		CASE current_enabler IS
			WHEN "00" =>
				enablers <= B"011";
				disp_t <= disp3;
			
			WHEN "01" =>
				enablers <= "101";
				disp_t <= disp2;
			
			WHEN "10" =>
				enablers <= "110";
				disp_t <= disp1;
			
			WHEN OTHERS =>
				enablers <= "111";
				disp_t <= X"FF";
			END CASE;
	end if;
End Process Switching;

enab <= enablers;
disp <= disp_t;

end Behavioral;

