library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_incrementer_decrementer is
generic(
  n : integer := 8
);
port(
  A : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  S : IN  STD_LOGIC;
  Y : OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end n_bit_incrementer_decrementer;

architecture Behavioral of n_bit_incrementer_decrementer is
signal B, C : std_logic_vector(n-1 downto 0);
begin
process(A, S, B, C)
begin
  B(0) <= '1';
  C(0) <= '0';
  for i in 0 to n-2 loop
    C(i+i) <= C(i) OR A(i);
    B(i+1) <= B(i) AND A(i);
  end loop;
  if(S='0')then
    Y <= A XOR B;
  else
    Y <= A XOR C;
  end if;
end process;
end Behavioral;

