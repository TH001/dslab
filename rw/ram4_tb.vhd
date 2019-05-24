-- Vhdl test bench created from schematic /vol/home-vol3/signal/fwinkler/xilinx/ds2014/rw4/ram4.sch - Thu May 15 16:44:23 2014
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
ENTITY ram4_ram4_sch_tb IS
END ram4_ram4_sch_tb;
ARCHITECTURE behavioral OF ram4_ram4_sch_tb IS 

   COMPONENT ram4
   PORT( Res	:	IN	STD_LOGIC; 
          Clk	:	IN	STD_LOGIC; 
          M_IN	:	IN	STD_LOGIC; 
          ADR	:	IN	STD_LOGIC_VECTOR (1 DOWNTO 0); 
          D	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          RAM	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;

   SIGNAL Res	:	STD_LOGIC;
   SIGNAL Clk	:	STD_LOGIC;
   SIGNAL M_IN	:	STD_LOGIC;
   SIGNAL ADR	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
   SIGNAL D	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL RAM	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL TESTPHASE: String(1 to 5);
	CONSTANT CLK_PERIOD : TIME := 20 ns;

BEGIN

   UUT: ram4 PORT MAP(
		Res => Res, 
		Clk => Clk, 
		M_IN => M_IN, 
		ADR => ADR, 
		D => D, 
		RAM => RAM
   );


-- *** Test Bench - User Defined Section ***
clk_process: process
	begin
		if Clk = '1' then
		Clk <= '0';
		else
		Clk <= '1';
		end if;
	WAIT for CLK_PERIOD/2;
	end process;

--- Test Pattern ----

tb : PROCESS
   BEGIN
    -- Reset Test
    TESTPHASE <= "RESET";
	RES <= '1'; 
    M_IN <= '-';
	ADR <= "--";
	D   <= "----";
	WAIT for CLK_PERIOD/2;
    -- Reset sollte Dominant sein!
	assert RAM = "0000" report "(0) RAM Reset fehlerhaft" severity error;
	RES <= '0'; 
    
    -- Lesetest nach Reset @0
    TESTPHASE <= "RES@0";
	M_IN <= '0';
	ADR <= "00";
	D   <= "0000";
	WAIT for CLK_PERIOD;
	assert RAM="0000" report "(1) RAM @0 Reset fehlerhaft" severity error;

    -- Write Test @0
    TESTPHASE <= "WR @0";
	RES <= '0'; 	
	M_IN <= '1';    -- schreiben
	D   <= "0101";	
	ADR <= "00";
	WAIT for CLK_PERIOD;
    -- read after write
 	assert RAM = "0101" report "(2) RAM Write @0 fehlerhaft" severity error;

        -- Write Test @1
    TESTPHASE <= "WR @1";
	RES <= '0'; 	
	M_IN <= '1';    -- schreiben
	D   <= "0011";	
	ADR <= "01";
	WAIT for CLK_PERIOD;
    -- read after write
 	assert RAM = "0011" report "(3) RAM Write @1 fehlerhaft" severity error;
    
    
    -- Kontrollesen RAM @0
    TESTPHASE <= "RD @0";
    D   <= "1111";
    M_IN <= '0';  -- nicht schreiben !
	ADR <= "00";
	WAIT for CLK_PERIOD;
    -- Kontrollesen RAM @0
	assert RAM = "0101" report "(4) RAM read @0 fehlerhaft" severity error;

    
    -- ab hier Test fortsetzen
-- Schreiben (M_IN = '1' )verschiedener Werte von D auf Adresse ADR = 00 bis 11 (dezimal 0 bis 3) bei gleichzeitigem Kontrollesen (read after write) auf RAM

-- Lesen (M_IN = 0) der zuvor geschriebenen Daten D in beliebiger Reihenfolge

	TESTPHASE <= "To Do";




	
	
    WAIT for CLK_PERIOD;
    
    TESTPHASE <= "Ende!";
	WAIT for CLK_PERIOD/2;
		
	report "Done - simulation stopped unconditional" severity failure;	
        
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
