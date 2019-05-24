-- Vhdl test bench created from schematic /vol/home-vol3/signal/guenther/ds_praktikum_p01_mux2/mux2.sch - Thu Apr  4 17:24:28 2013
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
ENTITY mux2_mux2_sch_tb IS
END mux2_mux2_sch_tb;
ARCHITECTURE behavioral OF mux2_mux2_sch_tb IS 

   COMPONENT mux2
   PORT( S		:		IN	STD_LOGIC; 
          Y		:		OUT	STD_LOGIC; 
          X0	:	IN	STD_LOGIC; 
          X1	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL S		:	STD_LOGIC;
   SIGNAL Y		:	STD_LOGIC;
   SIGNAL X0	:	STD_LOGIC;
   SIGNAL X1	:	STD_LOGIC;

BEGIN

   UUT: mux2 PORT MAP
	(
		S 	=> S, 
		Y 	=> Y, 
		X0 => X0, 
		X1 => X1
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		X0 <= '0';
		X1 <= '0';
		S  <= '0'; -- Signal_Y <= Signal_X0 = 0
		wait for 100 ns;
		assert Y = X0 report "(1) Y /= X0" severity error;

		X0 <= '1';
		X1 <= '0';
		S  <= '0'; -- Signal_Y <= Signal_X0 = 1
		wait for 100 ns;
		assert Y = X0 report "(2) Y /= X0" severity error;

		X0 <= '0';
		X1 <= '1';
		S  <= '0'; -- Signal_Y <= Signal_X0 = 0
		wait for 100 ns;
		assert Y = X0 report "(3) Y /= X0" severity error;

		X0 <= '1';
		X1 <= '1';
		S  <= '0'; -- Signal_Y <= Signal_X0 = 1
		wait for 100 ns;
		assert Y = X0 report "(4) Y /= X0" severity error;
		
		X0 <= '0';
		X1 <= '0';
		S  <= '1'; -- Signal_Y <= Signal_X1 = 0
		wait for 100 ns;
		assert Y = X1 report "(5) Y /= X1" severity error;
		
		X0 <= '1';
		X1 <= '0';
		S  <= '1'; -- Signal_Y <= Signal_X1 = 0
		wait for 100 ns;
		assert Y = X1 report "(6) Y /= X1" severity error;
	
		X0 <= '0';
		X1 <= '1';
		S  <= '1'; -- Signal_Y <= Signal_X1 = 1
		wait for 100 ns;
		assert Y = X1 report "(7) Y /= X1" severity error;
	
		X0 <= '1';
		X1 <= '1';
		S  <= '1'; -- Signal_Y <= Signal_X1 = 1
		wait for 100 ns;
		assert Y = X1 report "(8) Y /= X1" severity error;
	
		X0 <= '0';
		X1 <= '1';
		S  <= '1'; -- Signal_Y <= Signal_X1 = 1
		wait for 100 ns;
		assert Y = X1 report "(9) Y /= X1" severity error;
			
		report "Done ... Simulation stopped unconditional"
		severity failure;	-- stoppt jede simulation sicher
	
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
