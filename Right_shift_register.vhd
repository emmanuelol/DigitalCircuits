library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rs_register is
generic(
  n : integer := 8
);
port(
  Aclr : IN  STD_LOGIC;
  Clk  : IN  STD_LOGIC;
  R    : IN  STD_LOGIC;
  Q    : OUT STD_LOGIC
);
end rs_register;

architecture Behavioral of rs_register is
signal P_S, N_S : std_logic_vector(n-1 downto 0);
begin
Comb:process(R,P_S)
begin
  N_S(n-1) <= R;
  for i in 0 to n-2 loop
    N_S(i) <= P_S(i+1);
  end loop;
  Q <= P_S(0);
end process Comb;

Seq:process(Aclr, Clk)
begin
  if(Aclr='1')then
    P_S <= (P_S'range => '0');
  elsif(Clk'event AND Clk='1')then
    P_S <= N_S;
  end if;
end process Seq;
end Behavioral;

