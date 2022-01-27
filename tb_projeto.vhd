library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_projeto is
end tb_projeto;

architecture tb of tb_projeto is
    signal AShiftT, APT, M, Q, nt, npt:std_logic_vector(3 downto 0);
    signal S: std_logic_vector (7 downto 0);
    signal clk, reset, acabou, novonumT: std_logic;
    constant clk_period: time := 20ns;
begin
    UUT : entity work.trabalhoGrupo port map 
	            (M, Q, clk, reset, S, acabou, AshiftT, APT, nt, npt, novoNumT);
    reset <= '1', '0' after 50 ns; 
    M <= "1001";
    Q <= "0011";
    clk_gen : process
        begin
                clk <= '1';
            wait for clk_period/2; -- 50% do periodo pra cada nivel
                clk <= '0';
                wait for clk_period/2;
        end process;
end tb;