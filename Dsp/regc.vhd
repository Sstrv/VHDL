library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity regc is
    port 
		(
			clk		: in  std_logic;
			input1	: in  std_logic_vector(119 downto 0);
			output1	:out  std_logic_vector(119 downto 0)
		);
end entity;
architecture Behavioral of regc is
signal Sig				:   std_logic_vector(119 downto 0);
signal Villarruel 	:   integer range 0 to 15 :=15;
begin
process(clk)
begin
	if rising_edge(clk)then 
		if Villarruel < 15 then 
			Sig <= Sig(111 downto 0)& Sig(119 downto 112);
		elsif Villarruel = 15 then 
			Sig <= input1 ;
		end if;
		OUTput1 <= Sig;
		Villarruel <= Villarruel + 1;
	end if;
end process;
end Behavioral;