library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gregister_we is
generic(
  n : integer := 8
);
port(
  Aclr : IN  STD_LOGIC;
  Clk  : IN  STD_LOGIC;
  E    : IN  STD_LOGIC;
  D    : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  Q    : OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end gregister_we;

architecture Behavioral of gregister_we is
signal P_S, N_S : std_logic_vector(n-1 downto 0);
begin
Comb:process(E,D,P_S)
begin
  if(E='1')then
    N_S <= D;
  else
    N_S <= P_S;
  end if;
  Q <= P_S;
end process Comb;

Seq:process(Aclr,Clk)
begin
  if(Aclr='1')then
    P_S <= (P_S'range => '0');
  elsif(Clk'event AND Clk='1')then
    P_S <= N_S;
  end if;
end process Seq;
end Behavioral;
