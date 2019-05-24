----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:01 05/24/2019 
-- Design Name: 
-- Module Name:    ram4 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram4 is
generic(bits:integer:=4;adressbits:integer:=2);
    Port ( D : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           M_IN : in  STD_LOGIC;
           ADR : in  STD_LOGIC_VECTOR (adressbits-1 downto 0);
           Clk : in  STD_LOGIC;
           Res : in  STD_LOGIC;
           RAM : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end ram4;

architecture Behavioral of ram4 is

TYPE ramtyp is ARRAY(0 to 2**adressbits-1) of STD_LOGIC_VECTOR (bits-1 downto 0);
SIGNAL storage: ramtyp;

begin

process (Clk)
begin
   if (Clk'event and Clk= '1') then
      if (M_IN = '1') then
         storage(to_integer(unsigned(ADR))) <= D;
      end if;
   end if;
end process;

RAM <= storage(to_integer(unsigned(ADR)));

					

end Behavioral;

