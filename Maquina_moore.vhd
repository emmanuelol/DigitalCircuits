library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Moore_FSM is
port(
  Sys_Aclr : IN  STD_LOGIC;
  Sys_Clk  : IN  STD_LOGIC;
  X        : IN  STD_LOGIC;
  Y        : OUT STD_LOGIC
);
end Moore_FSM;

architecture Behavioral of Moore_FSM is
type FSM_State is (S_A, S_B, S_C);
signal P_S, N_S : FSM_State;
begin
Combinational:process(P_S,X)
begin
  
case P_S is
    when S_A => Y <= '0';
	             if(X='0')then
		   N_S <= S_B;
		 else
		   N_S <= S_A;
		 end if;
    when S_B => Y <= '1';
	             if(X='0')then
		   N_S <= S_B;
		 else
		   N_S <= S_C;
		 end if;
    when S_C => Y <= '1';
	             if(X='0')then
		   N_S <= S_A;
		 else
		   N_S <= S_C;
		 end if;
  end case;
end process Combinational;
Sequential:process(Sys_Clk,Sys_Aclr)
begin
  if(Sys_Aclr='1')then
    P_S <= S_A;
  elsif(Sys_Clk'event AND Sys_Clk = '1')then
    P_S <= N_S;
  end if;
end process Sequential;
end Behavioral;
