----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:16:40 11/08/2024 
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
BaseClk : in std_logic;
binary1 : in std_logic_Vector(3 Downto 0);
binary2 : in std_logic_Vector(3 Downto 0);

hsync : out std_logic;
vsync : out std_logic;
color : out std_logic_Vector(7 Downto 0));
end CPU;

architecture Behavioral of CPU is

signal result : std_logic_Vector(4 Downto 0);

signal enablers_t : std_logic_Vector(2 Downto 0);
signal displays_t : std_logic_Vector(7 Downto 0);

signal GPUClk : std_logic;
signal SegClk : std_logic;

signal hsync_t : std_logic;
signal vsync_t : std_logic;
signal color_t : std_logic_Vector(7 Downto 0);

begin

Mathematics : entity ADD port map(
bin1 => binary1,
bin2 => binary2,
outp => result);


Graphics : entity GPU port map(
clock => GPUClk,
value1 => binary1,
value2 => binary2,
result => result,
hsync => hsync_t,
vsync => vsync_t,
color => color_t);

Clocking : entity CMS port map(
input => BaseClk,
GPUClk => GPUClk);

hsync <= hsync_t;
vsync <= vsync_t;
color <= color_t;

end Behavioral;

