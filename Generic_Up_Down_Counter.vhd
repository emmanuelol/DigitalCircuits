library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity g_ud_counter is
generic(
  n : integer := 8
);
port(
  Sys_Clk  : IN  STD_LOGIC;
  Sys_Aclr : IN  STD_LOGIC;
  U_D      : IN  STD_LOGIC;
  Count    : OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end g_ud_counter;

architecture Behavioral of g_ud_counter is
signal P_S, N_S : std_logic_vector(n-1 downto 0);
begin
Comb:process(P_S)
begin
  if(U_D='0')then
    N_S <= P_S+1;
  else
    N_S <= P_S-1;
  end if;
  Count <= P_S;
end process Comb;

Seq:process(Sys_Aclr,Sys_Clk)
begin
  if(Sys_Aclr='1')then
    P_S <= (others=>'0');
  elsif(Sys_Clk'event AND Sys_Clk='1')then
    P_S <= N_S;
  end if;
end process Seq;
end Behavioral;

