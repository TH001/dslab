-- Vhdl test bench created from schematic /vol/home-vol3/signal/fwinkler/xilinx/ds2014/mux4/mux4.sch - Mon Mar 31 12:52:15 2014
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. =>
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY mux4_mux4_sch_tb IS
END mux4_mux4_sch_tb;
ARCHITECTURE behavioral OF mux4_mux4_sch_tb IS 

   COMPONENT mux4
   PORT(  X0	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          X1	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          Y	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          S	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL X0	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL X1	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL Y	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL S	:	STD_LOGIC;
	
BEGIN

   UUT: mux4 PORT MAP(
		X0 => X0, 
		X1 => X1, 
		Y => Y, 
		S => S
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
	
	VARIABLE temp	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	
   BEGIN
		for i in 0 to 17 loop
			case i is
				when 0 => temp := "0000";
				when 1|5| 9|13 => temp := "0001";
				when 2|6|10|14 => temp := "0010";
				when 3|7|11|15 => temp := "0100";
				when 4|8|12|16 => temp := "1000";
				when others => null;
			end case;
			
			case i is
				when 0 to 4 | 9 to 12 => X0 <= temp;
				when 5 to 8 | 13 to 16 => X1 <= temp;
				when others => null;
			end case;
			case i is
				when 0 to 4 => X1 <= "0000";
				when 5 to 8 => X0 <= "0000";
				when 9 to 12 => X1 <= "1111";
				when 13 to 16 => X0 <= "1111";
				when others => null;
			end case;
			if (i = 17) then
				X0 <= "1111";
				X1 <= "1111";
			end if;
			
			S  <= '0';
			wait for 100 ns;
			assert Y = X0 report "(1) Y /= X0" severity error;
			
			S  <= '1';
			wait for 100 ns;
			assert Y = X1 report "(2) Y /= X0" severity error;
		end loop;
		
		report "Done ... Simulation stopped unconditional"
		severity failure;	-- stoppt jede simulation sicher
		
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
