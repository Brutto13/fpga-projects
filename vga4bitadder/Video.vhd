----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:57:42 11/07/2024 
-- Design Name: 
-- Module Name:    Video - Behavioral 
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

entity Video is port(
clk : in std_logic;
x : in  integer range 0 to 1023;
y : in  integer range 0 to 1023;
r : in  std_logic_vector(4 downto 0);
c : out std_logic_vector(7 downto 0));
end Video;

architecture Behavioral of Video is

begin process (clk) begin
	if rising_edge(clk) then
		if (x < 640) AND (y < 480) then
			--FRAME
			if (x=639) OR (x=0) OR (y=0) OR (y=479) then
				c <= X"F4";
			else
				if (x < 128) then
					IF r(4)='1' THEN c <= X"FF";
					ELSE c <= X"00";
					END IF;
								
				elsif (x > 128 AND x < 256) then
					IF (r(3)='1') THEN c <= X"FF";
					ELSE c <= X"00";
					END IF;
				
				elsif (x > 256 AND x < 384) then
					IF (r(2)='1') THEN c <= X"FF";
					ELSE c <= X"00";
					END IF;
				
				
				elsif (x > 384 AND x < 512) then
					IF (r(1)='1') THEN c <= X"FF";
					ELSE c <= X"00";
					END IF;
								
				elsif (x > 512 AND x < 640) then
					IF (r(0)='1') THEN c <= X"FF";
					ELSE c <= X"00";
					END IF;
				
				else c <= X"C1";
				
				end if;
			end if;
		else c <= X"00";
		end if;
	end if;
end process;
end Behavioral;

