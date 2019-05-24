----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:41:16 05/10/2019 
-- Design Name: 
-- Module Name:    alu4 - Behavioral 
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

entity alu4 is
generic(bits:integer:=4);
 Port ( BA : in  STD_LOGIC;
		  S : in  STD_LOGIC_VECTOR (4-1 downto 0);
		  A : in  STD_LOGIC_VECTOR (bits-1 downto 0);
		  B : in  STD_LOGIC_VECTOR (bits-1 downto 0);
		  Cin : in  STD_LOGIC;
		  Cout : out  STD_LOGIC;
		  Cn : out  STD_LOGIC;
		  Q : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end alu4;

architecture Behavioral of alu4 is

component alu1 is
	PORT(     BA	:	IN	STD_LOGIC; 
				 cin	:	IN	STD_LOGIC; 
				 q	:	OUT	STD_LOGIC; 
				 cout	:	OUT	STD_LOGIC; 
				 a	:	IN	STD_LOGIC; 
				 b	:	IN	STD_LOGIC; 
				 S	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0));
end component;

Signal C: STD_LOGIC_VECTOR (bits downto 0);

begin

C(0) <= cin;

schleife: for i in 0 to bits-1 generate
	bitspace: alu1 port map(
		BA	=> BA,
		cin => C(i),
		q => Q(i),
		cout => C(i+1),
		a => A(i), 
		b => B(i),
		S => S
		);
end generate;

cout <= C(bits);
cn <= C(bits-1);

end Behavioral;

