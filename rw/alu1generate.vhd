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


entity alu1generate is
   PORT( s3	:	IN	STD_LOGIC; 
          a	:	IN	STD_LOGIC; 
          s2	:	IN	STD_LOGIC; 
          b	:	IN	STD_LOGIC; 
          g	:	OUT	STD_LOGIC);
end alu1generate;

architecture Behavioral of alu1generate is

begin

-- Insert VHDL assignments here
	g <= (s3 and a and b) or (s2 and a and not(b));


end Behavioral;

