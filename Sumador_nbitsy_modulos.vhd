library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nbit_arith_adder is
generic(
  n : integer := 8
);
port(
  A  : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  B  : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  Ci : IN  STD_LOGIC;
  S  : OUT STD_LOGIC_VECTOR(n-1 downto 0);
  Co : OUT STD_LOGIC
);
end nbit_arith_adder;
architecture Behavioral of nbit_arith_adder is
begin
process(A, B, Ci)
variable SUM : unsigned(n downto 0);
begin
  SUM := unsigned('0' & A) + unsigned('0' & B) + Ci;
  S <= std_logic_vector(SUM(n-1 downto 0));
  Co <= std_logic(SUM(n));
end process;
end Behavioral;