----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:10:33 11/04/2024 
-- Design Name: 
-- Module Name:    ClkMgmtSys - Behavioral 
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

entity ClkMgmtSys is port(
input  : in    std_logic;
GPUClk : out std_logic;
SegClk : out   std_logic);
end ClkMgmtSys;

architecture Behavioral of ClkMgmtSys is

signal counter : unsigned(24 downto 0);
signal newclk : std_logic := '0';

constant seg_limit : integer := 1200;

COMPONENT PLL IS PORT(
CLKIN_IN  : IN  STD_LOGIC;
CLKFX_OUT : OUT STD_LOGIC);
END COMPONENT;

begin

pixel_clock : PLL port map(
CLKIN_IN => input,
CLKFX_OUT => GPUClk);

dividing : process (input) begin
	if rising_edge(input) then
		if (counter=seg_limit) then
			newclk <= NOT newclk;
		else counter <= counter + 1;
		end if;
	end if;
end process dividing;

--SegClk <= newclk;

end Behavioral;

