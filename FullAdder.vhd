library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder is
    port(A, B: in std_logic;
    Cin: in std_logic; -- inputs
    Sum: out std_logic;
    Cout: out std_logic);
end FullAdder;

Architecture Structure of FullAdder is

begin
    Sum <= A xor B xor Cin;

    -- normal Cout FullAdder
    Cout <= (A and B) or (A and Cin) or (B and Cin);

    -- *Propogate Generate Cout*

end Structure;

