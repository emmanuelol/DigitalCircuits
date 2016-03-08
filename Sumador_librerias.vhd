library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package one_bit_fadder_pkg is
  component one_bit_fadder
  port(
    A  : IN  STD_LOGIC;
    B  : IN  STD_LOGIC;
    Ci : IN  STD_LOGIC;
    S  : OUT STD_LOGIC;
    Co : OUT STD_LOGIC
  );
  end component;
end one_bit_fadder_pkg;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_bit_fadder is
port(
  A  : IN  STD_LOGIC;
  B  : IN  STD_LOGIC;
  Ci : IN  STD_LOGIC;
  S  : OUT STD_LOGIC;
  Co : OUT STD_LOGIC
);
end one_bit_fadder;

architecture Behavioral of one_bit_fadder is
begin
S  <= A XOR B XOR Ci;
Co <= (A AND B) OR (A AND Ci) OR (B AND Ci);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work. Sumador_1_pkg.all;

entity sumador_4 is
port(
  A  : IN  STD_LOGIC_VECTOR(3 downto 0);
  B  : IN  STD_LOGIC_VECTOR(3 downto 0);
  Ci : IN  STD_LOGIC;
  S  : OUT STD_LOGIC_VECTOR(3 downto 0);
  Co : OUT STD_LOGIC
);
end sumador_4;

architecture Behavioral of sumador_4 is
--component one_bit_full_adder
--port(
  --A  : IN  STD_LOGIC;
  --B  : IN  STD_LOGIC;
  --Ci : IN  STD_LOGIC;
  --S  : OUT STD_LOGIC;
  --Co : OUT STD_LOGIC
--);
--end component;

signal C1,C2,C3: std_logic;

begin
sum_0: Sumador_1 port map (A(0),B(0),Ci,S(0),C1);
--sum_1: sumador_1 port map (A(1),B(1),C1,S(1),C2);
--sum_2: sumador_1 port map (A(2),B(2),C2,S(2),C3);
--sum_3: sumador_1 port map (A(3),B(3),C3,S(3),Co);

end Behavioral;
