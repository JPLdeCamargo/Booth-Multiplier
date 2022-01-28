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
		nT, npt: out std_logic_vector(3 downto 0);
		novoNumT: out std_logic;
		q0pt: out std_logic;
		statesT: out std_logic_vector (1 downto 0)
	);
end trabalhoGrupo;

architecture arch of trabalhoGrupo is

	component bo
    port (
	    M, Q: in std_logic_vector(x - 1 downto 0);
		clk, novoNum, carga, cargaM: in std_logic;
		S: out std_logic_vector(x + x - 1 downto 0);
        nZero: out std_logic;
        aShiftT, APT: out std_logic_vector(x-1 downto 0);
        nT, npt: out std_logic_vector(3 downto 0);
		q0pt: out std_logic
	);
	end component;

    component controle
    port(
	clk, nZero, reset: in std_logic;
	novoNum, acabou, carga, cargaM: out std_logic;
	statesT: out std_logic_vector (1 downto 0)
	);
    end component;
	 	
signal novoNum, nZero, carga, cargaM: std_logic;

begin

    bo1: bo port map (M, Q, clk, novoNum, carga, cargaM, S, nZero, aShiftT, APT, nT, nPt, q0pt);
    bc1: controle port map (clk, nZero, reset, novoNum, acabou, carga, cargaM, statesT);
	novoNumT <= novoNum;
   

end arch;