library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity MULC is
    port 
		(
			input1 ,input2  	: in  std_logic_vector(119 downto 0);
			M0,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14 : out std_logic_vector(15 downto 0)
		);
end entity;
architecture Behavioral of MULC is
begin
M0<=input1(119 downto 112)*input2(119 downto 112);
M1<=input1(111 downto 104)*input2(111 downto 104);
M2<=input1(103 downto 96)*input2(103 downto 96);
M3<=input1(95 downto 88)*input2(95 downto 88);
M4<=input1(87 downto 80)*input2(87 downto 80);
M5<=input1(79 downto 72)*input2(79 downto 72);
M6<=input1(71 downto 64)*input2(71 downto 64);
M7<=input1(63 downto 56)*input2(63 downto 56);
M8<=input1(55 downto 48)*input2(55 downto 48);
M9<=input1(47 downto 40)*input2(47 downto 40);
M10<=input1(39 downto 32)*input2(39 downto 32);
M11<=input1(31 downto 24)*input2(31 downto 24);
M12<=input1(23 downto 16)*input2(23 downto 16);
M13<=input1(15 downto 8)*input2(15 downto 8);
M14<=input1(7 downto 0)*input2(7 downto 0);
end Behavioral;