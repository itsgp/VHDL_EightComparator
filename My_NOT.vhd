library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity My_NOT is
    Port ( a : in  STD_LOGIC;
           b : out  STD_LOGIC);
End My_NOT;

Architecture Behavioral of My_NOT is

Begin

b <= NOT a;

End Behavioral;

