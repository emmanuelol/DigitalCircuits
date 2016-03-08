library IEEE;
use IEEE.std_logic_1164.all;
--Descripcion de caja negra.
entity Comp_NAND	is
	port(
	A,B:in std_logic;
	F:out std_logic	
	);
end Comp_NAND;
--Descripcion del circuito.
architecture Simple of Comp_NAND is
begin
	F<=A NAND B;
	end Simple;