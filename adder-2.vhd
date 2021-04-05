library IEEE;
use IEEE.std_logic_1164.all;

entity adder2 is
    port(P,G: in std_logic_vector(1 downto 0);
    Ci: in std_logic;
    S: out std_logic_vector(1 downto 0);
    Co: out std_logic);
end adder2;

Architecture Structure of adder2 is

    component FullAdder
        port(A,B, Cin: in std_logic;
        Cout, Sum: out std_logic);
    end component;

    -- *NOT SURE WHICH*
    -- signal C: std_logic_vector(1 downto 1);
    signal C: std_logic;
    
    begin
        -- *NOT SURE WHICH*
        -- FA1: FullAdder port map (P(0), G(0), Ci, C(1), S(0));
        -- FA2: FullAdder port map (P(1), G(1), C(1), Co, S(1));
        FA1: FullAdder port map (P(0), G(0), Ci, C, S(0));
        FA2: FullAdder port map (P(1), G(1), C, Co, S(1));


end Structure;
