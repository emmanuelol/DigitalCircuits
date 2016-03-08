library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nbit_arith_inc_dec is
generic(
  n : integer := 8
);
port(
  A  : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  S  : IN  STD_LOGIC;
  Y  : OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end nbit_arith_inc_dec;
architecture Behavioral of nbit_arith_inc_dec is
begin
process(A, S)
begin
  if(S='0')then
    Y <= A + 1;
  else
    Y <= A - 1;
  end if;
end process;
end Behavioral;
