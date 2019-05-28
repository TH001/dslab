-- Vhdl test bench created from schematic /vol/home-vol3/signal/fwinkler/xilinx/ds2014/rw4/rw4.sch - Tue Apr  1 19:27:41 2014
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
ENTITY rw4_rw4_sch_tb IS
END rw4_rw4_sch_tb;
ARCHITECTURE behavioral OF rw4_rw4_sch_tb IS 

   COMPONENT rw4
   PORT( F	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          DAT	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          MF	:	IN	STD_LOGIC; 
          F_IN	:	IN	STD_LOGIC; 
          A_IN	:	IN	STD_LOGIC; 
          A	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          B	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          BA	:	IN	STD_LOGIC; 
          S	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          RAM	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          M_IN	:	IN	STD_LOGIC; 
          ROM	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          Res	:	IN	STD_LOGIC; 
          Clk	:	IN	STD_LOGIC; 
          MB	:	IN	STD_LOGIC);
   END COMPONENT;

-- global signals
   SIGNAL Res	:	STD_LOGIC;
   SIGNAL Clk	:	STD_LOGIC;

-- rw4 signals
   SIGNAL A	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL B	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL F	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL DAT	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL MF	:	STD_LOGIC;
   SIGNAL F_IN	:	STD_LOGIC;
   SIGNAL A_IN	:	STD_LOGIC;
   SIGNAL M_IN	:	STD_LOGIC;
   SIGNAL MB	:	STD_LOGIC;
	
   SIGNAL BA	:	STD_LOGIC;
   SIGNAL S	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL RAM	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL ROM	:	STD_LOGIC_VECTOR (3 DOWNTO 0);

-- testbench internal signals	
	SIGNAL TESTPHASE: String(1 to 5);
	CONSTANT CLK_PERIOD: TIME := 100 ns;

BEGIN

   UUT: rw4 PORT MAP(
		F => F, 
		DAT => DAT, 
		MF => MF, 
		F_IN => F_IN, 
		A_IN => A_IN, 
		A => A, 
		B => B,
		BA => BA, 
		S => S, 
		RAM => RAM, 
		M_IN => M_IN, 
		ROM => ROM, 
		Res => Res, 
		Clk => Clk, 
		MB => MB
   );

-- *** Test Bench - Clock Section ***
	clk_process: PROCESS
	BEGIN
	if Clk = '1' then 
		Clk <= '0'; 
	else Clk <= '1';
	end if;
	WAIT FOR CLK_PERIOD/2;
	END PROCESS;

