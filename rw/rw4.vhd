----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:29:14 05/24/2019 
-- Design Name: 
-- Module Name:    rw4 - Behavioral 
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

entity rw4 is
    Port ( MF : in  STD_LOGIC;
           F_IN : in  STD_LOGIC;
           BA : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (3 downto 0);
           A_IN : in  STD_LOGIC;
           M_IN : in  STD_LOGIC;
           ROM : in  STD_LOGIC_VECTOR (3 downto 0);
           MB : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Res : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (3 downto 0);
           DAT : out  STD_LOGIC_VECTOR (3 downto 0);
           A : out  STD_LOGIC_VECTOR (3 downto 0);
           RAM : out  STD_LOGIC_VECTOR (3 downto 0);
           B : out  STD_LOGIC_VECTOR (3 downto 0));
end rw4;

architecture Behavioral of rw4 is

----COMPONENTEN----

component alu4flag is
generic(bits:integer:=4);
    Port ( BA : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (4-1 downto 0);
           A : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           B : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           Cin : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end component;

component mux4 is
generic(bits:integer:=4);
    Port ( X1 : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           X0 : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           S : in  STD_LOGIC;
           Y : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end component;

component ram4 is
generic(bits:integer:=4;adressbits:integer:=2);
    Port ( D : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           M_IN : in  STD_LOGIC;
           ADR : in  STD_LOGIC_VECTOR (adressbits-1 downto 0);
           Clk : in  STD_LOGIC;
           Res : in  STD_LOGIC;
           RAM : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end component;

component reg4 is
generic(bits:integer:=4);
    Port ( D : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           CE : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Res : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (bits-1 downto 0));
end component;

----sIGNALE ----

Signal DAT_inter: STD_LOGIC_VECTOR (bits-1 downto 0);
Signal A_inter: STD_LOGIC_VECTOR (bits-1 downto 0);
Signal B_inter: STD_LOGIC_VECTOR (bits-1 downto 0);
Signal F_inter: STD_LOGIC_VECTOR (bits-1 downto 0);
Signal F_M_inter: STD_LOGIC_VECTOR (bits-1 downto 0);
Signal RAM_inter: STD_LOGIC_VECTOR (bits-1 downto 0);

Signal Cin_inter: STD_LOGIC;

begin


ALU: alu4flag 
	generic map(bits)
		Port map ( 
					BA => BA,
					S => S,
					A_inter => A,
					B_inter => B,
					Cin_inter => Cin,
					F_inter <= F,
					DAT_inter <= Q);

MUX_F: mux4
	generic map (bits)
		Port map ( 
					DAT_inter => X1,
					MF => S,
					F_inter => X0,
					F_M_inter <= Y);
				
MUX_B: mux4
	generic map (bits)
		Port map ( 
					RAM_inter => X1,
					MB=>S,
					ROM => X0,
					B_inter <= Y);


REG_F: reg4
	generic map(bits)
		Port map( 
					F_M_inter => D, 
					F_inter => CE, 
					Clk => Clk,
					Res => Res, 
					F_inter <= Q 
					Cin_inter <= Q(1));
					
REG_A: reg4
	generic map(bits)
		Port map( 
					DAT_inter => D, 
					A_IN => CE, 
					Clk => Clk,
					Res => Res, 
					A_inter <= Q);

RAM: ram4
-- adress bitbreite ist immer kleiner als daten
	generic map(bits,adressbits)
		 Port map(
					DAT_inter => D, 
					M_IN => M_IN, 
					ROM(adressbits to 0) => ADR, 
					Clk => Clk, 
					Res => Res, 
					RAM_inter <= RAM);

	F <= F_inter;
	DAT <= DAT_inter;
	A <= A_inter;
	B <= B_inter;
	RAM <= RAM_inter;
	
end Behavioral;

