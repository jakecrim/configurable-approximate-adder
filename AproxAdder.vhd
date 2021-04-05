library IEEE;
use IEEE.std_logic_1164.all;


entity AproxAdder is
    port(A,B: in std_logic_vector(7 downto 0);
    Ci: in std_logic;
    S: out std_logic_vector(7 downto 0);
    Co: out std_logic);
end AproxAdder;

Architecture Structure of ApproxAdder is
  
    entity adder2 is
        port(P,G: in std_logic_vector(1 downto 0);
        Ci: in std_logic;
        S: out std_logic_vector(1 downto 0);
        Co: out std_logic);
    end adder2;

    entity CarrySelectUnit is
        port(Control, Cpredict, Cout, BP, G: in std_logic;  
            Cin: out std_logic);
    end CarrySelectUnit;
        
    entity CarryPredict is
        port(A, B: in std_logic_vector(1 downto 0);;  
            CPredict, BP: out std_logic);
    end CarryPredict;
    signal C: std_logic_vector(2 downto 0);
    signal Carry: std_logic_vector(2 downto 0);
    signal CPredict: std_logic_vector(2 downto 0);
    signal BP: std_logic_vector(2 downto 0);

    begin
        
        SumGenerator1: adder2 port map (A(1 downto 0), B(1 downto 0), Ci, S(1 downto 0), C(0));
        CarryPredict1: CarryPredict port map (A(1 downto 0), B(1 downto 0), CPredict(0), BP(0));
        CSU1: CarrySelectUnit port map (1, CPredict(0), C(0), BP(0), (A(1) and B(1)), Carry(0));
        
        SumGenerator2: adder2 port map (A(3 downto 2), B(3 downto 2), Carry(0), S(3 downto 2), C(1));
        CarryPredict2: CarryPredict port map (A(3 downto 2), B(3 downto 2), CPredict(1), BP(1));
        CSU1: CarrySelectUnit port map (1, CPredict(1), C(1), BP(1), (A(3) and B(3)), Carry(1));
        
        SumGenerator3: adder2 port map (A(5 downto 4), B(5 downto 4), Carry(1), S(5 downto 4), C(2));
        CarryPredict3: CarryPredict port map (A(5 downto 4), B(5 downto 4), CPredict(2), BP(2));
        CSU1: CarrySelectUnit port map (1, CPredict(2), C(2), BP(2), (A(5) and B(5)), Carry(2));
        
        SumGenerator4: adder2 port map (A(7 downto 6), B(7 downto 6), Carry(2), S(7 downto 6), Cout);


end Structure;
