----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:24 05/10/2019 
-- Design Name: 
-- Module Name:    alu4flag - Behavioral 
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

entity alu4flag is
generic(bits:integer:=4);
    Port ( BA : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (4-1 downto 0);
           A : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           B : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           Cin : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end alu4flag;

architecture Behavioral of alu4flag is

component alu4 is
generic(bits:integer:=4);
	Port ( BA : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (4-1 downto 0);
           A : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           B : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Cn : out  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end component;

component flagdec4 is
generic(bits:integer:=4);
	Port (  Cn : in  STD_LOGIC;
			  Cout : in  STD_LOGIC;
			  Q : in  STD_LOGIC_VECTOR (bits-1 downto 0);
			  F : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

Signal Cn_inter: STD_LOGIC ;
Signal Cout_inter: STD_LOGIC;
Signal Q_inter: STD_LOGIC_VECTOR (bits-1 downto 0);

begin
--Cn_inter <= Cn;
--	Cout_inter <= Cout;
--	Q_inter <= Q;
	
	aluinstanc: alu4 
	generic map(bits)
		Port map ( BA => BA,
				  S => S,
				  A => A,
				  B => B,
				  Cin => Cin,
				  Cout => Cout_inter,
				  Cn => Cn_inter,
				  Q => Q_inter);
	flaginst: flagdec4
	generic map (bits)
		Port map(  Cn =>Cn_inter,
			  Cout => Cout_inter,
			  Q => Q_inter,
			  F => F);

	Q <= Q_inter;
end Behavioral;

