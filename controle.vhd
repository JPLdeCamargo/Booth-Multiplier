library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity controle is
port(
	clk, nZero, reset: in std_logic;
	novoNum, acabou: out std_logic
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
    
    COMB: process(eAtual, nZero)
    begin
        case eAtual is
            when start =>
					 novoNum <= '1';
					 acabou <= '0';
                eprox <= calcular;
            when calcular =>
					 novoNum <= '0';
                eProx <= checar;
            when checar => 
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