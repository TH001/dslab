--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:55:28 05/28/2019
-- Design Name:   
-- Module Name:   /vol/fob-vol7/mi18/heinetom/dslab1.git/rw/reg4_tb.vhd
-- Project Name:  rw
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg4
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY reg4_tb IS
END reg4_tb;
 
ARCHITECTURE behavior OF reg4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg4
    PORT(
         D : IN  std_logic_vector(3 downto 0);
         CE : IN  std_logic;
         Clk : IN  std_logic;
         Res : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(3 downto 0);
   signal CE : std_logic;
   signal Clk : std_logic;
   signal Res : std_logic;

 	--Outputs
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
	SIGNAL TESTPHASE: String(1 to 5);
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg4 PORT MAP (
          D => D,
          CE => CE,
          Clk => Clk,
          Res => Res,
          Q => Q
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

      TESTPHASE <= "LOAD5";		-- genau 5 Zeichen!
	    D	<= "0101";  -- 5
		CE  <= '1';
		Res <= '0';
		WAIT for CLK_PERIOD;
		assert Q = "0101" report "(2) LOAD ROM A Fehlerhaft" severity error;

      wait;
   end process;

END;
