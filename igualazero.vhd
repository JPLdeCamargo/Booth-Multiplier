LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


ENTITY igualazero IS
generic(x : natural := 4);
PORT (a : IN std_logic_vector(3 downto 0);
igual : OUT STD_LOGIC);
END igualazero;

ARCHITECTURE estrutura OF igualazero IS
signal zeros: std_logic_vector(x - 1 downto 0) := (OTHERS => '0');
BEGIN
	igual <= '1' WHEN A = zeros ELSE '0';
END estrutura;