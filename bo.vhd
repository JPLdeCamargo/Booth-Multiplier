library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bo is
    generic(X : natural := 4);
	port (
		A, M, Q: in std_logic_vector(x - 1 downto 0);
		clk, reset, carga, Q0, novoNum: in std_logic;
		S: out std_logic_vector(x + x downto 0);
        nZero: out std_logic
	);
end bo;

architecture arch of bo is

	component registrador
    PORT (clk, reset, carga : IN STD_LOGIC;
	  d : IN STD_LOGIC_VECTOR(x - 1 DOWNTO 0);
	  q : OUT STD_LOGIC_VECTOR(x - 1 DOWNTO 0));
	end component;

    component igualazero
    PORT (a : IN STD_LOGIC_VECTOR(2 downto 0);
    igual : OUT STD_LOGIC);
    end component;

    component ula
    port(A, M: in std_logic_vector(X-1 downto 0);
	ulaop: in std_logic_vector(1 downto 0);
	AP: out signed(X - 1 downto 0)
	);
    end component;

    component shiftRight
    port(
        A, Q: in std_logic_vector (x - 1 downto 0);
        AF,  QF: out std_logic_vector (x - 1 downto 0);
        Q0F: out std_logic
    );
    end component;

    component mux
    PORT ( a, b : IN STD_LOGIC_VECTOR(x - 1 DOWNTO 0);
         sel: IN STD_LOGIC;
         y : OUT STD_LOGIC_VECTOR(x - 1 DOWNTO 0));
    end component;
	
	signal AP, QP, MP, Aula, qShift, mQ: std_logic_vector(x - 1 downto 0);
    signal AShift: std_logic_vector (x - 1 downto 0) := (OTHERS => '0');
    signal Q0shift: std_logic := '0';
    signal entN: std_logic_vector(2 downto 0) := "100"; 
    signal N, np: std_logic_vector(2 downto 0);

begin


    muxQ: mux port map (Qshift, Q, novoNum, mQ);
    muxM: mux port map (Mshift, M, novoNum, mM);
    muxN: mux port map (np, entN, novoNum, mN);
    regisA: registrador port map (clk, reset, carga, Ashift, AP);
    regisQ: registrador port map (clk, '0', carga, mQ, QP);
    regisM: registrador port map (clk, '0', carga, mM, MP);
    regisQ0: registrador port map (clk, reset, carga, q0shift, Q0P);
    regisN: registrador port map (clk, '0', carga, mN, n)

    ULA1: ula port map (AP, MP, Q(0) & Q0, Aula);
    np <= n - 1;
    shiftRight1: shiftRight port map (Aula, Q, AShift, QShift, q0shift);

    igualazero1: igualazero port map (n, nZero);


end arch;

	