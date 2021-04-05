library IEEE;
use IEEE.std_logic_1164.all;

entity adder2 is
    port(A,B: in std_logic_vector(1 downto 0);
    Ci: in std_logic;
    S: out std_logic_vector(1 downto 0);
    Co: out std_logic);
end adder2;

Architecture Structure of adder2 is

    component FullAdder
        port(A,B, Cin: in std_logic;
        Cout, Sum: out std_logic);
    end component;

    signal C: std_logic;
    
    begin
        FA1: FullAdder port map (A(0), B(0), Ci, C, S(0));
        FA2: FullAdder port map (A(1), B(1), C, Co, S(1));


end Structure;
