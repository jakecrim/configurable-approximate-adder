library IEEE;
use IEEE.std_logic_1164.all;

entity CarryPredict is
port(A, B: in std_logic_vector(3 downto 0);  
    CPredict, BP: out std_logic);

end CarryPredict;

architecture behavior of CarryPredict is
signal G: std_logic_vector(3 downto 0);
signal P: std_logic_vector(3 downto 0);
begin
    -- generate and propogate
    G <= A and B;
    P <= A xor B;

    CPredict <= G(3) or (G(2)and P(3)) or (G(1) and P(2) and P(3)) or (G(0) and P(1) and P(2) and P(3));
    -- Product of P's
    BP <= P(3) and P(2) and P(1) and P(0);

end behavior;
