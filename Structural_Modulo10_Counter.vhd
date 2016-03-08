library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity M10e_counter is
port(
  Sys_Clk  : IN  STD_LOGIC;
  Sys_Aclr : IN  STD_LOGIC;
  Count    : OUT STD_LOGIC_VECTOR(3 downto 0)
);
end M10e_counter;

architecture Behavioral of M10e_counter is
signal P_S, N_S : std_logic_vector(3 downto 0);
begin
Comb:process(P_S)
begin
if(P_S="1001")then
    N_S <= "0000";
  else
    N_S <= P_S + 1;
  end if;
  Count <= P_S;
end process Comb;

Seq:process(Sys_Clk,Sys_Aclr)
begin
  if(Sys_Aclr='1')then
    P_S <= "0000";
  elsif(Sys_Clk'event AND Sys_Clk='1')then
    P_S <= N_S;
  end if;
end process Seq;
end Behavioral;

