library IEEE;
use IEEE.std_logic_1164.all;

entity ApproxAdder is
    port(A,B: in std_logic_vector(7 downto 0);
    Ci: in std_logic;
    S: out std_logic_vector(7 downto 0);
    Co: out std_logic);
end ApproxAdder;

Architecture Structure of ApproxAdder is
    signal C: std_logic_vector(2 downto 0);
    signal G: std_logic_vector(7 downto 0);
    signal Carry: std_logic_vector(2 downto 0);
    signal CPredict: std_logic_vector(2 downto 0);
    signal BP: std_logic_vector(2 downto 0);
  
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
        SumGenerator4: adder2 port map (A(7 downto 6), B(7 downto 6), Carry(2), S(7 downto 6), Co);


end Structure;
