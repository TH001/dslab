----------------------------------------------------------------------------------
-- Company: HU Berlin
-- Engineer: Dr. Winkler
-- 
-- Create Date:    04/25/2017 
-- Design Name: 
-- Module Name:    alu1generate - Behavioral 
-- Project Name:   alu4
-- Target Devices: Spartan-3E
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


entity alu1propagate is
   PORT( s0	:	IN	STD_LOGIC; 
          b	:	IN	STD_LOGIC; 
          not_p	:	OUT	STD_LOGIC; 
          s1	:	IN	STD_LOGIC; 
          a	:	IN	STD_LOGIC);
end alu1propagate;

architecture Behavioral of alu1propagate is

begin

-- Insert VHDL assignments here
-- Example: not_p <= (xxx and yyy) or zzz ; 
	not_p  <= (s1 and not(a) and b) or (s0 and not(a or b));

end Behavioral;

