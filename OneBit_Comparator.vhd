library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity OneBit_Comparator is
    Port ( a, b, gt_than, eq_than, le_than : in  STD_LOGIC;
           g, e, l : out  STD_LOGIC);
End OneBit_Comparator;

Architecture Structural of OneBit_Comparator is

	Component My_AND is
		 Port ( a, b : in   STD_LOGIC;
				  c    : out  STD_LOGIC);
	End Component;

	Component My_OR is
		 Port ( a, b : in   STD_LOGIC;
				  c    : out  STD_LOGIC);
	End Component;

	Component My_NOT is
		 Port ( a : in  STD_LOGIC;
				  b : out  STD_LOGIC);
	End Component;
	
	signal andOne_out, notOne_out, andTwo_out, andThree_out, andFour_out, notThree_out, andFive_out, andSix_out, andSeven_out, andEight_out : STD_LOGIC;

Begin

	-- A < B : l

	andOne:My_AND port map (eq_than, b, andOne_out);
	notOne:My_NOT port map (a, notOne_out);
	andTwo:My_AND port map (andOne_out, notOne_out, andTwo_out);
	orOne:My_OR port map (andTwo_out, le_than, l);
	
	-- A = B : e
	
	andThree:My_AND port map (eq_than, a, andThree_out);
	andFour:My_AND port map (andThree_out, b, andFour_out);
	
	notThree:My_NOT port map (b, notThree_out);
	andFive:My_AND port map (notOne_out, notThree_out, andFive_out);
	andSix:My_AND port map (eq_than, andFive_out, andSix_out);
	
	orTwo:My_OR port map (andFour_out, andSix_out, e);
	
	-- A > B : g
	
	andSeven:My_AND port map (a, notThree_out, andSeven_out);
	andEight:My_AND port map (eq_than, andSeven_out, andEight_out);
	orThree:My_OR port map (gt_than, andEight_out, g);
	
End Structural;

