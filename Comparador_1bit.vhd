library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_1bit_comparator is
port(
  A  : IN  STD_LOGIC;
  B  : IN  STD_LOGIC;
  Go : OUT STD_LOGIC;
  Eo : OUT STD_LOGIC;
  Lo : OUT STD_LOGIC
);
end half_1bit_comparator;

architecture Behavioral of half_1bit_comparator is
begin
Go <= A AND (NOT B);
Eo <= A XNOR B;
Lo <= (NOT A) AND B;
end Behavioral;
