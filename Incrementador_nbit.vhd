library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbit_incrementer is
generic(
  n : integer := 8
);
port(
  A : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  Y : OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end nbit_incrementer;

architecture Behavioral of nbit_incrementer is
signal B : std_logic_vector(n-1 downto 0);
begin
	process(A,B)
begin
  B(0)<='1';
  for i in 0 to n-2 loop
   B(i)<=B(i-1) AND A(i-1);
  end loop;
   Y<=A XOR B;   
end process;
end Behavioral;
