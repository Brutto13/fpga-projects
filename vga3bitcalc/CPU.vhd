----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:35:33 11/14/2024 
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY CPU IS PORT(
BaseClk   : IN STD_LOGIC;
binary1   : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
binary2   : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
operation : IN STD_LOGIC);
END CPU;

ARCHITECTURE Behavioral OF CPU IS

SIGNAL result : STD_LOGIC_VECTOR(3 DOWNTO 0);

signal GPUClk : std_logic;


begin

Mathematics : ENTITY MPU PORT MAP(
num1 => binary1,
num2 => binary2,
operation => operation,
result => result);

Clocking : ENTITY CMS PORT MAP(
input => BaseClk,
GPUClk => GPUClk);

--Graphics : ENTITY GPU PORT MAP(


end Behavioral;

