library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity et_gregister is
generic(
  n : integer := 8
);
port(
  Aclr : IN  STD_LOGIC;
  Clk  : IN  STD_LOGIC;
  D    : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  Q    : OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end et_gregister;

architecture Behavioral of et_gregister is
begin
process(Aclr,Clk)
begin
  if(Aclr='1')then
    Q <= (others => '0');
  elsif(Clk'event AND Clk='1')then
    Q <= D;
  end if;
end process;
end Behavioral;

