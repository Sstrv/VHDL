library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity CLK_DIV is
	port
	(
		clk_i						: in	std_logic;
		start,clock				: out std_logic
	);
end entity;
architecture rtl of CLK_DIV is
signal div_start  : integer range 0 to 25e3 := 0;
signal div_clock  : integer range 0 to 25 := 0;
signal clk_start : std_logic := '0';
signal clk_clock: std_logic := '0';
begin
	divstart : process (clk_i)
	begin
		if (rising_edge(clk_i)) then	
				div_start <= div_start + 1;
				if div_start = 25e3 then
					clk_start <= not clk_start;
				end if;
		end if;
	end process divstart;
	divclock : process (clk_i)
	begin
		if (rising_edge(clk_i)) then	
				div_clock <= div_clock + 1;
				if div_clock = 25 then
					clk_clock <= not clk_clock;
				end if;
		end if;
	end process divclock;
start<=clk_start;
clock<=clk_clock;
end rtl;