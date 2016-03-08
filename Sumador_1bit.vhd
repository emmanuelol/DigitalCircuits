library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
									  
entity Sumador_1bit is
port(
  A  : IN  STD_LOGIC;
  B  : IN  STD_LOGIC;
  Ci : IN  STD_LOGIC;
  S  : OUT STD_LOGIC;
  Co : OUT STD_LOGIC
);
end Sumador_1bit;

architecture Behavioral of Sumador_1bit is
begin
S  <= A XOR B XOR Ci;
Co <= (A AND B) OR (A AND Ci) OR (B AND Ci);
end Behavioral;
