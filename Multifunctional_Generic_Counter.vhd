library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mf_g_counter is
generic(
  n : integer := 8
);
port(
  Sys_Clk  : IN  STD_LOGIC;
  Sys_Aclr : IN  STD_LOGIC;
  Oper     : IN  STD_LOGIC_VECTOR(1 downto 0);
  Count    : OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end mf_g_counter;

architecture Behavioral of mf_g_counter is
signal P_S, N_S : std_logic_vector(n-1 downto 0);
begin

Comb:process(P_S,Oper)
begin
case Oper is
  when "00"   => N_S <= (others=>'0');
  when "01"   => N_S <= P_S;
  when "10"   => N_S <= P_S + 1;
  when others => N_S <= P_S - 1;
end case;
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
