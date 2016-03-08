library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM_4_to_2 is
port(
  A : IN  STD_LOGIC_VECTOR(3 downto 0);
  D : OUT STD_LOGIC_VECTOR(1 downto 0)
);
end ROM_4_to_2;

architecture Behavioral of ROM_4_to_2 is
begin
process(A)
begin
  case A is
    when "0000" => D <= "01";
    when "0001" => D <= "00";
    when "0010" => D <= "01";
    when "0011" => D <= "01";
    when "0100" => D <= "00";
    when "0101" => D <= "11";
    when "0110" => D <= "11";
    when "0111" => D <= "10";
    when "1000" => D <= "01";
    when "1001" => D <= "01";
    when "1010" => D <= "10";
    when "1011" => D <= "11";
    when "1100" => D <= "00";
    when "1101" => D <= "00";
    when "1110" => D <= "01";
    when others => D <= "00";
  end case;
end process;
end Behavioral;
