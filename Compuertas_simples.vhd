library IEEE;
use IEEE.std_logic_1164.all; --Libreria Estandar.
--Descripcion de caja negra.
entity Compuertas_basicas is
	port(
	A,B: in std_logic;
	F: out std_logic_vector(1 to 7)
	);
	end Compuertas_basicas;
	architecture simple of Compuertas_basicas is
begin
F(1)<= not A;
F(2)<= not B;
F(3)<= A NAND B;
F(4)<= A NOR B;
F(5)<= A AND B;
F(6)<= A OR B;
F(7)<= A XOR B;
end simple;