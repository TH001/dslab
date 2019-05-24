--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.6
--  \   \         Application : sch2hdl
--  /   /         Filename : mux2.vhf
-- /___/   /\     Timestamp : 04/26/2019 11:02:35
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /vol/fob-vol7/mi18/heinetom/dslab/mux/mux2.vhf -w /vol/fob-vol7/mi18/heinetom/dslab/mux/mux2.sch
--Design Name: mux2
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity mux2 is
   port ( S  : in    std_logic; 
          X0 : in    std_logic; 
          X1 : in    std_logic; 
          Y  : out   std_logic);
end mux2;

architecture BEHAVIORAL of mux2 is
   attribute BOX_TYPE   : string ;
   signal XLXN_15 : std_logic;
   signal XLXN_16 : std_logic;
   signal XLXN_19 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_3 : AND2
      port map (I0=>X0,
                I1=>XLXN_19,
                O=>XLXN_16);
   
   XLXI_4 : AND2
      port map (I0=>S,
                I1=>X1,
                O=>XLXN_15);
   
   XLXI_5 : OR2
      port map (I0=>XLXN_16,
                I1=>XLXN_15,
                O=>Y);
   
   XLXI_6 : INV
      port map (I=>S,
                O=>XLXN_19);
   
end BEHAVIORAL;


