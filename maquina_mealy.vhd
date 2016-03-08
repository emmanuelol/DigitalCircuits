library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mealy_FSM is
port(
  Sys_Aclr : IN  STD_LOGIC;
  Sys_Clk  : IN  STD_LOGIC;
  X        : IN  STD_LOGIC;
  Y        : OUT STD_LOGIC
);
end Mealy_FSM;

architecture Behavioral of Mealy_FSM is
signal  N_S : std_logic_vector(2 downto 0);
begin
process(Sys_Aclr,Sys_Clk)
begin
  if(Sys_Aclr='1')then
    N_S <= "001";
	 Y   <= '0';
elsif(Sys_Clk'event AND Sys_Clk='1')then
    case N_S is
	   when "001"  => if(X='0')then
		                 Y   <= '0';
		                 N_S <= "001";
                     else
		                Y   <= '1';
		                N_S <= "010";
                     end if;
		when "010"  => if(X='0')then
		                 Y   <='1';
		                 N_S <= "100";
                     else
		                Y   <= '1';
		                N_S <= "010";
                     end if;
		when "100"  => if(X='0')then
		                 Y   <='1';
	  	                 N_S <= "100";
 else
		                 Y   <= '0';
		                 N_S <= "001";
                     end if;
		when others =>   Y   <='0';
		                 N_S <= "001";
    end case;
  end if;
end process;
end Behavioral;


