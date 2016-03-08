library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nbit_arith_mult is		
generic(
  n : integer := 4
);
port(
  A  : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  B  : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  M1 : OUT STD_LOGIC_VECTOR(n*2-1 downto 0);
  M2 : OUT STD_LOGIC_VECTOR(n*2-1 downto 0)
);
end nbit_arith_mult;
architecture Behavioral of nbit_arith_mult is
begin
process(A, B)
variable MUU : unsigned(2*n-1 downto 0);
variable MSS : signed(2*n-1 downto 0);
begin
  MUU := unsigned(A) * unsigned(B);
  MSS := signed(A) * signed(B);
  M1 <= std_logic_vector(MUU);
  M2 <= std_logic_vector(MSS);
end process;
end Behavioral;