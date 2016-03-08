library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_bit_subtracter is
generic(
  n : integer := 8
);
port(
  A  : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  B  : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  Bi : IN  STD_LOGIC;
  S  : OUT STD_LOGIC_VECTOR(n-1 downto 0);
  Bo : OUT STD_LOGIC
);
end n_bit_subtracter;
architecture Behavioral of n_bit_subtracter is
signal borrow : std_logic_vector(n downto 0);
begin	 
process(A,B,Bi,borrow)
begin
  borrow(0) <= Bi;
  for i in 0 to n-1 loop
    S(i) <= A(i) XOR B(i) XOR borrow(i);
    borrow(i+1) <= ((NOT A(i)) AND B(i)) OR ((NOT A(i)) AND borrow(i)) OR (borrow(i) AND B(i));
  end loop;
  Bo <= borrow(n);
end process;
end Behavioral;
