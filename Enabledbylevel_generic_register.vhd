library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity g_register_ebl is
generic(
  n : integer := 8
);
port(
  Aclr : IN  STD_LOGIC;
  LE   : IN  STD_LOGIC;
  D    : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  Q    : OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end g_register_ebl;

architecture Behavioral of g_register_ebl is
begin
process(Aclr,LE,D)
begin
  if(Aclr='1')then
    Q <= (others => '0');
elsif(LE='1')then
    Q <= D;
  end if;
end process;
end Behavioral;

