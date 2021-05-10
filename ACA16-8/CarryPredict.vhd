library IEEE;
use IEEE.std_logic_1164.all;

entity CarryPredict is
port(A, B: in std_logic_vector(7 downto 0);  
    CPredict, BP: out std_logic);

end CarryPredict;

architecture behavior of CarryPredict is
signal G: std_logic_vector(7 downto 0);
signal P: std_logic_vector(7 downto 0);
begin
    -- generate and propogate
    G <= A and B;
    P <= A xor B;

    CPredict <= G(7) or (G(6)and P(7)) or (G(5) and P(6) and P(7)) or (G(4) and P(5) and P(6) and P(7))
	 or (G(3) and P(4) and P(5) and P(6) and P(7)) or (G(2) and P(3) and P(4) and P(5) and P(6) and P(7)) 
	 or (G(1) and P(2) and P(3) and P(4) and P(5) and P(6) and P(7))
 	 or (G(0) and P(1) and P(2) and P(3) and P(4) and P(5) and P(6) and P(7));

    -- Product of P's
    BP <= P(7) and P(6) and P(5) and P(4) and P(3) and P(2) and P(1) and P(0);

end behavior;
