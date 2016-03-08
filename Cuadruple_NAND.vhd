Library IEEE;
use IEEE. std_logic_1164.all;
entity Cuadruple is
port(
A,B: in std_logic_vector(1 to 4);
F: out std_logic_vector(1 to 4)
);
end Cuadruple;

architecture simple of Cuadruple is
begin
F<=A NAND B;
end simple;
