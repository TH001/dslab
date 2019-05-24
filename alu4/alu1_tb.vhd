-- Vhdl test bench created from schematic /vol/home-vol3/signal/fwinkler/xilinx/ds2014/alu4/alu1.sch - Tue Apr  1 16:14:50 2014
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
ENTITY alu1_alu1_sch_tb IS
END alu1_alu1_sch_tb;
ARCHITECTURE behavioral OF alu1_alu1_sch_tb IS 

   COMPONENT alu1
   PORT(  BA	:	IN	STD_LOGIC; 
          cin	:	IN	STD_LOGIC; 
          q	:	OUT	STD_LOGIC; 
          cout	:	OUT	STD_LOGIC; 
          a	:	IN	STD_LOGIC; 
          b	:	IN	STD_LOGIC; 
          S	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;
	
  COMPONENT alu1generate
   PORT( s3	:	IN	STD_LOGIC; 
          a	:	IN	STD_LOGIC; 
          s2	:	IN	STD_LOGIC; 
          b	:	IN	STD_LOGIC; 
          g	:	OUT	STD_LOGIC);
   END COMPONENT;

	COMPONENT alu1propagate
   PORT( s0	:	IN	STD_LOGIC; 
          b	:	IN	STD_LOGIC; 
          not_p	:	OUT	STD_LOGIC; 
          s1	:	IN	STD_LOGIC; 
          a	:	IN	STD_LOGIC);
   END COMPONENT;

-- generate/propagate Signale
   SIGNAL g	:	STD_LOGIC;
   SIGNAL not_p	:	STD_LOGIC;

--ALU1 Signale
   SIGNAL BA	:	STD_LOGIC;
   SIGNAL cin	:	STD_LOGIC;
   SIGNAL q	:	STD_LOGIC;
   SIGNAL cout	:	STD_LOGIC;
   SIGNAL a	:	STD_LOGIC;
   SIGNAL b	:	STD_LOGIC;
   SIGNAL S	:	STD_LOGIC_VECTOR (3 DOWNTO 0);

-- Interne Signale	
	SIGNAL TESTPHASE: String(1 to 3);
	SIGNAL ab: STD_LOGIC_VECTOR(0 to 1);
	

BEGIN


   UUT_G: alu1generate PORT MAP(
		s3 => s(3), 
		a => a, 
		s2 => s(2), 
		b => b, 
		g => g
   );
	
   UUT_NOT_P: alu1propagate PORT MAP(
		s0 => s(0), 
		b => b, 
		not_p => not_p, 
		s1 => s(1), 
		a => a
   );
	

   UUT_ALU: alu1 PORT MAP(
		BA => BA, 
		cin => cin, 
		q => q, 
		cout => cout, 
		a => a, 
		b => b, 
		S => S
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
	
	VARIABLE Q_test : STD_LOGIC_VECTOR(4 downto 0);
	
	
   BEGIN
	-- generate/propagate Test
	TESTPHASE <= "GEN";
	a <= '0';
	b <= '0';
	S <= "0000";
	WAIT for 2 ns;

	   report "Start generate/propagate test" ;		
	WAIT for 8 ns;

		
	assert g = '0' report "(0) generate Fehlerhaft" severity error;
	assert not_p = '0' report "(0) propagate Fehlerhaft" severity error;
	
	a <= '1';
	b <= '1';	
	S <= "1000";	-- AND
	WAIT for 10 ns;
	assert g = '1' report "(1) generate Fehlerhaft" severity error;	

	a <= '1';
	b <= '0';	
	S <= "0100";	-- AND not B
	WAIT for 10 ns;
	assert g = '1' report "(2) generate Fehlerhaft" severity error;		

	a <= '0';
	b <= '1';	
	S <= "1100";	-- A
	WAIT for 10 ns;
	assert g = '0' report "(3) generate Fehlerhaft" severity error;		

	TESTPHASE <= "PRO";	
	
	a <= '0';
	b <= '0';		
	S <= "0001";	-- OR
	WAIT for 10 ns;
	assert not_p = '1' report "(4) propagate Fehlerhaft" severity error;		

	a <= '0';
	b <= '1';		
	S <= "0010";	-- not A AND B
	WAIT for 10 ns;
	assert not_p = '1' report "(5) propagate Fehlerhaft" severity error;		

	a <= '1';
	b <= '1';		
	S <= "0011";	-- NOT A
	WAIT for 10 ns;
	assert not_p = '0' report "(6) propagate Fehlerhaft" severity error;		

   report "End generate/propagate test" ;	
-------------------------------------
-- Ab hier erfolgt der Test der alu1
-------------------------------------

 -----------------------------------------------------
 -- hier Logik-Tests 
 ----------------------------------------------------- 
	BA <= '1';
	for j in 0 to 15 loop
		S <= std_logic_vector(to_unsigned(j,4));
		for i in 0 to 3 loop
			ab <= std_logic_vector(to_unsigned(i,2));
			a <= ab(0);
			b <= ab(1);
			for h in 0 to 1 loop
				if(h=0) then cin <= '0';
				else cin <= '1';
				end if;
				wait for 10 ns;
				schleife: case S is
					when "0000" => Q_test(0) := '0';
					when "0001" => Q_test(0) := not(a or b);
					when "0010" => Q_test(0) := not(a) and b;
					when "0011" => Q_test(0) := not(a);
					when "0100" => Q_test(0) := a and not(b);
					when "0101" => Q_test(0) := not(b);
					when "0110" => Q_test(0) := (a and not(b)) or (not(a) and b);
					when "0111" => Q_test(0) := not(a and b);
					when "1000" => Q_test(0) := a and b;
					when "1001" => Q_test(0) := (a and b) or (not(a) and not(b));
					when "1010" => Q_test(0) := b;
					when "1011" => Q_test(0) := not(a) or b;
					when "1100" => Q_test(0) := a;
					when "1101" => Q_test(0) := a or not(b);
					when "1110" => Q_test(0) := a or b;
					when "1111" => Q_test(0) := '1';
					when others => report "grausamer Fehler Fehlerhaft";
				end case;
				assert q = Q_test(0) report "S:" & integer'image(j)&" ab:"& integer'image(i) &" cin:"& integer'image(h) &" generate Fehlerhaft" severity error;
			end loop;
		end loop;
	end loop;
	

 -----------------------------------------------------
 -- hier Arithmetik-Tests 
 ----------------------------------------------------- 

	BA <= '0';
	for j in 0 to 15 loop
		S <= std_logic_vector(to_unsigned(j,4));
		for i in 0 to 3 loop
			ab <= std_logic_vector(to_unsigned(i,2));
			a <= ab(0);
			b <= ab(1);
			for h in 0 to 1 loop
				if(h=0) then cin <= '0';
				else cin <= '1';
				end if;
				wait for 10 ns;
				schleife1: case S is
					when "0011" => 
						Q_test(0) := a xor cin;
						Q_test(1) := a and cin;
						assert q = Q_test(0) report "S:" & integer'image(j)&" ab:"& integer'image(i) &" cin:"& integer'image(h) &" generate Fehlerhaft" severity error;
					when "0110" => 
						Q_test(0) := a xnor not(b) xnor cin;
						Q_test(1) := (a and not(b)) or (cin and (a or not(b)));
						assert q = Q_test(0) report "S:" & integer'image(j)&" ab:"& integer'image(i) &" cin:"& integer'image(h) &" generate Fehlerhaft" severity error;
					when "1001" => 
						Q_test(0) := a xor b xor cin;
						Q_test(1) := (a and b) or (cin and (a or b));
						assert q = Q_test(0) report "S:" & integer'image(j)&" ab:"& integer'image(i) &" cin:"& integer'image(h) &" generate Fehlerhaft" severity error;
					when "1100" => Q_test(0) := a;
						Q_test(0) := not(a) xor cin;
						Q_test(1) := not(a) and cin;
						assert q = Q_test(0) report "S:" & integer'image(j)&" ab:"& integer'image(i) &" cin:"& integer'image(h) &" generate Fehlerhaft" severity error;
					when others => null;--report "grausamer Fehler Fehlerhaft";
				end case;
				
			end loop;
		end loop;
	end loop;

	
	report "Done - simulation stopped unconditional" severity failure;	
	
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
