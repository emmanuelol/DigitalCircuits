library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latch_rst is
port(
  D   : IN  STD_LOGIC;
  L   : IN  STD_LOGIC;
  RST	: IN  STD_LOGIC;
  Q   : OUT STD_LOGIC
);
end latch_rst;

architecture Behavioral of latch_rst is
begin
  process(D, L, RST)
  begin
    if(RST = '1')then
	   Q <= '0';
elsif(L='1')then
	   Q <= D;
    end if;
  end process;
end Behavioral;

