library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is
	generic(X : natural := 4);
	port(A, M: in std_logic_vector(X-1 downto 0);
	ulaop: in std_logic_vector(1 downto 0);
	AP: out signed(X - 1 downto 0)
	);

end ula;

architecture arc of ula is
signal tempAP, soma, subtracao: std_logic_vector (X-1 downto 0);
begin

soma <= A + M;
subtracao <= A - M;


with ulaop select
	tempAP <= soma when "01",
				subtracao when "10",
				A when others;
				
AP <= tempAP;				
end arc;