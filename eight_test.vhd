LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY eight_test IS
END eight_test;
 
ARCHITECTURE behavior OF eight_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT EightBit_Comparator
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         gt_than : IN  std_logic;
         eq_than : IN  std_logic;
         le_than : IN  std_logic;
         g : OUT  std_logic;
         e : OUT  std_logic;
         l : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal gt_than : std_logic := '0';
   signal eq_than : std_logic := '0';
   signal le_than : std_logic := '0';

 	--Outputs
   signal g : std_logic;
   signal e : std_logic;
   signal l : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EightBit_Comparator PORT MAP (
          a => a,
          b => b,
          gt_than => gt_than,
          eq_than => eq_than,
          le_than => le_than,
          g => g,
          e => e,
          l => l
        );
	
	a <= "10000000";
	b <= "10000000";
	gt_than <= '0';
	eq_than <= '1';
	le_than <= '0';
	
END;
