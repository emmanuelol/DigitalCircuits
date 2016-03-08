library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nbit_addsubt is
generic(
  n : integer := 4
);
port(
  A   : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  B   : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  CBi : IN  STD_LOGIC;
  Op  : IN  STD_LOGIC;
  S   : OUT STD_LOGIC_VECTOR(n-1 downto 0);
  CBo : OUT STD_LOGIC
);
end nbit_addsubt;
architecture Behavioral of nbit_addsubt is
signal CB : std_logic_vector(n downto 0);
signal AC : std_logic_vector(n-1 downto 0);
signal CI : std_logic_vector(n-1 downto 0);
begin
process(A,B,CBi,Op,CB,AC,CI)
begin
  CI <= (others => Op);
  AC <= A XOR CI;
  CB(0) <= CBi;
  for i in 0 to n-1 loop
    S(i) <= A(i) XOR B(i) XOR CB(i);
    CB(i+1) <= (AC(i) AND B(i)) OR (AC(i) AND CB(i)) OR (CB(i) AND B(i));
  end loop;
  CBo <= CB(n);
end process;
end Behavioral;