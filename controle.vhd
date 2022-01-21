library ieee;
use ieee.std_logic_1164.all;

entity controle is
port(
	clk, nZero, q1, q0, reset: in std_logic;
	rst, novoNum, acabou: out std_logic;
	selULA: in std_logic_vector (1 downto 0)
	);
end controle;

architecture Controlearc of controle is
    type STATES is (start, calcular, checar, fim);
    signal eProx, eAtual: STATES;
    

begin
    
    REG: process(clk, reset)
    begin
        if (reset = '1') then 
            eAtual <= start;
        elsif (clk'event AND clk = '1') then
            eAtual <= eProx;
        end if;
    end process;
    
    COMB: process(eAtual, nZero, q1, q0)
    begin
        case eAtual is
            when start =>
                rst <= '1';
					 novoNum <= '1';
					 acabou <= '0';
                eprox <= calcular;
            when calcular =>
                rst <= '0';
					 novoNum <= '0';
                eProx <= checar;
            when checar => 
                rst <= '0';
					 novoNum <= '0';
                if(nZero = '1') then
                    eProx <= fim;
                else
                    eProx <= calcular;
                end if;
            when fim =>
                acabou <= '1';
                eProx <= start;
        end case;
    end process;
end Controlearc;