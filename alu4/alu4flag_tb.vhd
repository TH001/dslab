-- Vhdl test bench created from schematic /vol/home-vol3/signal/fwinkler/xilinx/ds2014/alu4/alu4flag.sch - Mon Mar 31 14:51:11 2014
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY alu4flag_alu4flag_sch_tb IS
END alu4flag_alu4flag_sch_tb;
ARCHITECTURE behavioral OF alu4flag_alu4flag_sch_tb IS 

CONSTANT bits:integer:=4;


   COMPONENT alu4flag is
	generic(bits:integer:=4);
    Port ( BA : in  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (4-1 downto 0);
           A : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           B : in  STD_LOGIC_VECTOR (bits-1 downto 0);
           Cin : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (bits-1 downto 0));
	end component;


   SIGNAL Q	:	STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
   --SIGNAL Q_Test	:	STD_LOGIC_VECTOR (bits DOWNTO 0);
   SIGNAL BA	:	STD_LOGIC;
   SIGNAL S	:	STD_LOGIC_VECTOR (4-1 DOWNTO 0);
   SIGNAL Cin	:	STD_LOGIC;
   SIGNAL B	:	STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
   SIGNAL A	:	STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
   SIGNAL F	:	STD_LOGIC_VECTOR (bits-1 DOWNTO 0);
	SIGNAL TESTPHASE: String(1 to 3);

BEGIN


   UUT: alu4flag generic map (bits) PORT MAP(
		Q => Q, 
		BA => BA, 
		S => S, 
		Cin => Cin, 
		B => B, 
		A => A, 
		F => F
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	report "TESTPHASE Logik" ;
	TESTPHASE <= "RES";
	BA <= '1';
	Cin <= '0';
	A <= "0101";
	B <= "0011";
	S <= "0000";
	
	WAIT for 10 ns;
	assert Q = "0000" 	report " S=(0000) Fehlerhaft" severity error;
	assert F = "0001" 	report " S=(0000) Flags Fehlerhaft" severity error;
-- optional knnen die Flags auch einzeln ausgewertet werden:	
	assert F(0) = '1'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '0'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '0'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '0'    report "Sign Fehlerhaft" severity error;	
	
	TESTPHASE <= "SET";
	BA <= '1';
	Cin <= '0';
	A <= "0101";
	B <= "0011";
	S <= "1111";       -- Q = 1111
	WAIT for 10 ns;
	assert Q = "1111" 	report " S=(1111) Fehlerhaft" severity error;
	assert F(0) = '0'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '0'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '0'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '1'    report "Sign Fehlerhaft" severity error;	

	TESTPHASE <= "Q=A";
	BA <= '1';
	Cin <= '0';
	A <= "0101";
	B <= "0011";
	S <= "1100";      -- Q = A
	WAIT for 10 ns;
	assert Q = "0101"	 report " S=(1100) Fehlerhaft" severity error;
--	assert Q = A 		 report " S=(1100) Fehlerhaft" severity error;  -- alternative Testmoeglichkeit
	assert F(0) = '0'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '0'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '0'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '0'    report "Sign Fehlerhaft" severity error;	
	
	TESTPHASE <= "NOT";	
	BA <= '1';
	Cin <= '0';
	A <= "0101";
	B <= "0011";
	S <= "0011";      -- Q = not A
	WAIT for 10 ns;
	assert Q = "1010" 	report " S=(0011) Fehlerhaft" severity error; 
--	assert (Q = not A) 	report " S=(0011) Fehlerhaft" severity error; -- alternative Testmoeglichkeit
	assert F(0) = '0'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '0'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '0'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '1'    report "Sign Fehlerhaft" severity error;	

	TESTPHASE <= "Q=B";
	BA <= '1';
	Cin <= '0';
	A <= "0101";
	B <= "0011";
	S <= "1010";      -- Q = B
	WAIT for 10 ns;
	assert Q = "0011"			report " S=(1010) Fehlerhaft" severity error;
	assert F(0) = '0'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '0'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '0'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '0'    report "Sign Fehlerhaft" severity error;	

	TESTPHASE <= "AND";
	BA <= '1';
	Cin <= '0';
	A <= "0101";
	B <= "0011";
	S <= "1000";      -- Q = A AND B
	WAIT for 10 ns;
	assert Q = "0001"   report " AND Fehlerhaft" severity error;
	assert F(0) = '0'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '0'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '0'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '0'    report "Sign Fehlerhaft" severity error;	
	
	TESTPHASE <= "EQU";
	BA <= '1';
	Cin <= '0';
	A <= "0101";
	B <= "0011";
	S <= "1001";      -- Q = A EQU B
	WAIT for 10 ns;
	assert Q = "1001"   report " EQU Fehlerhaft" severity error;
	assert F(0) = '0'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '0'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '0'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '1'    report "Sign Fehlerhaft" severity error;	
	
	
	report "TESTPHASE Arit" ;
	
	TESTPHASE <= "ADD";
	BA <= '0';
	Cin <= '1';
	A <= "0101";
	B <= "0011";
	S <= "1001";      -- Q = A + B
	WAIT for 10 ns;
	assert Q = "1001"   report " ADD Fehlerhaft" severity error;
	assert F(0) = '0'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '0'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '1'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '1'    report "Sign Fehlerhaft" severity error;
	
	TESTPHASE <= "SUB";
	BA <= '0';
	Cin <= '1';
	A <= "0101";
	B <= "0011";
	S <= "0110";      -- Q = A - B
	WAIT for 10 ns;
	assert Q = "0010"   report " SUB Fehlerhaft" severity error;
	assert F(0) = '0'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '1'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '0'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '0'    report "Sign Fehlerhaft" severity error;	
	
	TESTPHASE <= "DEC";
	BA <= '0';
	Cin <= '0';
	A <= "0101";
	B <= "0011";
	S <= "1100";      -- Q = A - 1
	WAIT for 10 ns;
	assert Q = "0100"   report " DEC Fehlerhaft" severity error;
	assert F(0) = '0'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '1'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '0'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '0'    report "Sign Fehlerhaft" severity error;
	
	TESTPHASE <= "INC";
	BA <= '0';
	Cin <= '1';
	A <= "0101";
	B <= "0011";
	S <= "0011";      -- Q = A + 1
	WAIT for 10 ns;
	assert Q = "0110"   report " INC Fehlerhaft" severity error;
	assert F(0) = '0'    report "Zero Fehlerhaft" severity error;	
	assert F(1) = '0'    report "Carry Fehlerhaft" severity error;
	assert F(2) = '0'    report "ZKO Fehlerhaft" severity error;
	assert F(3) = '0'    report "Sign Fehlerhaft" severity error;
   
	report "Done - simulation stopped unconditional" severity failure;	

	
   WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
