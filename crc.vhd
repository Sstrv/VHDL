library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity CRC is
	port 
	(
		clk         : in   std_logic;
		sel         : in   std_logic;
		error_i		: out  std_logic;
		Palabra_i	: in   std_logic_vector(7  downto 0);
		Palabra_o	: out  std_logic_vector(11 downto 0)
	);
end CRC;
architecture Behavioral of CRC is
signal Palabra_s 		: std_logic_vector(11 downto 0);
signal Palabra_bin 	: std_logic_vector(3  downto 0);
signal divisor   		: std_logic_vector(4  downto 0):="11111";
signal estados   		: integer range 0 to 3 :=0;
signal n         		: integer range 0 to 7 :=0;
signal Palabra_sal 	: std_logic_vector(11 downto 0);

begin
process(clk)
	begin 
	if rising_edge(clk) then 
		if    estados = 0 then 	
			if    sel = '0' then 
				palabra_s <= palabra_i & "0000";
			elsif sel = '1' then 
				palabra_s <= palabra_i & Palabra_bin;
			end if; 
			estados <= estados + 1;
		elsif estados = 1 then 	
			if    palabra_s(11-n) = '0' then 
				palabra_s(11-n downto 7-n) <= palabra_s(11-n downto 7-n) xor "00000";
			elsif palabra_s(11-n) = '1' then 
				palabra_s(11-n downto 7-n) <= palabra_s(11-n downto 7-n) xor divisor;
			end if;
			n <= n + 1;
			if    n = 7 and sel = '0' then 
				estados <= estados + 1;
				n<=0;
			elsif n = 7 and sel = '1' then  
				estados <= estados + 2;
				n<=0;
			end if;
		elsif estados = 2 then 
			palabra_sal <= palabra_i & palabra_s(3 downto 0);
			palabra_bin <=             palabra_s(3 downto 0);
			error_i<='0';
			estados     <= 0;
		elsif estados = 3 then 
			if palabra_s(3 downto 0) /= "0000" then 
				error_i <= '1';
			else 
				error_i <= '0';
			end if;
			estados <= 0;
		end if;
	end if;
end process;
palabra_o <= palabra_sal;
end Behavioral;