-- *** Test Bench - User Defined Section ***
   tb : PROCESS

   VARIABLE RAM0	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   VARIABLE RAM1	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   VARIABLE RAM2	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   VARIABLE RAM3	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   
   BEGIN
   A_IN	<= '0';		-- 1: A laden
   F_IN	<= '0';	   -- 1: F laden
   M_IN	<= '0';     -- 1: RAM laden
   BA	<= '0';		-- 0: Arithm.  1: Logik
   S	<= "0000";  -- s. Tabelle
   ROM	<= "0000";  -- Konstante (spaeter Operand aus ROM)
   Res	<= '0';     -- 1: Reset
   MB	<= '0';		-- 0: ROM,  1: RAM
   MF	<= '0';     -- 0: FLAG  1: DAT

	-- Check RESET
		TESTPHASE <= "RESET";
	   Res  <= '1';
        RAM0 := "0000"; -- Testbench Speicher zum Vergleich mit RAM-Inhalt
        RAM1 := "0000";
        RAM2 := "0000";
        RAM3 := "0000";
		WAIT for CLK_PERIOD/2;
		RES  <= '0';
		assert A = "0000" report "(1) Res A Fehlerhaft" severity error;
		assert F = "0000" report "(1) Res F Fehlerhaft" severity error;
		
	-- Check A LOAD A with #5
		TESTPHASE <= "LOAD5";		-- genau 5 Zeichen!
	    ROM	<= "0101";  -- 5
		A_IN  <= '1';
		F_IN  <= '0' ;
		M_IN  <= '0' ;
        MB	<= '0';
        MF	<= '0';
		BA    <= '1'   ;     -- Logic
		S     <= "1010" ; -- Q = B       (A = ROM = "0101")
		WAIT for CLK_PERIOD;
		assert A = "0101" report "(2) LOAD ROM A Fehlerhaft" severity error;
								
	-- Check ALU ROM Arithmetic
		TESTPHASE <= "A+ROM";   -- genau 5 Zeichen
		ROM	<= "0011";    -- 3
		A_IN  <= '1';
		F_IN  <= '1';
		M_IN  <= '0' ;
        MB	<= '0';
        MF	<= '0';
		BA    <= '0';       -- Arithmetic
		S     <= "1001";    -- Q = A + ROM         Q = 5 + 3  = 8    = "1000"
		WAIT for CLK_PERIOD;
		assert A = "1000"   report "(2) A + ROM A Fehlerhaft" severity error;
      assert F = "1100"   report "(2) A + ROM F Fehlerhaft" severity error; 	
		
	-- Check STORE RAM @2
		TESTPHASE <= "STORE";   -- genau 5 Zeichen
		ROM	<= "0010";  -- @2
		A_IN  <= '0';
		F_IN  <= '0' ;
		M_IN  <= '1' ;
        MB	<= '0';
        MF	<= '0';
		BA    <= '1' ;       -- Logic
		S     <= "1100";  -- Q = A      (@2 = A  = "1000")
		RAM2  := "1000" ; -- der erwartete Wert @2:1000 wird zum nachfolgenden Vergleich 
                          -- in Testbench RAM2 gespeichert
		WAIT for CLK_PERIOD;
		assert RAM = "1000" report "(2) STORE RAM @2 Fehlerhaft" severity error;         
--      alterantive Moeglichkeit: 
--      Test mit in Testbench gespeicherter Vergleichsvariable RAM2        
--		assert RAM = RAM2 report "(2) STORE RAM @2 Fehlerhaft" severity error;   
        
        
 -- Hier weitere Tests einfuegen!
 --------------------------------
		 
		TESTPHASE <= "REGF1";
		F_IN  <= '1' ;
		MF	<= '1';
		BA <= '1';
		S <= "1111";
		
		ROM	<= "0000";
		A_IN  <= '0';
		M_IN  <= '0' ;
      MB	<= '0';
		
		WAIT for CLK_PERIOD;
		assert F = "1111" report "(O1) REGF1 Fehlerhaft" severity error;  
		
		TESTPHASE <= "INCRA";
		BA <= '0';
		S <= "0011";
		A_IN <= '1';
		
		ROM	<= "0000";
		F_IN  <= '0';
		M_IN  <= '0' ;
		MB	<= '0';
		MF	<= '0';
		
		WAIT for CLK_PERIOD;
		assert A = "1001" report "(O2) INCRA Fehlerhaft" severity error;  
		
		TESTPHASE <= "AXOR2";
		A_IN <= '1';
		BA <= '1';
		S <= "0110";
		ROM <= "0010";
		MB <= '1';
		
		F_IN  <= '0';
		M_IN  <= '0' ;
		MF	<= '0';
		
		WAIT for CLK_PERIOD;
		assert A = "0001" report "(O3) AXOR2 Fehlerhaft" severity error; 
		
		TESTPHASE <= "STOR1";

		M_IN <= '1';
		ROM	<= "0001";
		BA    <= '1';
		S     <= "1100";
		
		A_IN  <= '0';
		F_IN  <= '0';
		MB	<= '0';
		MF	<= '0';
 
		WAIT for CLK_PERIOD;
		assert RAM = "0001" report "(O4) STOR1 Fehlerhaft" severity error; 
		

		WAIT for CLK_PERIOD;	
		TESTPHASE <= "Ende!";
		
		WAIT for CLK_PERIOD/2;
		
		report "Abbruch der Simulation" severity failure;
	
	
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
