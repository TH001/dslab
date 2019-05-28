----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:29:38 05/24/2019 
-- Design Name: 
-- Module Name:    reg4 - Behavioral 
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

entity reg4 is
generic(bits:integer:=4);
    Port ( D : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           CE : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Res : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end reg4;

architecture Behavioral of reg4 is

begin
	process(Clk,CE,Res)
	begin
		if Res='1' then
			Q <= (others => '0');
		elsif rising_edge(Clk) then
		--elsif (Clk'event and Clk= '1') then
			if CE='1' then
				--report "bin hier";
				Q <= D;
			end if;
		end if;
	end process;

end Behavioral;

