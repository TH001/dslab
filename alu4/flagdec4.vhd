----------------------------------------------------------------------------------
-- Company: HU Berlin
-- Engineer: Dr. F. Winkler
-- 
-- Create Date:    12:16:40 04/18/2019 
-- Design Name: 
-- Module Name:    flagdec4 - Behavioral 
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

entity flagdec4 is
generic(bits:integer:=4);
    Port ( Cn : in  STD_LOGIC;
           Cout : in  STD_LOGIC;
           Q : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           F : out  STD_LOGIC_VECTOR (3 downto 0));
end flagdec4;

architecture Behavioral of flagdec4 is

begin
-- Insert VHDL assignments here
F(3) <= Q(bits-1);
F(2) <= Cn xor Cout;
F(1) <= Cout;

process(Q)
Variable temp: STD_LOGIC;
begin
	temp:= '0';
	for i in 0 to bits-1 loop
		temp:=temp or Q(i);
	end loop;
	F(0) <= not(temp);
end process;
--F(0) <= not(Q(3)or Q(2) or Q(1)or Q(0));

end Behavioral;

