library IEEE;
use IEEE.std_logic_1164.all;

entity adder4 is
    port(A,B: in std_logic_vector(3 downto 0);
    Ci: in std_logic;
    S: out std_logic_vector(3 downto 0);
    Co: out std_logic);
end adder4;

Architecture Structure of adder4 is

    component FullAdder
        port(A,B, Cin: in std_logic;
        Cout, Sum: out std_logic);
    end component;

    signal C: std_logic;
    
    begin
        FA1: FullAdder port map (A(0), B(0), Ci, C(1), S(0));
        FA2: FullAdder port map (A(1), B(1), C(1), C(2), S(1));
        FA3: FullAdder port map (A(2), B(2), C(2), C(3), S(2));
        FA4: FullAdder port map (A(3), B(3), C(3), Co, S(3));


end Structure;
