library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_adder is
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
end n_bit_adder;
architecture Behavioral of n_bit_adder is
signal carry : std_logic_vector(n downto 0);
begin
process(A,B,Ci,carry)
begin
  carry(0) <= Ci;
  for i in 0 to n-1 loop
    S(i) <= A(i) XOR B(i) XOR carry(i);
    carry(i+1) <= (A(i) AND B(i)) OR (A(i) AND carry(i)) OR (carry(i) AND B(i));
  end loop;
  Co <= carry(n);
end process;
end Behavioral;
