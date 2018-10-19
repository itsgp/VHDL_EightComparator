library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity EightBit_Comparator is
    Port ( a, b : IN STD_LOGIC_VECTOR(7 downto 0);
			  gt_than, eq_than, le_than : in  STD_LOGIC;
           g, e, l : out  STD_LOGIC);
End EightBit_Comparator;

Architecture Structural of EightBit_Comparator is

	Component OneBit_Comparator is
		 Port ( a, b, gt_than, eq_than, le_than : in  STD_LOGIC;
				  g, e, l : out  STD_LOGIC);
	End Component;
	
	signal mid_gt, mid_eq, mid_lt : STD_LOGIC_VECTOR(7 downto 0);

Begin

	cp0:OneBit_Comparator port map (a(0), b(0), gt_than, eq_than, le_than, mid_gt(0), mid_eq(0), mid_lt(0));
	gen1:for i in 1 to 7 generate
		cp:OneBit_Comparator port map (a(i), b(i), mid_gt(i-1), mid_eq(i-1), mid_lt(i-1), mid_gt(i), mid_eq(i), mid_lt(i));
	End generate;
	
	g <= mid_gt(7);
	e <= mid_eq(7);
	l <= mid_lt(7);

End Structural;

