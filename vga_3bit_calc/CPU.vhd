----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:32 11/18/2024 
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
BaseClk   : in  std_logic;
binary1   : in  std_logic_vector(2 downto 0);
binary2   : in  std_logic_vector(2 downto 0);
operation : in  std_logic;
sgn_led   : out std_logic;
hsync     : out std_logic;
vsync     : out std_logic;
color     : out std_logic_vector(7 downto 0);
enable    : out std_logic_vector(2 downto 0);
display   : out std_logic_vector(7 downto 0);
leds      : out std_logic_vector(3 downto 0));
end CPU;

architecture Behavioral of CPU is

signal sign   : std_logic;
signal result : std_logic_vector(3 downto 0);

signal GPUClk : std_logic;

signal hsync_t : std_logic;
signal vsync_t : std_logic;
signal color_t : std_logic_vector(7 downto 0);

signal enable_t  : std_logic_vector(2 downto 0);
signal display_t : std_logic_vector(7 downto 0);

signal SegClk : std_logic;

component PLL is port(
CLKIN_IN  : in  std_logic;
CLKFX_OUT : out std_logic;
CLK90_OUT  : out std_logic);
end component;

begin

PixelClock : PLL port map(
CLKIN_IN => BaseClk,
CLKFX_OUT => GPUClk,
CLK90_OUT => SegClk);


Mathematics : entity MATH port map(
bin1 => binary1,
bin2 => binary2,
oper => operation,
res => result,
sign => sign);

Graphics : entity GPU port map(
clock => GPUClk,
bin1 => binary1,
bin2 => binary2,
res => result,
oper => operation,
sign => sign,
hsync => hsync_t,
vsync => vsync_t,
color => color_t);

SegmentDisplayEncoding : entity SDU port map(
clock => SegClk,
res => result,
sgn => sign,
enab => enable_t,
disp => display_t);

sgn_led <= sign;

hsync <= hsync_t;
vsync <= vsync_t;
color <= color_t;

enable <= enable_t;
display <= display_t;

leds <= result;

end Behavioral;

