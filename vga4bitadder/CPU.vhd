----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:01:29 11/07/2024 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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

entity CPU is port(
BaseClk : in  std_logic;
binary1 : in  std_logic_vector(3 downto 0);
binary2 : in  std_logic_vector(3 downto 0);
hsync   : out std_logic;
vsync   : out std_logic;
color   : out std_logic_vector(7 downto 0));
end CPU;

architecture Behavioral of CPU is

signal result : std_logic_vector(4 downto 0);
signal hsync_t : std_logic;
signal vsync_t : std_logic;
signal color_t : std_logic_vector(7 downto 0);

SIGNAL GPUClk : STD_LOGIC;

begin

CMS : entity ClkMgmtSys port map(
input => BaseClk,
gpuclk => GPUClk);

GPU : entity GPU port map(
GPUClk => GPUClk,
hsync => hsync_t,
vsync => vsync_t,
color => color_t,
request => result);

ADD : entity adder port map(
bin1 => binary1,
bin2 => binary2,
outp => result);

hsync <= hsync_t;
vsync <= vsync_t;
color <= color_t;

end Behavioral;

