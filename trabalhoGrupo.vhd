library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity trabalhoGrupo is
    generic(X : natural := 4);
	port (
		M, Q: in std_logic_vector(x - 1 downto 0);
		clk, reset: in std_logic;
		S: out std_logic_vector(x + x - 1 downto 0);
        acabou: out std_logic;
		aShiftT, APT: out std_logic_vector(x-1 downto 0);
		nT, npt: out std_logic_vector(3 downto 0)
	);
end trabalhoGrupo;

architecture arch of trabalhoGrupo is

	component bo
    port (
		M, Q: in std_logic_vector(x - 1 downto 0);
		clk, novoNum: in std_logic;
		S: out std_logic_vector(x + x - 1 downto 0);
        nZero: out std_logic;
		aShiftT, APT: out std_logic_vector(x-1 downto 0);
		nT, npt: out std_logic_vector(3 downto 0)
	);
	end component;

    component controle
    port(
	clk, nZero, reset: in std_logic;
	novoNum, acabou: out std_logic
	);
    end component;
	 	
signal novoNum, nZero: std_logic;

begin

    bo1: bo port map (M, Q, clk, novoNum, S, nZero, aShiftT, APT, nT, nPt);
    bc1: controle port map (clk, nZero, reset, novoNum, acabou);

   

end arch;