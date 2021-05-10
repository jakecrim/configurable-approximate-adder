library IEEE;
use IEEE.std_logic_1164.all;

entity ApproxAdder is
    port(A,B: in std_logic_vector(15 downto 0);
    Ci: in std_logic;
    S: out std_logic_vector(15 downto 0);
    Co: out std_logic);
end ApproxAdder;

Architecture Structure of ApproxAdder is
    signal C: std_logic_vector(2 downto 0);
    signal G: std_logic_vector(15 downto 0);
    signal Carry: std_logic_vector(2 downto 0);
    signal CPredict: std_logic_vector(2 downto 0);
    signal BP: std_logic_vector(2 downto 0);
  
    component adder4
        port(A,B: in std_logic_vector(3 downto 0);
        Ci: in std_logic;
        S: out std_logic_vector(3 downto 0);
        Co: out std_logic);
    end component;

    component CarrySelectUnit
        port(Control, Cpredict, Cout, BP, G: in std_logic;  
            Cin: out std_logic);
    end component;
        
    component CarryPredict
        port(A, B: in std_logic_vector(3 downto 0);
            CPredict, BP: out std_logic);
    end component;
    begin
	G <= A and B;
	    -- Section 1
        -- *NOTE* Should C(1) become --> C(?)
        -- *NOTE* Should CSU1,2 etc lines change any?

        SumGenerator1: adder4 port map (A(3 downto 0), B(3 downto 0), Ci, S(3 downto 0), C(0));
        CarryPredict1: CarryPredict port map (A(3 downto 0), B(3 downto 0), CPredict(0), BP(0));
        CSU1: CarrySelectUnit port map ('0', CPredict(0), C(0), BP(0), G(0), Carry(0));
    	-- Section 2    
        SumGenerator2: adder4 port map (A(7 downto 4), B(7 downto 4), Carry(0), S(7 downto 4), C(1));
        CarryPredict2: CarryPredict port map (A(7 downto 4), B(7 downto 4), CPredict(1), BP(1));
        CSU2: CarrySelectUnit port map ('0', CPredict(1), C(1), BP(1), G(1), Carry(1));
        -- Section 3
        SumGenerator3: adder4 port map (A(11 downto 8), B(11 downto 8), Carry(1), S(11 downto 8), C(2));
        CarryPredict3: CarryPredict port map (A(11 downto 8), B(11 downto 8), CPredict(2), BP(2));
        CSU3: CarrySelectUnit port map ('0', CPredict(2), C(2), BP(2), G(2), Carry(2));
       	-- Section 4
        SumGenerator4: adder4 port map (A(15 downto 12), B(15 downto 12), Carry(2), S(15 downto 12), Co);

end Structure;
