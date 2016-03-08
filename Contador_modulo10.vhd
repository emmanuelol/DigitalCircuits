library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_10 is
port(
  Sys_Clk  : IN  STD_LOGIC;
  Sys_Aclr : IN  STD_LOGIC;
  Y        : OUT STD_LOGIC_VECTOR(3 downto 0)
);
end counter_10;

architecture Behavioral of counter_10 is
signal P_S, N_S : std_logic_vector(3 downto 0);
begin
Comb:process(P_S)
begin
  case P_S is
    when "0000" => N_S <= "0001";
	 when "0001" => N_S <= "0010";
	 when "0010" => N_S <= "0011";
        when "0011" => N_S <= "0100";
        when "0100" => N_S <= "0101";
	 when "0101" => N_S <= "0110";
	 when "0110" => N_S <= "0111";
	 when "0111" => N_S <= "1000";
	 when "1000" => N_S <= "1001";
	 when others => N_S <= "0000";
  end case;
  Y <= P_S;
end process Comb;

Seq:process(Sys_Aclr,Sys_Clk)
begin
  if(Sys_Aclr='1')then
    P_S <= "0000";
  elsif(Sys_Clk'event AND Sys_Clk='1')then
    P_S <= N_S;
  end if;
end process Seq;
end Behavioral;
