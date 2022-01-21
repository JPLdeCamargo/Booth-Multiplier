LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY registrador IS
generic(X : natural := 4);
PORT (clk, reset, carga : IN STD_LOGIC;
	  d : IN STD_LOGIC_VECTOR(x - 1 DOWNTO 0);
	  q : OUT STD_LOGIC_VECTOR(x - 1 DOWNTO 0));
END;

ARCHITECTURE estrutura OF IS
signal zero: std_logic_vector(x - 1 downto 0) := (OTHERS => '0');
BEGIN
	PROCESS(clk, reset)
	BEGIN
		IF(reset = '1') THEN
			q <= zero;
		ELSIF(clk'EVENT AND clk = '1' AND carga = '1') THEN
			q <= d;
		END IF;
	END PROCESS;
END estrutura;