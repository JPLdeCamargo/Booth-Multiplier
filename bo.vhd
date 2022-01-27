library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity bo is
    generic(X : natural := 4);
	port (
	    M, Q: in std_logic_vector(x - 1 downto 0);
		clk, novoNum, carga, cargaM: in std_logic;
		S: out std_logic_vector(x + x - 1 downto 0);
        nZero: out std_logic;
        aShiftT, APT: out std_logic_vector(x-1 downto 0);
        nT, npt: out std_logic_vector(3 downto 0);
        q0pt: out std_logic
        
	);
end bo;

architecture arch of bo is

	component registrador
    PORT (clk, reset, carga : IN STD_LOGIC;
	  d : IN std_logic_vector(x - 1 DOWNTO 0);
	  q : OUT std_logic_vector(x - 1 DOWNTO 0));
	end component;

    component igualazero
    PORT (a : IN std_logic_vector(3 downto 0);
    igual : OUT STD_LOGIC);
    end component;

    component ula
    port(A, M: in std_logic_vector(X-1 downto 0);
	ulaop: in std_logic_vector(1 downto 0);
	APo: out std_logic_vector(X - 1 downto 0)
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
    PORT ( a, b : IN std_logic_vector(x - 1 DOWNTO 0);
         sel: IN STD_LOGIC;
         y : OUT std_logic_vector(x - 1 DOWNTO 0));
    end component;
	 
	 component registrador1bit
	 PORT (clk, reset, carga : IN STD_LOGIC;
	  d : IN STD_LOGIC;
	  q : OUT STD_LOGIC);
	 END component;
	 	
	signal AP, QP, MP, Aula, qShift, mShift, mQ, mN: std_logic_vector(x - 1 downto 0);
    signal AShift: std_logic_vector (x - 1 downto 0) := (OTHERS => '0');
    signal Q0shift: std_logic := '0';
	 signal Q0p: std_logic;
    signal entN: std_logic_vector(3 downto 0) := "0100"; 
    signal N, np: std_logic_vector(3 downto 0);

begin


    muxQ: mux port map (Qshift, Q, novoNum, mQ);
    muxN: mux port map (np, entN, novoNum, mN);
    regisA: registrador port map (clk, novoNum, carga, Ashift, AP);
    regisQ: registrador port map (clk, '0', carga, mQ, QP);
    regisM: registrador port map (clk, '0', cargaM, M, MP);
    regisQ0: registrador1bit port map (clk, novoNum, carga, q0shift, Q0P);
    regisN: registrador port map (clk, '0', carga, mN, n);

    ULA1: ula port map (AP, MP, Q(0) & Q0P, Aula);
    np <= n - 1;
    shiftRight1: shiftRight port map (Aula, Q, AShift, QShift, q0shift);
    S <= AP & QP;
    igualazero1: igualazero port map (n, nZero);
    aShiftT <= ashift;
    APT <= AP;
    nT <= n;
    npt <= np;
    q0pT <= q0p;



end arch;