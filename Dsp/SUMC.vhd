library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity SUMC is
    port 
		(
			M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14: in  std_logic_vector(19 downto 0);
			output1	:out  std_logic_vector(19 downto 0)
		);
end entity;
architecture Behavioral of SUMC is
begin
output1<=M0 + M1 + M2 + M3 + M4 + M5 + M6 + M7 + M8 + M9 + M10 + M11 + M12 + M13 + M14;
end Behavioral;