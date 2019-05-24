----------------------------------------------------------------------------------
-- Company: HU Berlin
-- Engineer: Dr. Winkler
-- 
-- Create Date:    12:48:51 04/25/2017 
-- Design Name: 
-- Module Name:    alu1 - Behavioral 
-- Project Name:    alu4
-- Target Devices:  Spartan-3E
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
	
entity alu1 is
   PORT(  BA	:	IN	STD_LOGIC; 
          cin	:	IN	STD_LOGIC; 
          q	:	OUT	STD_LOGIC; 
          cout	:	OUT	STD_LOGIC; 
          a	:	IN	STD_LOGIC; 
          b	:	IN	STD_LOGIC; 
          S	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0));
end alu1;

architecture Behavioral of alu1 is

-- used components

component alu1generate is
   PORT( s3	:	IN	STD_LOGIC; 
          a	:	IN	STD_LOGIC; 
          s2	:	IN	STD_LOGIC; 
          b	:	IN	STD_LOGIC; 
          g	:	OUT	STD_LOGIC);
end component alu1generate;

component alu1propagate is
   PORT( s0	:	IN	STD_LOGIC; 
          b	:	IN	STD_LOGIC; 
          not_p	:	OUT	STD_LOGIC; 
          s1	:	IN	STD_LOGIC; 
          a	:	IN	STD_LOGIC);
end component alu1propagate;

-- local signals (connection between components)

signal g: STD_LOGIC;
signal not_p: STD_LOGIC;

begin

-- instantiate components alu1generate and alu1propagate
generate_instanz: alu1generate
    port map ( s3 => s(3),
		a => a,
		s2 => s(2),
		b => b,
		g => g );

propagate_instanz: alu1propagate
    port map (  s0 => S(0) ,
		b => b,
		not_p => not_p,
		a => a,
		s1 => S(1) );

-- Insert your Code to 
-- calculate outputs q and cout

q <= (g or not_p) xnor (BA or cin); 
cout <= (g or (not(not_p) and cin)) and not(BA);


end Behavioral;

