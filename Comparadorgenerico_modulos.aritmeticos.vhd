library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nbit_arith_comp is
generic(
  n : integer := 4
);
port(
  A  : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  B  : IN  STD_LOGIC_VECTOR(n-1 downto 0);
  Gi : IN  STD_LOGIC;
  Ei : IN  STD_LOGIC;
  Li : IN  STD_LOGIC;
  Go : OUT STD_LOGIC;
  Eo : OUT STD_LOGIC;
  Lo : OUT STD_LOGIC
);
end nbit_arith_comp;
architecture Behavioral of nbit_arith_comp is
begin
process(A, B, Gi, Ei, Li)
begin
  if(Ei='1')then
    if(A > B)then
	   Go <= '1';
    else
	   Go <= '0';
    end if;
    if(A < B)then
      Lo <= '1';
    else
      Lo <= '0';
    end if;
    if(A=B)then
      Eo<= '1';
    else
      Eo <= '0';
    end if;
else
    Go <= Gi;
    Lo <= Li;
    Eo <= Ei;
  end if;
end process;
end Behavioral;

