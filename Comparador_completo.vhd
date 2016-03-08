library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_1bit_comparator is
port(
  A  : IN  STD_LOGIC;
  B  : IN  STD_LOGIC;
  Gi : IN  STD_LOGIC;
  Ei : IN  STD_LOGIC;
  Li : IN  STD_LOGIC;
  Go : OUT STD_LOGIC;
  Eo : OUT STD_LOGIC;
  Lo : OUT STD_LOGIC
);
end full_1bit_comparator;
architecture Behavioral of full_1bit_comparator is
begin
Go <= Gi OR (Ei AND (A AND (NOT B)));
Eo <= Ei AND (A XNOR B);
Lo <= Li OR (Ei AND ((NOT A) AND B));
end Behavioral;




