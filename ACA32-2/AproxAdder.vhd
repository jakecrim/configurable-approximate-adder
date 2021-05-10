library IEEE;
use IEEE.std_logic_1164.all;

entity ApproxAdder is
    port(A,B: in std_logic_vector(31 downto 0);
    Ci: in std_logic;
    S: out std_logic_vector(31 downto 0);
    Co: out std_logic);
end ApproxAdder;

Architecture Structure of ApproxAdder is
    signal C: std_logic_vector(14 downto 0);
    signal G: std_logic_vector(31 downto 0);
    signal Carry: std_logic_vector(14 downto 0);
    signal CPredict: std_logic_vector(14 downto 0);
    signal BP: std_logic_vector(14 downto 0);
  
    component adder2
        port(A,B: in std_logic_vector(1 downto 0);
        Ci: in std_logic;
        S: out std_logic_vector(1 downto 0);
        Co: out std_logic);
    end component;

    component CarrySelectUnit
        port(Control, Cpredict, Cout, BP, G: in std_logic;  
            Cin: out std_logic);
    end component;
        
    component CarryPredict
        port(A, B: in std_logic_vector(1 downto 0);
            CPredict, BP: out std_logic);
    end component;
    begin
	G <= A and B;
	    -- Section 1
        SumGenerator1: adder2 port map (A(1 downto 0), B(1 downto 0), Ci, S(1 downto 0), C(0));
        CarryPredict1: CarryPredict port map (A(1 downto 0), B(1 downto 0), CPredict(0), BP(0));
        CSU1: CarrySelectUnit port map ('0', CPredict(0), C(0), BP(0), G(0), Carry(0));
    	-- Section 2    
        SumGenerator2: adder2 port map (A(3 downto 2), B(3 downto 2), Carry(0), S(3 downto 2), C(1));
        CarryPredict2: CarryPredict port map (A(3 downto 2), B(3 downto 2), CPredict(1), BP(1));
        CSU2: CarrySelectUnit port map ('0', CPredict(1), C(1), BP(1), G(1), Carry(1));
        -- Section 3
        SumGenerator3: adder2 port map (A(5 downto 4), B(5 downto 4), Carry(1), S(5 downto 4), C(2));
        CarryPredict3: CarryPredict port map (A(5 downto 4), B(5 downto 4), CPredict(2), BP(2));
        CSU3: CarrySelectUnit port map ('0', CPredict(2), C(2), BP(2), G(2), Carry(2));
        -- Section 4
        SumGenerator4: adder2 port map (A(7 downto 6), B(7 downto 6), Carry(2), S(7 downto 6), C(3));
        CarryPredict4: CarryPredict port map (A(7 downto 6), B(7 downto 6), CPredict(3), BP(3));
        CSU4: CarrySelectUnit port map ('0', CPredict(3), C(3), BP(3), G(3), Carry(3));
        -- Section 5
        SumGenerator5: adder2 port map (A(9 downto 8), B(9 downto 8), Carry(3), S(9 downto 8), C(4));
        CarryPredict5: CarryPredict port map (A(9 downto 8), B(9 downto 8), CPredict(4), BP(4));
        CSU5: CarrySelectUnit port map ('0', CPredict(4), C(4), BP(4), G(4), Carry(4));
        -- Section 6
        SumGenerator6: adder2 port map (A(11 downto 10), B(11 downto 10), Carry(4), S(11 downto 10), C(5));
        CarryPredict6: CarryPredict port map (A(11 downto 10), B(11 downto 10), CPredict(5), BP(5));
        CSU6: CarrySelectUnit port map ('0', CPredict(5), C(5), BP(5), G(5), Carry(5));
        -- Section 7
        SumGenerator7: adder2 port map (A(13 downto 12), B(13 downto 12), Carry(5), S(13 downto 12), C(6));
        CarryPredict7: CarryPredict port map (A(13 downto 12), B(13 downto 12), CPredict(6), BP(6));
        CSU7: CarrySelectUnit port map ('0', CPredict(6), C(6), BP(6), G(6), Carry(6));
        -- Section 8
        SumGenerator8: adder2 port map (A(15 downto 14), B(15 downto 14), Carry(6), S(15 downto 14), C(7));
        CarryPredict8: CarryPredict port map (A(15 downto 14), B(15 downto 14), CPredict(7), BP(7));
        CSU8: CarrySelectUnit port map ('0', CPredict(7), C(7), BP(7), G(7), Carry(7));
        -- Section 9
        SumGenerator9: adder2 port map (A(17 downto 16), B(17 downto 16), Carry(7), S(17 downto 16), C(8));
        CarryPredict9: CarryPredict port map (A(17 downto 16), B(17 downto 16), CPredict(8), BP(8));
        CSU9: CarrySelectUnit port map ('0', CPredict(8), C(8), BP(8), G(8), Carry(8));
        -- Section 10
        SumGenerator10: adder2 port map (A(19 downto 18), B(19 downto 18), Carry(8), S(19 downto 18), C(9));
        CarryPredict10: CarryPredict port map (A(19 downto 18), B(19 downto 18), CPredict(9), BP(9));
        CSU10: CarrySelectUnit port map ('0', CPredict(9), C(9), BP(9), G(9), Carry(9));
        -- Section 11
        SumGenerator11: adder2 port map (A(21 downto 20), B(21 downto 20), Carry(9), S(21 downto 20), C(10));
        CarryPredict11: CarryPredict port map (A(21 downto 20), B(21 downto 20), CPredict(10), BP(10));
        CSU11: CarrySelectUnit port map ('0', CPredict(10), C(10), BP(10), G(10), Carry(10));
        -- Section 12
        SumGenerator12: adder2 port map (A(23 downto 22), B(23 downto 22), Carry(10), S(23 downto 22), C(11));
        CarryPredict12: CarryPredict port map (A(23 downto 22), B(23 downto 22), CPredict(11), BP(11));
        CSU12: CarrySelectUnit port map ('0', CPredict(11), C(11), BP(11), G(11), Carry(11));
        -- Section 10
        SumGenerator13: adder2 port map (A(25 downto 24), B(25 downto 24), Carry(11), S(25 downto 24), C(12));
        CarryPredict13: CarryPredict port map (A(25 downto 24), B(25 downto 24), CPredict(12), BP(12));
        CSU13: CarrySelectUnit port map ('0', CPredict(12), C(12), BP(12), G(12), Carry(12));
        -- Section 14
        SumGenerator14: adder2 port map (A(27 downto 26), B(27 downto 26), Carry(12), S(27 downto 26), C(13));
        CarryPredict14: CarryPredict port map (A(27 downto 26), B(27 downto 26), CPredict(13), BP(13));
        CSU14: CarrySelectUnit port map ('0', CPredict(13), C(13), BP(13), G(13), Carry(13));
        -- Section 15
        SumGenerator15: adder2 port map (A(29 downto 28), B(29 downto 28), Carry(13), S(29 downto 28), C(14));
        CarryPredict15: CarryPredict port map (A(29 downto 28), B(29 downto 28), CPredict(14), BP(14));
        CSU15: CarrySelectUnit port map ('0', CPredict(14), C(14), BP(14), G(14), Carry(14));

        -- Section 16
        SumGenerator16: adder2 port map (A(31 downto 30), B(31 downto 30), Carry(14), S(31 downto 30), Co);


end Structure;
