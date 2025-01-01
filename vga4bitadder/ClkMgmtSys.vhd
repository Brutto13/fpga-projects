----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:07:58 11/07/2024 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ClkMgmtSys is port(
input  : in  std_logic;
GPUClk : out std_logic);
end ClkMgmtSys;

architecture Behavioral of ClkMgmtSys is

component PLL is port(
CLKIN_IN  : in  std_logic;
CLKFX_OUT : out std_logic);
end component;

begin

pixelclock : PLL port map(
CLKIN_IN => input,
CLKFX_OUT => GPUClk);

end Behavioral;

