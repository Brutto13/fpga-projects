----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:48:50 11/03/2024 
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
CPUClk  : in  std_logic;
binary1 : in  std_logic_vector(2 downto 0);
binary2 : in  std_logic_vector(2 downto 0);

--VGA display out
hsync : out std_logic;
vsync : out std_logic;
color : out std_logic_vector(7 downto 0);

--LEDs
led : out std_logic_vector(3 downto 0);

--Segments
display : out std_logic_vector(7 downto 0);
enabler : out std_logic_vector(2 downto 0));
end CPU;

architecture Behavioral of CPU is

-- Signals
---- Clock Signals
signal GPUClk : std_logic := '0';
signal SegClk : std_logic := '0';

---- VGA temporary
SIGNAL hsync_temp : STD_LOGIC := '1';
SIGNAL vsync_temp : STD_LOGIC := '1';
SIGNAL color_temp : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";

---- 7-SEG temporary
SIGNAL enablers_temp : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
SIGNAL displays_temp : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";

---- ADDER temporary
SIGNAL result : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

--Components:
---- 3-bit binary Adder (ADD / adder) -------
component adder is port(
num1 : in  std_logic_vector(2 downto 0);
num2 : in  std_logic_vector(2 downto 0);
outp : out std_logic_vector(3 downto 0));
end component;
---------------------------------------------

---- Clock Management System (CMS / ClkMgmtSys) -----
component ClkMgmtSys is port(
input  : in  std_logic;
gpuclk : out std_logic;
segclk : out std_logic);
end component;
-----------------------------------------------------

---- Graphics Processing Unit (GPU / vga) -----
component vga is port(
clock  : in  std_logic;
result : in  std_logic_vector(3 downto 0);
hsync  : out std_logic;
vsync  : out std_logic;
color  : out std_logic_vector(7 downto 0));
end component;
-----------------------------------------------
---- Segments Processing Unit (SPU / display_driver) -----
component display_driver is port(
clock  : in  std_logic;
num1   : in  std_logic_vector(2 downto 0);
num2   : in  std_logic_vector(2 downto 0);
num3   : in  std_logic_vector(3 downto 0);
output : out std_logic_Vector(7 downto 0);
enable : out std_logic_vector(2 downto 0));
end component;
-----------------------------------------------------------

begin

CMS : ClkMgmtSys port map(
input => CPUClk,
gpuclk => GPUClk,
segclk => SegClk);

GPU : vga port map(
clock  => GPUClk,
result => result,
hsync  => hsync_temp,
vsync  => vsync_temp,
color  => color_temp);

SPU : display_driver port map(
clock => SegClk,
num1  => binary1,
num2  => binary2,
num3  => result,
output => displays_temp,
enable => enablers_temp);

ADD : adder port map(
num1 => binary1,
num2 => binary2,
outp => result);


hsync <= hsync_temp;
vsync <= vsync_temp;
color <= color_temp;
led <= result;
enabler <= enablers_temp;
display <= displays_temp;

end Behavioral;

