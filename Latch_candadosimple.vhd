library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch is
port(
  D : IN  STD_LOGIC;
  L : IN  STD_LOGIC;
  Q : OUT STD_LOGIC
);
end latch;

architecture Behavioral of latch is
begin
process(D, L)
begin
  if(L='1')then
    Q <= D;
  end if;
end process;
end Behavioral;
