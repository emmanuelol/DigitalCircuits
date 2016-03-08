library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_flip_flop is
port(
  D   : IN  STD_LOGIC;
  Clk : IN  STD_LOGIC;
  Q   : OUT STD_LOGIC
);
end D_flip_flop;

architecture Behavioral of D_flip_flop is
begin
process(Clk)
begin
  if(Clk'event AND Clk='1')then
    Q <= D;
  end if;
end process;
end Behavioral;