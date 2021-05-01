library IEEE;
use IEEE.std_logic_1164.all;

entity CarryPredict is
port(A, B: in std_logic_vector(1 downto 0);  
    CPredict, BP: out std_logic);

end CarryPredict;

architecture behavior of CarryPredict is

begin
    
    CPredict <= (A(1) and B(1)) or (A(0) and B(0) and (A(1) xor B(1)));
    BP <= (A(1) xor B(1)) and (A(0) xor B(0));

end behavior;
