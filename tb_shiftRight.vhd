library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_shiftRight is
end tb_shiftRight;

architecture tb of tb_shiftRight is
    signal A, Q, AF, QF:std_logic_vector(7 downto 0);
    signal Q0F: std_logic;
begin
    UUT : entity work.shiftRight port map 
	            (A => A, Q => Q, AF => AF, QF => QF, Q0F => Q0F);
    A <= "01110101";
    Q <= "01101011";
end tb;