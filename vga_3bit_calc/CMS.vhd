----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:25:55 11/19/2024 
-- Design Name: 
-- Module Name:    CMS - Behavioral 
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

entity CMS is port(
input  : in  std_logic;
limit  : in  integer;
output : out std_logic);
end CMS;

architecture Behavioral of CMS is

signal counter : unsigned(24 downto 0);
signal final : std_logic := '0';

begin

Divider : Process (input) begin
	if rising_edge(input) then
		if counter=limit then
			counter <= B"0000000000000000000000000";
			final <= NOT final;
		else counter <= counter + 1;
		end if;
	end if;
End Process Divider;

output <= final;

end Behavioral;

