Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity u_sregister is
generic(
  n : integer := 8
);
port(
  Aclr : IN  STD_LOGIC;
  Clk  : IN  STD_LOGIC;
  R    : IN  STD_LOGIC;
  L    : IN  STD_LOGIC;
  D    : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  OPC  : IN  STD_LOGIC_VECTOR(1 downto 0);
  QR   : OUT STD_LOGIC;
  QL   : OUT STD_LOGIC;
  Q    : OUT STD_LOGIC_VECTOR(n-1 downto 0)
);
end u_sregister;
architecture Behavioral of u_sregister is
signal P_S, N_S : std_logic_vector(n-1 downto 0);
begin
Comb:process(OPC,P_S,D,R,L)
begin
  case OPC is
    when "00"   =>
	   N_S <= P_S;
	 when "01"   =>
	   N_S <= D;
	 when "10"   =>
	   N_S <= R & P_S(n-1 downto 1);
	 when others =>
	   N_S <= P_S(n-2 downto 0) & L;
  end case;
  QR <= P_S(0);
  QL <= P_S(n-1);
  Q  <= P_S;
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


