LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY igualazero IS
generic(x : natural := 3);
PORT (a : IN STD_LOGIC_VECTOR(2 downto 0);
igual : OUT STD_LOGIC);
END igualazero;

ARCHITECTURE estrutura OF igualazero IS
signal zeros: std_logic_vector(x - 1 downto 0) := (OTHERS => '0');
BEGIN
	igual <= '1' WHEN A = zeros ELSE '0';
END estrutura;