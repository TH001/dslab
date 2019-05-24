-- Vhdl test bench created from schematic /vol/home-vol3/signal/fwinkler/xilinx/ds2015/rw4/ram2.sch - Mon Apr 27 18:36:04 2015
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
ENTITY ram2_ram2_sch_tb IS
END ram2_ram2_sch_tb;
ARCHITECTURE behavioral OF ram2_ram2_sch_tb IS 

   COMPONENT ram2
   PORT( D	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          Res	:	IN	STD_LOGIC; 
          Clk	:	IN	STD_LOGIC; 
          M_IN	:	IN	STD_LOGIC; 
          ADR	:	IN	STD_LOGIC; 
          Q	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;

   SIGNAL D	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL Res	:	STD_LOGIC;
   SIGNAL Clk	:	STD_LOGIC;
   SIGNAL M_IN	:	STD_LOGIC;
   SIGNAL ADR	:	STD_LOGIC;
   SIGNAL Q	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	CONSTANT CLK_PERIOD: TIME := 100 ns;
	SIGNAL TESTPHASE: STRING(1 to 5) := "     ";

BEGIN

   UUT: ram2 PORT MAP(
		D => D, 
		Res => Res, 
		Clk => Clk, 
		M_IN => M_IN, 
		ADR => ADR, 
		Q => Q
   );

clk_process: process 
   begin
	if Clk = '1' then Clk <= '0'; 
		else Clk <= '1';
	end if;
	wait for CLK_PERIOD/2;
end process;

reset_process: process 
   begin
	Res <= '1';
	wait for CLK_PERIOD/2;
	Res <= '0';
	wait;			-- wait forever 	
end process;

	
-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	TESTPHASE <= "RESET";
	D <= "0101";
	M_IN <= '0';
	ADR <= '0';
	WAIT for CLK_PERIOD/2;
	assert Q = "0000" report "RAM(0) falsch initialisiert" severity error;
	ADR <= '1';
	WAIT for CLK_PERIOD;
	assert Q = "0000" report "RAM(1) falsch initialisiert" severity error;	

	TESTPHASE <= "WR @0";
	D <= "0101";	
	M_IN <= '1';
	ADR <= '0';
	WAIT for CLK_PERIOD;
	assert Q = D report "RAM(0) fehlerhaft" severity error;	
	
	TESTPHASE <= "WR @1";
	D <= "0011";		
	M_IN <= '1';
	ADR <= '1';
	WAIT for CLK_PERIOD;
	assert Q = D report "RAM(1) fehlerhaft" severity error;		

	TESTPHASE <= "RD @0";
	D <= "0000";	
	M_IN <= '0';
	ADR <= '0';
	WAIT for CLK_PERIOD;
	assert Q = "0101"  report "RAM(0) falsch ueberschrieben " severity error;	
	
	TESTPHASE <= "RD @1";
	D <= "0000";
	M_IN <= '0';	
	ADR <= '1';
	WAIT for CLK_PERIOD;
	assert Q = "0011"  report "RAM(0) falsch ueberschrieben " severity error;	



	report "Done ... Simulation stopped unconditional"
	severity failure;
	
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
