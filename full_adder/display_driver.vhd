----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:51:34 11/04/2024 
-- Design Name: 
-- Module Name:    display_driver - Behavioral 
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

entity display_driver is port(
clock  : in  std_logic;
num1   : in  std_logic_vector(2 downto 0);
num2   : in  std_logic_vector(2 downto 0);
num3   : in  std_logic_vector(3 downto 0);
output : out std_logic_Vector(7 downto 0);
enable : out std_logic_vector(2 downto 0));
end display_driver;

architecture Behavioral of display_driver is

signal number1D : std_logic_vector(7 downto 0) := "00000000";
signal number2D : std_logic_vector(7 downto 0) := "00000000";
signal number3D : std_logic_vector(7 downto 0) := "00000000";

SIGNAL current_enabler : INTEGER := 0;
SIGNAL current_display : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
SIGNAL enablers        : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";


begin

decoding1 : entity decoder3bit port map(
input => num1,
output => number1D);

decoding2 : entity decoder3bit port map(
input => num2,
output => number2D);

decoding3 : entity decoder4bit port map(
input => num3,
output => number3D);

process (clock) begin
	if rising_edge(clock) then
		if (current_enabler=2) then current_enabler <= 0;
		else current_enabler <= current_enabler + 1;
		end if;
		
		CASE current_enabler IS
			WHEN 0 =>
				enablers <= NOT "001";
				current_display <= number1D;
			
			WHEN 1 =>
				enablers <= NOT "010";
				current_display <= number2D;
			
			WHEN 2 =>
				enablers <= NOT "100";
				current_display <= number3D;
			
			WHEN OTHERS =>
				enablers <= NOT "111";
				current_display <= X"FF";
			END CASE;
		end if;
end process;

output <= current_display;
enable <= enablers;

end Behavioral;

