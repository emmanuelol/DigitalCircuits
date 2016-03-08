library	IEEE;
use IEEE.std_logic_1164.all;

entity Suma_4_cascada is
	port(
	A,B	: in std_logic_vector(3 downto 0);
	Ci	: in std_logic;
	Co	: out std_logic;
	S	: out std_logic_vector(3 downto 0)
	);
end Suma_4_cascada;
architecture completa of Suma_4_cascada is
signal C1,C2,C3 : std_logic;
component Suma_1
	port(
	A,B	: in std_logic;
	Ci	: in std_logic;
	Co	: out std_logic;
	S	: out std_logic
	);
end component;
begin
	Sumador_1:Suma_1 port map (A(0), B(0), Ci, C1, S(0));
	Sumador_2:Suma_1 port map (A(1), B(1), C1, C2, S(1));
	Sumador_3:Suma_1 port map (A(2), B(2), C2, C3, S(2));
	Sumador_4:Suma_1 port map (A(3), B(3), C3, Co, S(3));
	end completa;