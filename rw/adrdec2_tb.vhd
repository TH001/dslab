-- Vhdl test bench created from schematic /vol/home-vol3/signal/fwinkler/xilinx/ds2015/rw4/adrdec2.sch - Mon Apr 27 18:09:27 2015
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
ENTITY adrdec2_adrdec2_sch_tb IS
END adrdec2_adrdec2_sch_tb;
ARCHITECTURE behavioral OF adrdec2_adrdec2_sch_tb IS 

   COMPONENT adrdec2
   PORT( ADR_H	:	OUT	STD_LOGIC; 
          ADR_L	:	OUT	STD_LOGIC; 
          ADR	:	IN	STD_LOGIC; 
          M_IN	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL ADR_H	:	STD_LOGIC;
   SIGNAL ADR_L	:	STD_LOGIC;
   SIGNAL ADR	:	STD_LOGIC;
   SIGNAL M_IN	:	STD_LOGIC;

BEGIN

   UUT: adrdec2 PORT MAP(
		ADR_H => ADR_H, 
		ADR_L => ADR_L, 
		ADR => ADR, 
		M_IN => M_IN
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	
	M_IN <= '0';
	ADR <= '-';
	WAIT for 100 ns;
	assert ADR_H = '0' report "(1) ADR_H fehlerhaft" severity error;
	assert ADR_L = '0' report "(1) ADR_L fehlerhaft" severity error;
	
	M_IN <= '1';
	ADR <= '0';
	WAIT for 100 ns;
	assert ADR_H = '0' report "(2) ADR_H fehlerhaft" severity error;	
	assert ADR_L = '1' report "(2) ADR_L fehlerhaft" severity error;	
	
	M_IN <= '1';
	ADR <= '1';
	WAIT for 100 ns;
	assert ADR_H = '1' report "(3) ADR_H fehlerhaft" severity error;	
	assert ADR_L = '0' report "(3) ADR_L fehlerhaft" severity error;		
	
	report "Done ... Simulation stopped unconditional"
	severity failure;
	
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
