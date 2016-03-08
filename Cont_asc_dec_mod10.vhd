library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity M4_UD_counter is
port(
  Sys_Clk  : IN  STD_LOGIC;
  Sys_Aclr : IN  STD_LOGIC;
  U_D		  : IN  STD_LOGIC;
  Y        : OUT STD_LOGIC_VECTOR(1 downto 0)
);
end M4_UD_counter;

architecture Behavioral of M4_UD_counter is
signal P_S, N_S : std_logic_vector(1 downto 0);
begin
Comb:process(P_S, U_D)
begin
  case P_S is
    when "00"   => if(U_D='0')then
		   N_S <= "01";
		 else
		   N_S <= "11";
		 end if;
    when "01"   => if(U_D='0')then
		   N_S <= "10";
		 else
		   N_S <= "00";
		 end if;
    when "10"   => if(U_D='0')then
		   N_S <= "11";
		 else
		   N_S <= "01";
		 end if;
    when others => if(U_D='0')then
		   N_S <= "00";
		 else
		   N_S <= "10";
		 end if;
  end case;
Y <= P_S;
end process Comb;

Seq:process(Sys_Aclr,Sys_Clk)
begin
  if(Sys_Aclr='1')then
    P_S <= "00";
  elsif(Sys_Clk'event AND Sys_Clk='1')then
    P_S <= N_S;
  end if;
end process Seq;
end Behavioral;


