library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbit_decrementer is
generic(
  n : integer := 8
);
port(
  A : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  Y : OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end nbit_decrementer;

architecture Behavioral of nbit_decrementer is
signal B : std_logic_vector(n-1 downto 0);
begin
process(A,B)
begin
  B(0)<='0';
  for i in 0 to n-2 loop
    B(i+1)<=B(i) OR A(i);
  end loop;
  Y <= A XOR B;
end process;
end Behavioral;
