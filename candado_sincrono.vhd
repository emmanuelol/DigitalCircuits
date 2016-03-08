library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch_syn_clr is
port(
  D   : IN  STD_LOGIC;
  L   : IN  STD_LOGIC;
  CLR : IN  STD_LOGIC;
  Q   : OUT STD_LOGIC
);
end latch_syn_clr;

architecture Behavioral of latch_syn_clr is
begin
process(D, L, CLR)
BEGIN
if(L='1')then
    if(CLR='1')then
	   Q <= '0';
    else
	   Q <= D;
    end if;
  end if;
end process;
end Behavioral;

