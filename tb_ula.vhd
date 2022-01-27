library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_ula is
end tb_ula;

architecture tb of tb_ula is
    signal A, M, apo:std_logic_vector(3 downto 0);
    signal ulaop: std_logic_vector(1 downto 0);
begin
    UUT : entity work.ula port map 
	            (a, m, ulaop, apo);
    A <= "1001";
    M <= "1010";
    ulaop <= "01", "10" after 20 ns, "00" after 40 ns;
end tb;