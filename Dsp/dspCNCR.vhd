library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

--codigo echo por Santiago Rodriguez Villarruel 201813369 [https://github.com/Sstrv]
--Presentado a FABIAN ROLANDO JIMENEZ LOPEZ
--Universidad Pedagogica y Tecnologica de Colombia (UPTC)


entity DSPCNCR is
    port 
		(
			Sstrv,cncr,sod	  	: in  std_logic;
			input1 ,input2  	: in  std_logic_vector(7  downto 0);
			clock,star     	: out std_logic;
			Dato1,dato2			: out std_logic_vector(7 downto 0);
			output1 				: out std_logic_vector(19 downto 0)
		);
end entity;
architecture Behavioral of dspCNCR is
component CLK_div is 
port	(
			clk_i						: in	std_logic;
			start,clock				: out std_logic
		);
end component;
component Addata is 
port	(
			clk,cncr,sod	  			: in  std_logic;
			input1 ,input2  	: in  std_logic_vector(7  downto 0);
			Dato1,Dato2			: out std_logic_vector(7 downto 0);
			output1,output2	: out std_logic_vector(119 downto 0)
		);
end component;
component con_cor is
port 
		(
			clk		  			: in  std_logic;
			input1 ,input2  	: in  std_logic_vector(119 downto 0);
			output1 				: out std_logic_vector(19 downto 0)
		);
end component;
signal aux,bux : std_logic_vector(119 downto 0);
signal clk_d   :std_logic;
begin
div_fre:clk_div port map 
		(
			clk_i	=> Sstrv,
			start => clk_d,
			clock	=> clock 
		);
ordata:addata port map 
		(
			clk=>clk_d,
			cncr=>cncr,	  			
			input1=>input1,
			input2=>input2,
			output1=>aux,
			output2=>bux,
			sod=>sod,
			dato1=>dato1,
			dato2=>dato2
		);
comv_corr:con_cor port map
		(
			clk => clk_d,
			input1 =>Aux , 
			input2 => Bux, 	
			output1 =>output1			
		);
star<= clk_d;
end Behavioral;
