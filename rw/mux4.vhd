----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:59:39 05/24/2019 
-- Design Name: 
-- Module Name:    mux4 - Behavioral 
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

entity mux4 is
generic(bits:integer:=4);
    Port ( X1 : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           X0 : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           S : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end mux4;

architecture Behavioral of mux4 is

begin

-- Y <= (X0 and S) or (X1 and not(S));
process(S,X0,X1)
begin
	if S = '0' then
		Y <= X0;
	else Y <= X1;
	end if;
end process;

end Behavioral;

