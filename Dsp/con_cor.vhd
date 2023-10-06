library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity con_cor is
    port 
		(
			clk		  			: in  std_logic;
			input1 ,input2  	: in  std_logic_vector(119 downto 0);
			output1 				: out std_logic_vector(19 downto 0)
		);
end entity;
architecture Behavioral of con_cor is
component MULC is 
port	(
			input1 ,input2  	: in  std_logic_vector(119 downto 0);
			M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14 : out std_logic_vector(15 downto 0)
		);
end component;
component SUMC is 
port	(
			M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14: in  std_logic_vector(19 downto 0);
			output1	:out  std_logic_vector(19 downto 0)
		);
end component;
component regc is 
port	(
			clk		: in  std_logic;
			input1	: in  std_logic_vector(119 downto 0);
			output1	:out  std_logic_vector(119 downto 0)
		);
end component;
signal Mux : std_logic_vector(119 downto 0):="000000001111111100000000111111110000000011111111000000001111111100000000111111110000000011111111000000001111111100000000";
signal d1 : std_logic_vector(19 downto 0);
signal d2 : std_logic_vector(119 downto 0);
signal M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14  : std_logic_vector(15 downto 0);
begin
MUL:MULC port map
		(
			input1  	=>input1,
			input2  	=>d2,
			M0=>M0,
			M1=>M1,
			M2=>M2,
			M3=>M3,
			M4=>M4,
			M5=>M5,
			M6=>M6,
			M7=>M7,
			M8=>M8,
			M9=>M9,
			M10=>M10,
			M11=>M11,
			M12=>M12,
			M13=>M13,
			M14=>M14 
		);
sum:SUMC port map
		(
			output1  	=>d1,
			M0 =>"0000"& M0,
			M1 =>"0000"& M1,
			M2 =>"0000"& M2,
			M3 =>"0000"& M3,
			M4 =>"0000"& M4,
			M5 =>"0000"& M5,
			M6 =>"0000"& M6,
			M7 =>"0000"& M7,
			M8 =>"0000"& M8,
			M9 =>"0000"& M9,
			M10=>"0000"& M10,
			M11=>"0000"& M11,
			M12=>"0000"& M12,
			M13=>"0000"& M13,
			M14=>"0000"& M14 
		);
reg:regc port map
		(
			clk		=>clk,
			input1	=>input2,
			output1	=>d2
		);
output1<=d1;
end Behavioral;